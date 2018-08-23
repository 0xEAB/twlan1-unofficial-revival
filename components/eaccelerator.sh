#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   eAccelerator module

if [ -f "$TWLAN_REVIVAL_PHP/lib/php/extensions/no-debug-non-zts-20020429/eaccelerator.so" ]; then
    echo $'\033[0;33m[!]\033[1;33m eAccelerator is already installed.
    \033[1;35mSkipping eAccelerator installation...\033[m'
else
    echo $'\033[0;33m[i]\033[m eAccelerator'

    if ! [ -d 'eaccelerator-eaccelerator-c09f08b' ]; then
        echo $'\033[0;33m[#]\033[m Downloading and extracting eAccelerator'
        ## v0.9.5.3 hasn't been tagged...
        curl -Ls \
            "https://api.github.com/repos/eaccelerator/eaccelerator/tarball/c09f08b0c23a3c67fbf9b9a283beb43bf661da80" \
            | tar -xz
    fi

    pushd 'eaccelerator-eaccelerator-c09f08b' >>$TWLAN_REVIVAL_LOG

    echo $'\033[0;33m[#]\033[m Preparing build environment for eAccelerator'
    $TWLAN_REVIVAL_PHP/bin/phpize >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Configuring eAccelerator'
    ./configure \
        --enable-eaccelerator=shared \
        --with-php-config="$TWLAN_REVIVAL_PHP/bin/php-config" \
        >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Building eAccelerator'
    make -j $TWLAN_REVIVAL_JOB >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Installing eAccelerator'
    make install >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    popd >>$TWLAN_REVIVAL_LOG
fi

echo "
$TLINE
"
