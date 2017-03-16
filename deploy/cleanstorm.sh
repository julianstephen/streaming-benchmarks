#!/bin/bash

#This kills zookeeper as well

source env.sh

fname=${CLIENTSFILE}
if [[ -z $1 ]]; then
    fname=workers
else
    fname=$1
fi

#nimbusnode=$(head -n 1 ${HOSTSFILE})
#echo "Nimbus Node is ${nimbusnode}"

storm/cleanstormlocaldata.sh
storm/cleanzookeeperstate.sh
rm -rf ${STORM_HOME}/logs/nimbus.log
rm -rf ${STORM_HOME}/logs/ui.log

cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
    echo "Cleaning supervisor in ${line}"
    ssh -n -f ${line} "${YAHOOBENCH}/deploy/storm/cleanstormlocaldata.sh" 

done
