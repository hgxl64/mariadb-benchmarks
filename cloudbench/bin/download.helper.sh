#!/bin/bash
#
# (w) Axel XL Schwenke for MariaDB
#
# $Id$

source ${CBENCH_HOME}/bin/cbench.sh

USAGE="usage: $0
        --software mariadb | galera | raft | maxscale (default: mariadb)

        --mariadb-source ... (default: jenkins)
        --mariadb-branch ... (default: ENTERPRISE/12.3-enterprise)
        --mariadb-commit ... (default: latest)

        --galera-source ... (default: jenkins)
        --galera-branch ... (default: GALERA-ENTERPRISE/es-mariadb-4.x)
        --galera-commit ... (default: latest)

        --raft-source ... (default: jenkins)
        --raft-branch ... (default: CRAFT/main)
        --raft-commit ... (default: latest)

        --maxscale-source ... (default: jenkins)
        --maxscale-version ... (default: maxscale-25.10.3-release)

        -h|--help
"

COMMAND_LINE="$@"


while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        # what to download
        --software)                     SOFTWARE="$1"; shift;;

        # mariadb
        --mariadb-source)               MARIADB_SOURCE="$1"; shift;;
        --mariadb-branch)               MARIADB_BRANCH="$1"; shift;;
        --mariadb-commit)               MARIADB_COMMIT="$1"; shift;;

        # galera
        --galera-source)                GALERA_SOURCE="$1"; shift;;
        --galera-branch)                GALERA_BRANCH="$1"; shift;;
        --galera-commit)                GALERA_COMMIT="$1"; shift;;

        # raft
        --raft-source)                  RAFT_SOURCE="$1"; shift;;
        --raft-branch)                  RAFT_BRANCH="$1"; shift;;
        --raft-commit)                  RAFT_COMMIT="$1"; shift;;

        # maxscale
        --maxscale-source)              MAXSCALE_SOURCE="$1"; shift;;
        --maxscale-version)             MAXSCALE_VERSION="$1"; shift;;

        --arm)                          OPTION_ARM=TRUE;;

        -h|--help)                      echo -e "$USAGE"; exit 1;;
        *)  echo "Invalid input switch: $key"; echo -e "COMMAND_LINE = ${COMMAND_LINE}"; echo -e "$USAGE"; exit 1;;
    esac
done


# set defaults

[[ ${SOFTWARE} ]] || SOFTWARE="mariadb"

[[ ${MARIADB_SOURCE} ]] || MARIADB_SOURCE="jenkins"
[[ ${MARIADB_BRANCH} ]] || MARIADB_BRANCH="ENTERPRISE/12.3-enterprise"
[[ ${MARIADB_COMMIT} ]] || MARIADB_COMMIT="latest"

[[ ${GALERA_SOURCE} ]] || GALERA_SOURCE="jenkins"
[[ ${GALERA_BRANCH} ]] || GALERA_BRANCH="GALERA-ENTERPRISE/es-mariadb-4.x"
[[ ${GALERA_COMMIT} ]] || GALERA_COMMIT="latest"

[[ ${RAFT_SOURCE} ]] || RAFT_SOURCE="jenkins"
[[ ${RAFT_BRANCH} ]] || RAFT_BRANCH="CRAFT/main"
[[ ${RAFT_COMMIT} ]] || RAFT_COMMIT="latest"

[[ ${MAXSCALE_SOURCE} ]]  || MAXSCALE_SOURCE="jenkins"
[[ ${MAXSCALE_RELEASE} ]] || MAXSCALE_RELEASE="maxscale-25.10.3-release"

# MariaDB/Galera/Raft OS
if [[ ! ${OS} ]] ; then
    OS="ubuntu-2404"
    [[ ${OPTION_ARM} = TRUE ]] && OS="ubuntu-2404-arm"
fi

# maxscale OS
if [[ ! ${MAXSCALE_OS} ]] ; then
    MAXSCALE_OS="ubuntu/noble"
fi

# target architecture
if [[ ! ${ARCH} ]] ; then
    ARCH="x86_64"
    [[ ${OPTION_ARM} = TRUE ]] && ARCH="aarch64"
fi



# download

case ${SOFTWARE} in

    mariadb)

        if [[ ${MARIADB_SOURCE} == 'jenkins' ]] ; then
            echo "Downloading MariaDB Enterprise Server from es-repo.mariadb.net"

            [[ -f build.properties ]] && rm build.properties
            BASE_URL="https://es-repo.mariadb.net/jenkins/${MARIADB_BRANCH}/${MARIADB_COMMIT}"
            echo "  download build.properties"
            if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                        --password=$(vault 'jenkins_es_package_pass') \
                        --quiet ${BASE_URL}/build.properties)
            then
                error "failed to download '${BASE_URL}/build.properties'"
            fi
            echo "  found ${BASE_URL}/build.properties"
            COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
            echo "  found commit ${COMMIT}"
            TARGET="${DOWNLOAD_DIR}/mariadb-enterprise-${COMMIT}-${ARCH}.tar.gz"
            if [[ -f ${TARGET} ]] ; then
                echo "${TARGET} already exists, not downloading"
            else
                VERSION=$(fgrep FULL_VERSION build.properties | cut -d= -f 2)
                BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/mariadb-enterprise-${VERSION}-Linux-${ARCH}.tar.gz"
                echo "  downloading '${TARGET}'"
                echo "  from '${BINTAR_URL}'"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                          --password=$(vault 'jenkins_es_package_pass') \
                          --quiet ${BINTAR_URL} -O ${TARGET})
                then
                    error "failed to download '${BINTAR_URL}'"
                fi
            fi
            rm build.properties
            echo "use with --mariadb-tarball $(basename ${TARGET})"
        else
            error "Invalid MariaDB source specified: $MARIADB_SOURCE"
        fi
        ;;


    galera)

        if [[ ${GALERA_SOURCE} == 'jenkins' ]] ; then
            echo "Downloading Galera from es-repo.mariadb.net/jenkins"

            [[ -f build.properties ]] && rm build.properties
            BASE_URL="https://es-repo.mariadb.net/jenkins/${GALERA_BRANCH}/${GALERA_COMMIT}"
            echo "  download build.properties"
            if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                        --password=$(vault 'jenkins_es_package_pass') \
                        --quiet ${BASE_URL}/build.properties)
            then
                error "failed to download '${BASE_URL}/build.properties'"
            fi
            echo "  found ${BASE_URL}/build.properties"
            COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
            echo "  found commit ${COMMIT}"
            TARGET="${DOWNLOAD_DIR}/galera-enterprise-${COMMIT}-${ARCH}.tar.gz"
            if [[ -f ${TARGET} ]] ; then
                echo "${TARGET} already exists, not downloading"
            else
                DIR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/"
                echo "  downloading dir list to find package name"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                          --password=$(vault 'jenkins_es_package_pass') \
                          --quiet ${DIR_URL} -O dirlist)
                then
                    error "failed to download '${DIR_URL}'"
                fi
                DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
                BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/${DISTFILE}"
                echo "  downloading '${TARGET}'"
                echo "  from '${BINTAR_URL}'"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                          --password=$(vault 'jenkins_es_package_pass') \
                          --quiet ${BINTAR_URL} -O ${TARGET})
                then
                    error "failed to download '${BINTAR_URL}'"
                fi
                rm -f dirlist
            fi
            echo "use with --galera-tarball $(basename ${TARGET})"
            rm -f build.properties
        else
            error "Invalid Galera source specified: $GALERA_SOURCE"
        fi
        ;;

    raft)

        if [[ ${RAFT_SOURCE} == 'jenkins' ]] ; then
            echo "Downloading Raft from es-repo.mariadb.net/jenkins"

            [[ -f build.properties ]] && rm build.properties
            BASE_URL="https://es-repo.mariadb.net/jenkins/${RAFT_BRANCH}/${RAFT_COMMIT}"
            echo "  download build.properties"
            if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                        --password=$(vault 'jenkins_es_package_pass') \
                        --quiet ${BASE_URL}/build.properties)
            then
                error "failed to download '${BASE_URL}/build.properties'"
            fi
            echo "  found ${BASE_URL}/build.properties"
            COMMIT=$(fgrep GIT_COMMIT build.properties | cut -d= -f 2 | head -c 11)
            echo "  found commit ${COMMIT}"
            TARGET="${DOWNLOAD_DIR}/mariadb-raft-${COMMIT}-${ARCH}.tar.gz"
            if [[ -f ${TARGET} ]] ; then
                echo "${TARGET} already exists, not downloading"
            else
                DIR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/"
                echo "  downloading dir list to find package name"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                          --password=$(vault 'jenkins_es_package_pass') \
                          --quiet ${DIR_URL} -O dirlist)
                then
                    error "failed to download '${DIR_URL}'"
                fi
                DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
                BINTAR_URL="${BASE_URL}/bintar/${OS}/RelWithDebInfo/${DISTFILE}"
                echo "  downloading '${TARGET}'"
                echo "  from '${BINTAR_URL}'"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                          --password=$(vault 'jenkins_es_package_pass') \
                          --quiet ${BINTAR_URL} -O ${TARGET})
                then
                    error "failed to download '${BINTAR_URL}'"
                fi
                rm -f dirlist
            fi
            echo "use with --raft-tarball $(basename ${TARGET})"
            rm build.properties
        else
            error "Invalid Raft source specified: $RAFT_SOURCE"
        fi
        ;;

    maxscale)

        if [[ ${MAXSCALE_SOURCE} == 'jenkins' ]] ; then
            echo "Downloading MaxScale from mdbe-ci-repo.mariadb.net"

            BASE_URL="https://mdbe-ci-repo.mariadb.net/MaxscaleEnterprise/${MAXSCALE_RELEASE}/bintar/${MAXSCALE_OS}/${ARCH}"
            echo "  downloading dirlist to find name of package"
            if ( ! wget --user=$(vault 'maxscale_packages_user') \
                        --password=$(vault 'maxscale_packages_pass') \
                        --quiet ${BASE_URL}/ -O dirlist )
            then
                error "failed to download '${BASE_URL}'"
            fi
            DISTFILE=$(cat dirlist | perl -ne 'print "$1\n" if (/<a href="(.*?\.tar\.gz)"/)' | head -1)
            TARGET="${DOWNLOAD_DIR}/${DISTFILE%.tar.gz}-${ARCH}.tar.gz"
            rm dirlist
            echo "  package name is ${DISTFILE}"
            if [[ -f ${TARGET} ]] ; then
                echo "${TARGET} already exists, not downloading"
            else
                echo "  downloading '${TARGET}'"
                echo "  from '${BASE_URL}/${DISTFILE}'"
                if ( ! wget --user=$(vault 'maxscale_packages_user') \
                          --password=$(vault 'maxscale_packages_pass') \
                          --quiet ${BASE_URL}/${DISTFILE} -O ${TARGET})
                then
                    error "failed to download '${BASE_URL}/${DISTFILE}'"
                fi
            fi
            echo "use with --maxscale-tarball $(basename ${TARGET})"
        else
            error "Invalid MaxScale source specified: $MAXSCALE_SOURCE"
        fi
        ;;

esac
