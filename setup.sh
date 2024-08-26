#!/bin/bash

git clone https://github.com/neo7530/ossl.git /usr/local/ssl
echo '/usr/local/ssl/lib' > /etc/ld.so.conf.d/openssl-3.0.8.conf
/sbin/ldconfig -v
mv /usr/bin/openssl /usr/bin/openssl.backup
echo 'OPENSSL_PATH="/usr/local/ssl/bin"' > /etc/profile.d/openssl.sh
echo 'export OPENSSL_PATH' >> /etc/profile.d/openssl.sh
echo 'PATH=$PATH:$OPENSSL_PATH' >> /etc/profile.d/openssl.sh
echo 'export PATH'>> /etc/profile.d/openssl.sh
chmod +x /etc/profile.d/openssl.sh
source /etc/profile.d/openssl.sh
openssl version -a
rm -r /var/www/dashboard
rm -r /usr/local/sbin
rm -r /usr/local/bin
git clone https://github.com/neo7530/pistar_dash /var/www/dashboard
# cp -r /tmp/dashboard/.git /var/www/dashboard/
git clone https://github.com/neo7530/pistar_sbin /usr/local/sbin
# cp -r /tmp/sbin/.git /usr/local/sbin/
git clone https://github.com/neo7530/pistar_bin /usr/local/bin
# cp -r /tmp/bin/.git /usr/local/bin/
pistar-update
