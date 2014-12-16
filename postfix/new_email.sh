#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No username specified
#   2 - No e-mail specified
#  99 - Not running as root.

if [ `id -u` -ne 0  ]
then
    echo "Script must be run as root!"
    exit 99
fi;

if [ -z "$1" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it after the script name:"
    echo "  sh $0 USER_NAME e-mail"
    exit 1
fi;

if [ -z "$2" ]
then
    echo "This script requires an e-mail as parameter."
    echo "Please specify it next to the user name:"
    echo "  sh $0 user_name E-MAIL"
    exit 2
fi;

/usr/sbin/useradd -m -d /home/e-mails/$1 -s /sbin/nologin -c "$2" $1
passwd $1

vi /etc/postfix/virtual
/usr/sbin/postmap /etc/postfix/virtual
/etc/init.d/postfix restart
