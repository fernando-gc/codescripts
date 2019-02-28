#!/bin/bash

for i in $( cat iplist.txt )
do
ping -q -c1 -W 1 $i > /dev/null

if [ $? -eq 0 ]
then
echo $i "Ping"
else
echo $i "No-Ping"
fi
done

