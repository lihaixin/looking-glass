#!/bin/bash

if [ -t 1 ]; then
	export PS1="\e[1;34m[\e[1;33m\u@\e[1;32mD-\h\e[1;37m:\w\[\e[1;34m]\e[1;36m\\$ \e[0m"
fi

if [ -f "/etc/envfile" ]; then
export $(grep -v '^#' /etc/envfile | xargs)
fi

: ${MainINF:=$(ip route | grep "default via" |awk '{ print $5}')}
: ${MainIP:=$(/sbin/ifconfig $MainINF | grep 'inet' | awk '{ print $2}' | awk -F ":" '{print $2 }' | head -n 1)}
IP=$(curl -s  ip.sb)
# Aliases
alias l='ls -lAsh --color'
alias ls='ls -C1 --color'
alias cp='cp -ip'
alias rm='rm -i'
alias mv='mv -i'
alias tmux='tmux -u'
alias h='cd ~;clear;'
alias reboot='kill -9 `pgrep php-fpm` 1> /dev/null 2>&1;sleep 1;pkill -s 1'

echo -e -n '\E[1;34m'
figlet -k -f big -c -m-1 -w 120 "Welcome `hostname`"
echo " # ------------------------------------------------------------------------------------------------ #"
echo " # 在线测试网速的小工具,部署到海外机房,特别适合需要经常测试主机到各地网络的用户 "
echo " # $DOCKERID (外网IP) 测速地址: http://$IP:80 （如更改映射的端口，请使用对应端口替换80）"
echo " # $DOCKERID (内网IP) 测速地址: http://$MainIP:80  （如更改映射的端口，请使用对应端口替换80）"
echo " # "
echo " # 更多信息访问网页查看： https://hub.docker.com/r/lihaixin/looking-glass "
echo " # ------------------------------------------------------------------------------------------------ #"
if [ -f "/etc/member" ]; then
echo " # "
QQ=`cat /etc/envfile | grep QQ | awk -F "=" '{ print $2}'`
echo " # 技术支持QQ: $QQ"
fi
echo -e -n '\E[1;34m'
echo -e '\E[0m'
