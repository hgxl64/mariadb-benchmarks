#!/bin/bash
#
#

set -e
set -u

TARGETDIR=${1:?usage: $0 installdir, installdir not given, cannot continue}


# -------------------
# setup logdir
# -------------------

TEST_NAME=build.community
if [[ ! ${LOGDIRECTORY} ]]
then
    export LOGDIRECTORY=${RT_LOG_HOME}/$(date +%y%m%d.%H%M%S%3N)
else
    LOGDIRECTORY=${LOGDIRECTORY}/${TEST_NAME}
fi
mkdir -p ${LOGDIRECTORY}


# -------------------
# script starts here
# -------------------

CFLAGS="-O3 -ggdb -fno-omit-frame-pointer -fno-strict-aliasing -DNDEBUG -DDBUG_OFF -Wno-maybe-uninitialized"
CXXFLAGS="$CFLAGS -felide-constructors"
CMAKE_LAYOUT_OPTS="-DINSTALL_LAYOUT=RPM -DCMAKE_INSTALL_PREFIX=$TARGETDIR -DINSTALL_SCRIPTDIR=bin \
 -DINSTALL_MYSQLDATADIR=var -DINSTALL_SBINDIR=libexec -DINSTALL_SUPPORTFILESDIR=share \
 -DINSTALL_SYSCONFDIR=etc -DINSTALL_SYSCONF2DIR=etc/my.cnf.d \
 -DINSTALL_PAMDATADIR=etc/security -DINSTALL_PAMDIR=lib64/security \
 -DINSTALL_SYSTEMD_UNITDIR=lib/systemd/system -DINSTALL_SYSTEMD_SYSUSERSDIR=lib/sysusers.d \
 -DINSTALL_SYSTEMD_TMPFILESDIR=lib/tmpfiles.d -DINSTALL_MYSQLTESTDIR=''"
CMAKE_FEATURE_OPTS="-DWITH_READLINE=1 -DWITH_SSL=system -DWITHOUT_EMBEDDED_SERVER=1 \
 -DPLUGIN_CONNECT=NO -DPLUGIN_ROCKSDB=NO -DPLUGIN_SPIDER=NO -DPLUGIN_MROONGA=NO
 -DPLUGIN_OQGRAPH=NO -DPLUGIN_SPIDER=NO"
CMAKE_BUILD_OPTS="-DCMAKE_BUILD_TYPE=RelWithDebInfo"

[[ -d build ]] && rm -rf build
mkdir build
cd build

{
    date --utc "+[%F %T] running cmake"
    cmake .. $CMAKE_BUILD_OPTS $CMAKE_LAYOUT_OPTS $CMAKE_FEATURE_OPTS \
      -DCMAKE_C_FLAGS_RELWITHDEBINFO="$CFLAGS" \
      -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="$CXXFLAGS" > ${LOGDIRECTORY}/cmake.log 2>&1

    date --utc "+[%F %T] running make"
    make -j ${NBUILD:-""} > ${LOGDIRECTORY}/make.log 2>&1

    date --utc "+[%F %T] running make install"
    make install > ${LOGDIRECTORY}/make_install.log 2>&1

    date --utc "+[%F %T] finished"
    exit 0

} 2>&1 | tee ${LOGDIRECTORY}/${TEST_NAME}.log

