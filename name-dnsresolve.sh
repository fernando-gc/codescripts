#!/bin/sh
for hostnames in `cat ./hostnames.txt`
do
        printf "$hostnames\t"

        LOOKUP_RES=`nslookup -timeout=1 $hostnames`

        FAIL_COUNT=`echo $LOOKUP_RES | grep 'connection timed out' | wc -l`;

        if [ $FAIL_COUNT -eq 1 ]
        then
             IP='Bad-FQDNS\n';

        else
             IP=`echo "$LOOKUP_RES" | grep -e "Address" | tail -n 1 | cut -f 2 -d ":" | sed 's/ //'`;
        fi

        echo $IP

done
