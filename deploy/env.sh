#!/usr/bin/env bash
#export HOME=/home/jamesstj/nettyws
export HOME=/home/ec2-user
#export SECFILENAME=lacloud-useast.pem
export SECFILENAME=yahoobench.pem
#export SECFILENAME=~/.ssh/id_rsa
export REMOTE_FOLDER=${HOME}/phestorm
export YAHOOBENCH=${HOME}/github/streaming-benchmarks
export USER=ec2-user
export HOSTSFILE=nimbus
export CLIENTSFILE=workers
export ZOMBIEWORKERS=zombieworkers
export KAFKA_HOME=${YAHOOBENCH}/kafka_2.10-0.8.2.1
##########export STORM_HOME=${HOME}/storm-0.10.0-ss
#export STORM_HOME=${HOME}/storm-0.9.2
export STORM_HOME=${YAHOOBENCH}/apache-storm-0.9.7
export ZOO_HOME=${HOME}/zookeeper-3.4.6
export GMP_HOME=${HOME}/gmp-java
export FULL_NIMBUS_FILEPATH=${YAHOOBENCH}/deploy/${HOSTSFILE}
export LD_LIBRARY_PATH=/usr/local/lib:/home/ec2-user/gmp-java:/usr/lib64