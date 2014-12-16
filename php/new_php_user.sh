#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No username specified
#   2 - Default UMASK not 007
#  99 - Not running as root.

if [ `id -u` -ne 0  ]
then
    echo "Script must be run as root!"
    exit 99
fi;

if [ -z "$1" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it next to the"
    echo "script name: sh $0 \"username\" \"description\""
    exit 1
fi;

if [ -z "$2" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it next to the"
    echo "script name: sh $0 \"username\" \"description\""
    exit 1
fi;

#if [ -z "`cat /etc/login.defs | grep UMASK | grep 007`" ]
#then
#	echo "Please change default umask (/etc/login.defs) to 007"
#	exit 2;
#fi;

HOME_TEMPLATE=/home/www/$1

/usr/sbin/useradd -m -d $HOME_TEMPLATE -s /bin/bash -c "$2" $1
mkdir $HOME_TEMPLATE/php
mkdir $HOME_TEMPLATE/log
chown -R $1:$1 $HOME_TEMPLATE
chmod 770 $HOME_TEMPLATE
usermod -a -G $1 nginx
#passwd $1

#DIR="`pwd`/`dirname $0`"

#cp $DIR/rvm_install.sh /home/$1/
#chown $1:$1 /home/$1/rvm_install.sh

#service nginx restart
