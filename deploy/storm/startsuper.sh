#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )" 
source ${DIR}/../env.sh

cd ${STORM_HOME}
nohup bin/storm supervisor > /dev/null 2>&1 &
nohup bin/storm logviewer > /dev/null 2>&1 &