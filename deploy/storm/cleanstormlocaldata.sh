#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )" 
source ${DIR}/../env.sh

rm -rf /home/ec2-user/localstormdata/*
#rm -rf ${STORM_HOME}/logs/supervisor.log
#rm -rf ${STORM_HOME}/logs/worker-*.log*
#rm -rf ${STORM_HOME}/logs/gc-worker-*.log
rm -rf ${STORM_HOME}/logs/*