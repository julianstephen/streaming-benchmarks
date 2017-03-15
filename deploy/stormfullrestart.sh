#!/bin/bash

./stopstorm.sh
sleep 30
./cleanstorm.sh
sleep 30
./startstorm.sh
sleep 100
#sleep 60