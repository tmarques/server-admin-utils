FILE="passwd"
FILE2="shadow"
SIZE="`cat $FILE | wc -l`"
let COUNT=0

while [ "$SIZE" != "$COUNT" ];
do
	let COUNT=$COUNT+1
	STRING="`sed -n $COUNT,${COUNT}p $FILE`"
	STRING2="`sed -n $COUNT,${COUNT}p $FILE2`"
	NAME="`echo $STRING | cut -d: -f1`"
	COMMENT="`echo $STRING | cut -d: -f5`"
	CONSOLE="`echo $STRING | cut -d: -f7`"
	SHADOW="`echo $STRING2 | cut -d: -f2`"
	echo $NAME:$COMMENT:$SHADOW:$CONSOLE
done
