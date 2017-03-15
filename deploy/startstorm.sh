#!/bin/bash

./sendconfigstoslaves.sh

source env.sh

fname=${CLIENTSFILE}
if [[ -z $1 ]]; then
    fname=workers
else
    fname=$1
fi
nimbusnode=$(head -n 1 ${HOSTSFILE})
echo "Nimbus Node is ${nimbusnode}"

storm/startnimbus.sh

cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
    echo "Starting supervisor in ${line}"
    ssh -n -f ${line} "${YAHOOBENCH}/deploy/storm/startsuper.sh" 

done
