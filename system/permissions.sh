#!/bin/bash

find $2 -type f -exec chmod 660 {} \;
find $2 -type d -exec chmod 770 {} \;
#chmod 770 $2
chown -R $1:$1 $2
