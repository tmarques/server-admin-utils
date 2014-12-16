#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No user name specified
#   2 - No database name specified
#   3 - No table name specified

if [ -z "$1" ]
then
    echo "This script requires a username to be passed."
    echo "Please specify it after the script file name:"
    echo "-> sh $0 USER_NAME database_name table_name"
    exit 1
fi;

if [ -z "$2" ]
then
    echo "This script requires a database name to be"
    echo "passed. Please specify it after the user name:"
    echo "-> sh $0 user_name DB_NAME table_name"
    exit 2
fi;

if [ -z "$3" ]
then
    echo "This script requires a table name to be"
    echo "passed. Please specify it after the db name:"
    echo "-> sh $0 user_name db_name TABLE_NAME"
    exit 3
fi;

mysqldump -u $1 -p $2 $3
