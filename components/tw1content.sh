#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   TWLan 1 content module

if [ -d "$TWLAN_REVIVAL_WWW" ]; then
    echo $'\033[0;33m[!]\033[1;33m Content target directory already exists.
    \033[1;35mSkipping PHP4 installation...\033[m'
else
    echo $'\033[0;33m[i]\033[m Content'

    if ! [ -d 'twlan/htdocs' ]; then
        echo $'\033[0;33m[#]\033[m Downloading and extracting content'
        curl -s 'http://twlan.lekensteyn.nl/files/twlan-1.4.3L1.sh' | tail -n+133 | tar -xz twlan/htdocs twlan/extra/dslan.sql
    fi

    echo $'\033[0;33m[#]\033[m Installing content'
    cp -R 'twlan/htdocs' "$TWLAN_REVIVAL_WWW"
    cp 'twlan/extra/dslan.sql' "$TWLAN_REVIVAL_DIR"
fi

echo "
$TLINE
"
