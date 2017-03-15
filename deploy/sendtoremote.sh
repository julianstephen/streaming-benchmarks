#!/bin/bash

#From scripts folder,
#   Run "./sendtoremote.sh 0" or "./sendtoremote.sh 1" 
#   ./sendtoremote.sh recompile(0/1) sendtoall(0/1)
if (( $# != 1 )); then
    echo "Illegal number of parameters"
	echo "Useage: ./sendtoremote.sh sendtoall(0/1)"
	exit
fi
source env.sh
sendtoall=$1

filenamearray=( ${HOSTSFILE} ${CLIENTSFILE} ${ZOMBIEWORKERS} )
if [ "$sendtoall" -eq 1 ]
then
   echo "Sending to ALL nodes..."
else
   echo "Sending ONLY to nimbus..."
	filenamearray=( ${HOSTSFILE} )
fi
for filename in "${filenamearray[@]}"; do
cat  ${filename} | while IFS='' read -r line || [ -n "$line" ] 
do
     rsync -avz -e "ssh -i ${SECFILENAME}" ./ ${USER}@${line}:${YAHOOBENCH}/deploy/
     
echo "Copied to ${line}"
done
done

