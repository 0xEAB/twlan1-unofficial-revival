#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   OpenSSL module

if [ -d "$TWLAN_REVIVAL_SSL" ]; then
    echo $'\033[1;33mOpenSSL target directory already exists.
    \033[1;35mSkipping OpenSSL installation...\033[m'
else
    if ! [ -f "openssl-0.9.8zh" ]; then
        echo $'\033[0;33m[#]\033[m Downloading and extracting OpenSSL'
        curl -s "https://www.openssl.org/source/old/0.9.x/openssl-0.9.8zh.tar.gz" | tar -xz
    fi

    pushd "openssl-0.9.8zh" >>$TWLAN_REVIVAL_LOG
    mkdir $TWLAN_REVIVAL_SSL

    echo $'\033[0;33m[#]\033[m Configuring OpenSSL'
    ./config \
        no-shared \
        --prefix="$TWLAN_REVIVAL_SSL" \
        --openssldir="$TWLAN_REVIVAL_SSL" \
        >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Building OpenSSL'
    make -j $TWLAN_REVIVAL_JOB >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Installing OpenSSL'
    make install >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    popd >>$TWLAN_REVIVAL_LOG
fi
