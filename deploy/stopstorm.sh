#!/bin/bash

source env.sh

fname=${CLIENTSFILE}
if [[ -z $1 ]]; then
    fname=workers
else
    fname=$1
fi
nimbusnode=$(head -n 1 ${HOSTSFILE})
echo "Nimbus Node is ${nimbusnode}"

killall java

cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
    echo "Stopping supervisor in ${line}"
    ssh -n -f ${line} "killall java" 
done

