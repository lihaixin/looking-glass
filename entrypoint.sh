#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH;ntp &
set -e

if [ -f "/etc/envfile" ]; then
export $(grep -v '^#' /etc/envfile | xargs)
fi


cd /app/LookingGlass
chmod +x autoconfig.sh
bash autoconfig.sh
chown nginx: ./*
chown nginx: ratelimit.db

nginx
php-fpm7 --nodaemonize --fpm-config /etc/php7/php-fpm.conf -c /etc/php7/php.ini
