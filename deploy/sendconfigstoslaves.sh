#!/bin/bash

source env.sh

fname=${CLIENTSFILE}
conffile=storm.yaml
if [[ -z $1 ]]; then
    fname=workers
else
    fname=$1
    conffile=$2
fi
nimbus=$(head -n 1 nimbus)
echo "Nimbus Node is ${nimbus}"

sed -e "s/replaceme/${nimbus}/" conf/${conffile} > temp1

cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do

scp temp1 ${line}:${STORM_HOME}/conf/storm.yaml

scp ${REMOTE_FOLDER}/testkeys/Paillier1.pk ${line}:/tmp/Paillier1.pk
scp ${REMOTE_FOLDER}/testkeys/Paillier1.sk ${line}:/tmp/Paillier1.sk
scp ${REMOTE_FOLDER}/testkeys/AES1.sk ${line}:/tmp/AES1.sk

done

#Copy keys to kafkas servers as well
cat  ${ZOMBIEWORKERS}  | while IFS='' read -r line || [ -n "$line" ] 
do
scp ${REMOTE_FOLDER}/testkeys/Paillier1.pk ${line}:/tmp/Paillier1.pk
scp ${REMOTE_FOLDER}/testkeys/Paillier1.sk ${line}:/tmp/Paillier1.sk
scp ${REMOTE_FOLDER}/testkeys/AES1.sk ${line}:/tmp/AES1.sk
done
#End copy keys to kafka

#Set yaml file for nimbus
cp temp1 ${STORM_HOME}/conf/storm.yaml
cp conf/zoo.cfg ${ZOO_HOME}/conf/


./getext-internal-map.sh
