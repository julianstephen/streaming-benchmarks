#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )" 
source ${DIR}/../env.sh

cd ${ZOO_HOME}
nohup bin/zkServer.sh start > /dev/null 2>&1 &
sleep 10
cd ${STORM_HOME}
nohup bin/storm nimbus > /dev/null 2>&1 &
nohup bin/storm ui > /dev/null 2>&1 &
