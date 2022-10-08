#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

if [ -f "/etc/envfile" ]; then
export $(grep -v '^#' /etc/envfile | xargs)
fi

IP=$(curl -s  ip.sb)
COUNTRY=`curl ipinfo.io/country  2>/dev/null || curl ipinfo.io/country 2>/dev/null`

: ${LG_ip4:=$IP}
: ${LG_loc:=$COUNTRY}
: ${LG_sitename:=Looking-Glass}
: ${LG_testfiles:=25MB 50MB 100MB}
: ${LG_siteurl:=https://lg.my.site}

export LG_ip4 LG_loc LG_sitename LG_siteurl
chmod 4755 /usr/bin/traceroute

ntp &
set -e
cd /app/LookingGlass
chmod +x autoconfig.sh
rm -rf Config.php
bash autoconfig.sh
chown nginx: ./*
chown nginx: ratelimit.db

nginx
php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.conf -c /etc/php7/php.ini
