#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No username specified
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
    echo "script name: sh $0 \"username\" \"email\""
    exit 1
fi;

if [ -z "$2" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it next to the"
    echo "script name: sh $0 \"username\" \"e-mail\""
    exit 1
fi;

/usr/sbin/useradd -m -s /bin/bash -c "$2" $1
passwd $1
chage -d0 $1 
