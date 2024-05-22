##!/bin/bash

source rt_functions.sh
source ${RT_HOME}/config/global

# -------------------
# command line processing
# -------------------

USAGE="usage: $0

Installs MariaDB server from various sources
Options:
    --database mariadb-enterprise|mariadb-community
    --source jenkins|git
    --branch ...
    --buildtype ...
    --commit ...
    --release ...
    -h|--help
Examples:
    $0 --source jenkins --buildtype release --release 10.6.16-11
    $0 --source jenkins --buildtype snapshot --branch 10.6-enterprise --commit latest
    $0 --source git --branch 10.6-enterprise --commit 0815badc0de
"

COMMAND_LINE="$@"

while [[ $# > 0 ]] ; do
    key="$1"; shift;
    case ${key} in
        --database)                     DATABASE="$1"; shift;;
        --source)                       SOURCE="$1"; shift;;
        --buildtype)                    BUILDTYPE="$1"; shift;;
        --release)                      RELEASE="$1"; shift;;
        --branch)                       BRANCH="$1"; shift;;
        --commit)                       COMMIT="$1"; shift;;
        -h|--help)                      echo -e "$USAGE"; exit 1;;
        *)  msg "Invalid input switch: $key"; msg "COMMAND_LINE = ${COMMAND_LINE}"; error "${USAGE}";;
    esac
done


# -------------------
# setup logdir
# -------------------

TEST_NAME=install.server
if [[ ! ${LOGDIRECTORY} ]]
then
    export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S%3N_${TEST_NAME})
    mkdir -p ${LOGDIRECTORY}
fi


# -------------------
# main script
# -------------------

{

    if [[ ${DATABASE} == 'mariadb-enterprise' ]]
    then

        source ${RT_HOME}/config/mariadb-enterprise

        if [[ ${SOURCE} == 'jenkins' ]]
        then
            if [[ ${BUILDTYPE} == 'release' ]]
            then
                msg "downloading release '${RELEASE}' from Jenkins"
                BASE_URL="${JENKINS_URL}/RELEASES/ES/${RELEASE}"
                HERE=$PWD
                TMP=$(mktemp -d --tmpdir)
                cd $TMP

                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                            --password=$(vault 'jenkins_es_package_pass') \
                            ${BASE_URL}/build.properties)
                then
                    cd $HERE
                    rm -rf $TMP
                    error "failed to download '${BASE_URL}/build.properties'"
                fi

                info "found ${BASE_URL}/build.properties"
                COMMIT=$(fgrep GIT_COMMIT build.properties | sed 's/GIT_COMMIT=//' | head -c 11)
                TARGETDIR="${INSTALLDIR}/mariadb-enterprise-${BRANCH}-${COMMIT}"
                commit_info ${COMMIT}

                if [[ -d ${TARGETDIR} ]]
                then
                    msg "${TARGETDIR} exists, assuming it's already there"
                    set_targetdir ${TARGETDIR}
                    exit 2
                fi

                BINTAR_URL="${BASE_URL}/bintar/${JENKINS_OS}/RelWithDebInfo/mariadb-enterprise-${RELEASE}-${JENKINS_ARCH}.tar.gz"
                mkdir -p ${TARGETDIR}
                mv build.properties ${TARGETDIR}

                info "downloading bintar package from ${BINTAR_URL}"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                            --password=$(vault 'jenkins_es_package_pass') \
                            ${BINTAR_URL})
                then
                    cd $HERE
                    rm -rf $TMP
                    rf -rf ${TARGETDIR}
                    error "failed to download '${BINTAR_URL}'"
                fi

                info "unpacking bintar package 'mariadb-enterprise-${RELEASE}-${JENKINS_ARCH}.tar.gz'"
                tar xfz mariadb-enterprise-${RELEASE}-${JENKINS_ARCH}.tar.gz
                info "moving 'mariadb-enterprise-${RELEASE}-${JENKINS_ARCH}' to '${TARGETDIR}'"
                mv -t ${TARGETDIR} mariadb-enterprise-${RELEASE}-${JENKINS_ARCH}/*

                msg "download to ${TARGETDIR} succeeded"
                cd $HERE
                rm -rf $TMP
                set_targetdir ${TARGETDIR}
                exit 0

            elif [[ ${BUILDTYPE} == 'snapshot' ]]
            then
                [[ ! ${BRANCH} ]] && error "$0 : branch not specified!"
                [[ ! ${COMMIT} ]]  && COMMIT="latest"

                msg "downloading shapshot '${BRANCH}'/'${COMMIT}' from Jenkins"
                BASE_URL="${JENKINS_URL}/ENTERPRISE/${BRANCH}/${COMMIT}"
                TMP=$(mktemp -d --tmpdir)
                HERE=$PWD
                cd $TMP

                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                            --password=$(vault 'jenkins_es_package_pass') \
                            ${BASE_URL}/build.properties)
                then
                    cd $HERE
                    rm -rf $TMP
                    unset TARGETDIR
                    error "failed to download '${BASE_URL}/build.properties'"
                fi

                info "found ${BASE_URL}/build.properties"

                COMMIT=$(fgrep GIT_COMMIT build.properties | sed 's/GIT_COMMIT=//' | head -c 11)
                VERSION=$(fgrep FULL_VERSION build.properties | sed 's/FULL_VERSION=//')
                BINTAR_URL="${BASE_URL}/bintar/${JENKINS_OS}/RelWithDebInfo/mariadb-enterprise-${VERSION}-${JENKINS_ARCH}.tar.gz"
                TARGETDIR="${INSTALLDIR}/mariadb-enterprise-${BRANCH}-${COMMIT}"
                commit_info ${COMMIT}

                if [[ -d ${TARGETDIR} ]]
                then
                    msg "${TARGETDIR} exists, assuming it's already there"
                    cd $HERE
                    rm -rf $TMP
                    set_targetdir ${TARGETDIR}
                    exit 2
                fi

                mkdir -p ${TARGETDIR}
                mv build.properties ${TARGETDIR}

                info "downloading bintar package from ${BINTAR_URL}"
                if ( ! wget --user=$(vault 'jenkins_es_package_user') \
                            --password=$(vault 'jenkins_es_package_pass') \
                            ${BINTAR_URL})
                then
                    cd $HERE
                    rm -rf $TMP
                    rf -rf ${TARGETDIR}
                    error "failed to download '${BINTAR_URL}'"
                fi

                info "unpacking bintar package 'mariadb-enterprise-${VERSION}-${JENKINS_ARCH}.tar.gz'"
                tar xfz mariadb-enterprise-${VERSION}-${JENKINS_ARCH}.tar.gz
                info "moving 'mariadb-enterprise-${VERSION}-${JENKINS_ARCH}' to '${TARGETDIR}'"
                mv -t ${TARGETDIR} mariadb-enterprise-${VERSION}-${JENKINS_ARCH}/*

                msg "download to ${TARGETDIR} succeeded"
                cd $HERE
                rm -rf $TMP
                set_targetdir ${TARGETDIR}
                exit 0

            else
                error "$0: unknown build type '${BUILDTYPE}' for source 'jenkins'"
            fi

        elif [[ ${SOURCE} = 'git' ]]
        then
            #safeguard: make sure git repo is cloned locally
            if [[ ! -d ${LOCAL_GIT_REPO} ]]
            then
                msg "cloning ${GIT_REPO} into ${LOCAL_GIT_REPO}"
                mkdir -p $(dirname ${LOCAL_GIT_REPO})
                cd $(dirname ${LOCAL_GIT_REPO})
                git clone ${GIT_REPO} $(basename ${LOCAL_GIT_REPO}) >> ${LOGDIRECTORY}/git.log 2>&1
            fi

            cd ${LOCAL_GIT_REPO}
            git fetch >> ${LOGDIRECTORY}/git.log 2>&1

            # if commit is given, it is checked out and that's it
            # commit can be a hash but also a tag
            # ottherwise if branch is given, we checkout the head

            if [[ ${COMMIT} ]]
            then
                msg "checking out commit ${COMMIT}"
                git checkout ${COMMIT}  >> ${LOGDIRECTORY}/git.log 2>&1
                COMMIT1=$(git log -n 1 --oneline | cut -d ' ' -f 1)
                if [[ $COMMIT != $COMMIT1 ]]
                then
                    msg "checked out ${COMMIT} is really ${COMMIT1}"
                    COMMIT=$COMMIT1
                fi

            elif [[ ${BRANCH} ]]
            then
                msg "checking out branch ${BRANCH}"
                git checkout ${BRANCH}  >> ${LOGDIRECTORY}/git.log 2>&1
                git pull                >> ${LOGDIRECTORY}/git.log 2>&1
                git checkout --detach   >> ${LOGDIRECTORY}/git.log 2>&1
                git branch -d ${BRANCH} >> ${LOGDIRECTORY}/git.log 2>&1
                COMMIT=$(git log -n 1 --oneline | cut -d ' ' -f 1)
                msg "HEAD of branch ${BRANCH} is commit ${COMMIT}"
            else
                error "$0: neither commit nor branch given for source 'git'"
            fi

            TARGETDIR="${INSTALLDIR}/mariadb-enterprise-${BRANCH}-${COMMIT}"
            commit_info ${COMMIT}
            if [[ -d ${TARGETDIR} ]]
            then
                msg "${TARGETDIR} exists, assuming it's already there"
                set_targetdir ${TARGETDIR}
                exit 2
            fi

            msg "building MariaDB Enterprise Server branch '${BRANCH}' commit '${COMMIT}'"
            if ( ! build_enterprise_from_git.sh ${TARGETDIR} )
            then
                error "build failure, check log in ${LOGDIRECTORY}"
            fi

            msg "building to ${TARGETDIR} succeeded"
            set_targetdir ${TARGETDIR}
            exit 0

        else
            error "$0: unknown source '${SOURCE}' for database '${DATABASE}'"
        fi

    elif [[ ${DATABASE} == 'mariadb-community' ]]
    then

        source ${RT_HOME}/config/mariadb-community

        if [[ ${SOURCE} == 'git' ]]
        then
            #safeguard: make sure git repo is cloned locally
            if [[ ! -d ${LOCAL_GIT_REPO} ]]
            then
                msg "cloning ${GIT_REPO} into ${LOCAL_GIT_REPO}"
                mkdir -p $(dirname ${LOCAL_GIT_REPO})
                cd $(dirname ${LOCAL_GIT_REPO})
                git clone ${GIT_REPO} $(basename ${LOCAL_GIT_REPO}) >> ${LOGDIRECTORY}/git.log 2>&1
            fi

            cd ${LOCAL_GIT_REPO}
            git fetch >> ${LOGDIRECTORY}/git.log 2>&1

            # if commit is given, it is checked out and that's it
            # commit can be a hash but also a tag
            # ottherwise if branch is given, we checkout the head

            if [[ ${COMMIT} ]]
            then
                msg "checking out commit ${COMMIT}"
                git checkout ${COMMIT}  >> ${LOGDIRECTORY}/git.log 2>&1
                COMMIT1=$(git log -n 1 --oneline | cut -d ' ' -f 1)
                if [[ $COMMIT != $COMMIT1 ]]
                then
                    msg "checked out ${COMMIT} is really ${COMMIT1}"
                    COMMIT=$COMMIT1
                fi

            elif [[ ${BRANCH} ]]
            then
                msg "checking out branch ${BRANCH}"
                git checkout ${BRANCH}  >> ${LOGDIRECTORY}/git.log 2>&1
                git pull                >> ${LOGDIRECTORY}/git.log 2>&1
                git checkout --detach   >> ${LOGDIRECTORY}/git.log 2>&1
                git branch -d ${BRANCH} >> ${LOGDIRECTORY}/git.log 2>&1
                COMMIT=$(git log -n 1 --oneline | cut -d ' ' -f 1)
                msg "HEAD of branch ${BRANCH} is commit ${COMMIT}"
            else
                error "$0: neither commit nor branch given for source 'git'"
            fi

            TARGETDIR="${INSTALLDIR}/mariadb-community-${BRANCH}-${COMMIT}"
            commit_info ${COMMIT}
            if [[ -d ${TARGETDIR} ]]
            then
                msg "${TARGETDIR} exists, assuming it's already there"
                set_targetdir ${TARGETDIR}
                exit 2
            fi

            msg "building MariaDB Community Server branch '${BRANCH}' commit '${COMMIT}'"
            if ( ! build_community_from_git.sh ${TARGETDIR} )
            then
                error "build failure, check log in ${LOGDIRECTORY}"
            fi

            msg "building to ${TARGETDIR} succeeded"
            set_targetdir ${TARGETDIR}
            exit 0

        else
            error "$0: source '${SOURCE}' not implemented for database '${DATABASE}'"
        fi

    else
        error "$0: unknown database '${DATABASE}'"
    fi

} > ${LOGDIRECTORY}/${TEST_NAME}.log 2>&1

exit
