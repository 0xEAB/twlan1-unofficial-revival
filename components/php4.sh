#!/usr/bin/env bash
# TWLan 1: The Unofficial Revival
#   PHP4 module

if [ -d "$TWLAN_REVIVAL_PHP" ]; then
    echo $'\033[0;33m[!]\033[1;33m PHP4 target directory already exists.
    \033[1;35mSkipping PHP4 installation...\033[m'
else
    echo $'\033[0;33m[i]\033[m PHP4'

    ## Workaround bad lib detection on many systems
    ##  It might look a bit patchy
    ##  but the symlink solution turned out to be the least painfull one.
    if ! [ -f '/usr/lib/libpng.so' ]; then
        LIB_PNG=$(locate 'libpng.so' | head -n 1)
        if [ -z "$LIB_PNG" ]; then
            echo $'\033[0;33m[x]\033[m Cannot locate \'libpng.so\'.
        \033[1;31mAborting.'
            exit 1
        fi
        echo $'\033[0;33m[#]\033[m Enabling \'libpng.so\' workaround'
        ln -s $LIB_PNG '/usr/lib/libpng.so'
        WORKAROUND_PNG="yes"
    fi
    if ! [ -f '/usr/lib/libjpeg.so' ]; then
        LIB_JPG=$(locate 'libjpeg.so' | head -n 1)
            if [ -z "$LIB_PNG" ]; then
            echo $'\033[0;33m[x]\033[m Cannot locate \'libjpeg.so\'.
        \033[1;31mAborting.'
            exit 1
        fi
        echo $'\033[0;33m[#]\033[m Enabling \'libjpeg.so\' workaround'
        ln -s $LIB_JPG '/usr/lib/libjpeg.so'
        WORKAROUND_JPG="yes"
    fi
    ## </workaround>

    if ! [ -d 'php-4.4.9' ]; then
        echo $'\033[0;33m[#]\033[m Downloading and extracting PHP4'
        curl -s "https://museum.php.net/php4/php-4.4.9.tar.bz2" | tar -xj
    fi

    pushd 'php-4.4.9' >>$TWLAN_REVIVAL_LOG
    mkdir $TWLAN_REVIVAL_PHP

    echo $'\033[0;33m[#]\033[m Configuring PHP4'
    ./configure \
        --prefix="$TWLAN_REVIVAL_PHP" \
        --enable-fastcgi \
        --enable-mbstring \
        --enable-shmop \
        --enable-sockets \
        --enable-sysvsem \
        --enable-sysvshm \
        --with-gettext \
        --with-gd \
        --with-libxml \
        --with-mysql \
        --with-openssl="$TWLAN_REVIVAL_SSL" \
        --with-openssl-dir="$TWLAN_REVIVAL_SSL" \
        --with-zlib \
        >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Building PHP4'
    make -j $TWLAN_REVIVAL_JOB >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    echo $'\033[0;33m[#]\033[m Installing PHP4'
    make install >>$TWLAN_REVIVAL_LOG 2>>$TWLAN_REVIVAL_ERR

    popd >>$TWLAN_REVIVAL_LOG

    if [ "$WORKAROUND_PNG" == "yes" ]; then
        echo $'\033[0;33m[#]\033[m Cleaning up \'libpng.so\' workaround'
        rm '/usr/lib/libpng.so'
    fi
    if [ "$WORKAROUND_JPG" == "yes" ]; then
        echo $'\033[0;33m[#]\033[m Cleaning up \'libjpeg.so\' workaround'
        rm '/usr/lib/libjpeg.so'
    fi
fi

echo "
$TLINE
"
