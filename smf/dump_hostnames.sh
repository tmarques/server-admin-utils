#!/bin/bash

TMPFILE="/tmp/dump_hostnames.txt"

if [ -z $1 ];
then
	echo "No country code passed as argument. Please use" 
	echo "a code like \"PT\" for Portugal as the first argument"
	echo "for the script."
	exit;
fi;

#mysql forumMD -u root -p -e "SELECT member_ip FROM smf_members WHERE code2=\"$1\";"
eval "mysql forumMD -u root -p -e \"SELECT member_ip FROM smf_members WHERE code2='$1';\" > $TMPFILE"

for I in `cat $TMPFILE`
do
	host $I
done

rm $TMPFILE;
