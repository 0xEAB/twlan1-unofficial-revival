#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   Setup script

TLINE="--------------------------------------------------"
TDIR=$(dirname $(realpath $0))

echo $'\033[1;36mTWLan 1: Unofficial Revival - setup script
\033[m'$TLINE"
"

set -e

## Load config
. "$TDIR/config"

## Prepare logfiles
echo '



' >>$TWLAN_REVIVAL_LOG
date >>$TWLAN_REVIVAL_LOG
echo '



' >>$TWLAN_REVIVAL_ERR
date >>$TWLAN_REVIVAL_ERR

## Installation directory
if [ -d "$TWLAN_REVIVAL_DIR" ]; then
    echo $'\033[0;33m[!]\033[m Installation directory already existing:' $TWLAN_REVIVAL_DIR$'
    \033[1;35mWill skip the installation of existing components.\033[m
'

    ### Check write-access
    if ! [ -w "$TWLAN_REVIVAL_DIR" ]; then
        echo $'\033[0;33m[x]\033[m Installation directory is not accessible for writing:' $TWLAN_REVIVAL_DIR$'
    \033[1;31mAborting.'
        exit 1
    fi
else
    echo $'\033[0;33m[#]\033[m Creating installation directory:' $TWLAN_REVIVAL_DIR
    mkdir $TWLAN_REVIVAL_DIR
    echo ''
fi

## Build directory
if [ -d "$TWLAN_REVIVAL_TMP" ]; then
    echo $'\033[0;33m[!]\033[m Build directory already existing:' $TWLAN_REVIVAL_TMP$'
    \033[1;35mWill skip the download of existing source files.\033[m
'

    ### Check write-access
    if ! [ -w "$TWLAN_REVIVAL_TMP" ]; then
        echo $'\033[0;33m[x]\033[m Build directory is not accessible for writing:' $TWLAN_REVIVAL_TMP$'
    \033[1;31mAborting.'
        exit 1
    fi
else
    mkdir $TWLAN_REVIVAL_TMP
fi

## Parallel execution
echo $'\033[0;33m[i]\033[m Executing up to\033[1;32m' $TWLAN_REVIVAL_JOB $'jobs concurrently\033[m

'"$TLINE
"

## Build
pushd $TWLAN_REVIVAL_TMP >>$TWLAN_REVIVAL_LOG
. "$TDIR/components/openssl.sh"
. "$TDIR/components/php4.sh"
. "$TDIR/components/eaccelerator.sh"
. "$TDIR/components/tw1content.sh"

echo 'Done.'
