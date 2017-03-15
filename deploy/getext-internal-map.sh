#!/bin/bash
source env.sh

echo "Master" > mapping
nimbus=$(head -n 1 nimbus)
echo -n ${nimbus} >> mapping
echo -n "," >> mapping
curl -s http://169.254.169.254/latest/meta-data/local-hostname >> mapping
echo "" >> mapping
echo "Workers" >> mapping

fname=${CLIENTSFILE}
cat  $fname  | while IFS='' read -r line || [ -n "$line" ] 
do
echo -n ${line} >> mapping
echo -n "," >> mapping
ssh  ${line} '(curl -s http://169.254.169.254/latest/meta-data/local-hostname)' >> mapping < /dev/null
echo ""  >> mapping
done
