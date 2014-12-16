#!/bin/bash

if [ `id -u` -ne 0  ]
then
    echo "Script must be run as root!"
    exit 99
fi;

if [ -z "$1" ]
then
    echo "No username provided."
    echo "Please call the script like:"
    echo "   sudo sh $0 user"
    exit 1;
fi;

cp -av /etc/skel/.bash* /home/$1
chown $1:$1 /home/$1/.bash*
