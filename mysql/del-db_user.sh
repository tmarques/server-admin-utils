#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No database name specified

if [ -z "$1" ]
then
    echo "This script requires a database name. Please"
    echo "specify it after the script file name:"
    echo "-> sh $0 DATABASE_NAME"
    exit 1
fi;

echo "This operation requires the MySQL root user."
echo "Please insert it's password now:"

( echo "
USE mysql;
DROP DATABASE $1; 
DROP USER $1@'localhost';") | mysql -u root -p
