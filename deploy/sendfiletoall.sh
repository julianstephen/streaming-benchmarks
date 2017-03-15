#!/bin/bash

source env.sh

fname=${CLIENTSFILE}

cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
#echo "Sending $1 to $line"
scp $1 ${line}:${1}
#echo ${line}
done
