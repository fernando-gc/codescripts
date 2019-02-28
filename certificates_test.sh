#!/bin/sh
for url in `cat ./url.txt`
do
        printf "$url\t"

        TEST_RES=`/opt/omd/versions/1.4.0p1.cre/lib/nagios/plugins/check_http -I $url -p 443 -C 30,15 --sni`

        echo $TEST_RES

done
