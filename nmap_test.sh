#!/bin/bash
PORT='6556'

for IP in `cat ./nmap-ip.txt`
do
        printf "$IP\t"

        LOOKUP_RES=`nmap -p $PORT -Pn $IP`

        FAIL_COUNT=`echo $LOOKUP_RES | grep "0 hosts up" | wc -l`;
        if [ $FAIL_COUNT -eq 1 ]
        then
             NAME='Host is down';

        else
             TEST1=`echo $LOOKUP_RES | grep open | wc -l`;
        if [ $TEST1 -eq 1 ]
        then
             NAME='open'

        else
             TEST2=`echo $LOOKUP_RES | grep filtered | wc -l`;
        if [ $TEST2 -eq 1 ]
        then
             NAME='filtered'

        else
             TEST3=`echo $LOOKUP_RES | grep closed | wc -l`;
        if [ $TEST3 -eq 1 ]
        then
             NAME='closed'


        fi
        fi
        fi
        fi
        echo $NAME

done
