#!/bin/bash

for i in $( cat iplist.txt )
do
ttl=$(ping -c1 -W 1 $i | grep ttl | cut -f 6 -d " " | cut -f 2 -d "=")
echo $ttl

if  [[ -z $ttl ]]
then
echo $i "No-ping"

elif  [[ $ttl -le 64 ]]
then
echo $i "Linux"

elif [[ $ttl -ge 120 ]]
then
echo $i "Windows"
fi
done
