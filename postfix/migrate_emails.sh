#!/bin/bash
# EXIT values:
#   0 - OK
#   1 - No shadow file.
#  99 - Not running as root.

if [ `id -u` -ne 0  ]
then
    echo "Script must be run as root!"
    exit 99
fi;

if [ ! -e ./shadow  ]
then
    echo "No shadow file on current dir!"
    exit 1
fi;


FILE="passwd_emails"
TARGET_SHADOW="/etc/shadow"
TARGET_SHADOW_TMP="/etc/shadow_tmp"
SIZE="`cat $FILE | wc -l`"
let COUNT=0

while [ "$SIZE" != "$COUNT" ];
do
	let COUNT=$COUNT+1
	USER="`sed -n $COUNT,${COUNT}p $FILE | cut -d: -f1`"
	COMMENT="`sed -n $COUNT,${COUNT}p $FILE | cut -d: -f2`"
	SHADOW="`sed -n $COUNT,${COUNT}p $FILE | cut -d: -f3`"

	mv /home/tmarques/mails/home/$USER /home/e-mails/
	/usr/sbin/useradd -d /home/e-mails/$USER -M -s /sbin/nologin -c "$COMMENT" $USER
#	userdel -r -f $USER
	chown $USER:$USER -R /home/e-mails/$USER

	# Build the new entry with local shadow
	NEW_ENTRY="`tail -n 1 shadow`";
	NEW_ENTRY="${NEW_ENTRY#*:}"; 
	NEW_ENTRY="${NEW_ENTRY#*:}";
	NEW_ENTRY="$USER:$SHADOW:$NEW_ENTRY";
	head -n -1 $TARGET_SHADOW > $TARGET_SHADOW_TMP;
	echo $NEW_ENTRY >> $TARGET_SHADOW_TMP;
	rm $TARGET_SHADOW;
	mv $TARGET_SHADOW_TMP $TARGET_SHADOW;
	chmod 600 $TARGET_SHADOW;
	chown root:root $TARGET_SHADOW;
done
