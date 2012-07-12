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
    echo "script name: sh $0 \"username\""
    exit 1
fi;

/usr/sbin/userdel -r -f $1
#/usr/sbin/groupdel $1

exit 0;
