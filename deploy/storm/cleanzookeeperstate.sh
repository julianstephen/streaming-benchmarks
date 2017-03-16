#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )" 
source ${DIR}/../env.sh
rm -rf ${ZOO_HOME}/dataDir/*
