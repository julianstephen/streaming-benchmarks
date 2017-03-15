#!/bin/bash
if (( $# != 3 )); then
    echo "Illegal number of parameters"
        echo "Useage: ./getbolteip.sh expfoldername boltname time"
        echo "accidentdetector avgspdtrkr pasttollcalc segcalc spdchkr tollcalculator vehloctrkr"
        exit
fi
time=${3}
port=$(grep "workerLogLink" ${1}/stormmetrics.log.${time} | grep  "id\":\"${2}"| awk -F"workerLogLink" '{print $2 }'|awk -F'["=]' '{print $4}')
worker=$(grep "workerLogLink" ${1}/stormmetrics.log.${time} | grep  "id\":\"${2}"| awk -F"workerLogLink" '{print $2 }'| awk -F, '{print $1}'| sed -n 's/\(.*\)ip-\(.*\):8000\(.*\)/\2/p')
eip=$(grep "${worker}" mapping | awk -F, '{print $1}')

#echo $worker
#echo $port
echo "${2} $eip"