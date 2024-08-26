#!/bin/bash

rpi-rw
# mkdir /usr/local/src
# git clone https://github.com/neo7530/rpi-ossl32.git /usr/local/src/openssl-3.0.8
# cd /usr/local/src/openssl-3.0.8
# make install
echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/openssl-3.0.8.conf
/sbin/ldconfig -v
mv /usr/bin/openssl /usr/bin/openssl.backup
echo 'OPENSSL_PATH="/usr/local/ssl/bin"' > /etc/profile.d/openssl.sh
echo 'export OPENSSL_PATH' >> /etc/profile.d/openssl.sh
echo 'PATH=$PATH:$OPENSSL_PATH' >> /etc/profile.d/openssl.sh
echo 'export PATH'>> /etc/profile.d/openssl.sh
chmod +x /etc/profile.d/openssl.sh
/etc/profile.d/openssl.sh
openssl version -a
