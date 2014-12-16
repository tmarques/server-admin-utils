#!/bin/bash

find $1 -type f -exec chmod 660 {} \;
find $1 -type d -exec chmod 770 {} \;
#chmod 755 $2
chown -R root:root $1
