#!/bin/bash

#This kills zookeeper as well

source env.sh

fname=${CLIENTSFILE}
if [[ -z $1 ]]; then
    fname=workers
else
    fname=$1
fi


cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
    echo "Cleaning logs in ${line}"
    ssh -n -f ${line} "${REMOTE_FOLDER}/scripts/storm/cleanstormlocaldata.sh" 

done
