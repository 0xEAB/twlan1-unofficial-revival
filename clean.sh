#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   Cleanup script

## Check if not embedded
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo $'\033[1;36mTWLan 1: The Unofficial Revival - cleanup script\033[m
    '

    ## Ask for confirmation
    read -p $'\033[0;33m[?]\033[m Are you sure you want to remove all build files? [y/N] ' -r
    if ! [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "Aborting."
        exit 0
    fi

    ## Load config
    . $(dirname $0)/config
fi

## Here we go
echo ""

## Purge build directory if it exists
if [ -d "$TWLAN_REVIVAL_TMP" ]; then
    echo $'\033[0;33m[#]\033[m Purging build directory: $TWLAN_REVIVAL_TMP'
    rm -rf $TWLAN_REVIVAL_TMP
else
    echo $'\033[0;33m[!]\033[m Build directory does not exist:' $TWLAN_REVIVAL_TMP $'
    \033[1;35mSkipping.\033[m'
fi
