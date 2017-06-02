#!/bin/bash

echo "dd if=/dev/zero of=/test.bin bs=1024 count=1000 oflag=dsync"

echo "ioping -c 10 . -D -y -WWW";
