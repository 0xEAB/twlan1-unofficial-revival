#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   Uninstall script

echo $'\033[1;36mTWLan 1: The Unofficial Revival - uninstall script\033[m
'

## Ask for confirmation
read -p $'\033[0;33m[?]\033[m Are you sure you want to remove TWLan and all of its components? [y/N] ' -r
if ! [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Aborting."
    exit 0
fi

## Here we go...
set -e
echo ""

## Load config
. $(dirname $0)/config

## Purge install directory if it exists
if [ -d "$TWLAN_REVIVAL_DIR" ]; then
    echo $'\033[0;33m[#]\033[m Purging installation directory:' $TWLAN_REVIVAL_DIR
    rm -rf $TWLAN_REVIVAL_DIR
else
    echo $'\033[0;33m[!]\033[m Installation directory does not exist:' $TWLAN_REVIVAL_DIR $'
    \033[1;35mSkipping.\033[m'
fi

## Execute cleanup script
. $(dirname $0)/clean.sh

echo "
Done."
