#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No user name specified
#   2 - No database name specified

if [ -z "$1" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it after the script file name:"
    echo "-> sh $0 USER_NAME database_name"
    exit 1
fi;

if [ -z "$2" ]
then
    echo "This script requires a database name to be"
    echo "passed. Please specify it after the user name:"
    echo "-> sh $0 user_name DATABASE_NAME"
    exit 2
fi;

mysqldump $2 -u $1 -p 
