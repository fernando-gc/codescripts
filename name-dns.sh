#!/bin/bash

while read NAMES ; do

        LOOKUP_RES=$(nslookup $NAMES | grep -v "#" | grep Address | cut -f 2 -d ":" | sed 's/ //')
        test -z "$LOOKUP_RES" && LOOKUP_RES="Failed"

        echo -e "$NAMES\t$LOOKUP_RES"

done < hostnames.txt
