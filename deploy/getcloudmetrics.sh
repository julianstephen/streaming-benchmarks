YAHOOBENCH=/home/ec2-user/github/streaming-benchmarks
metricfname="${YAHOOBENCH}/deploy/metricLists.txt"
instfname="${YAHOOBENCH}/deploy/instanceIds.txt"
if (( $# != 2 )); then
    echo "Illegal number of parameters"
	echo "Useage: ./getcloudmetrics.sh starttime endtime"
	exit
fi

stime=$1
etime=$2

cat  $instfname  | while IFS='' read -r instance || [ -n "$instance" ] 
do
echo "instname${instance}"
cat  $metricfname  | while IFS='' read -r metric || [ -n "$metric" ] 
do
file=${instance}-${metric}-${stime}-${etime}
aws cloudwatch get-metric-statistics --metric-name ${metric} --start-time ${stime} --end-time ${etime} --namespace AWS/EC2 --period 60 --statistics Maximum --dimensions Name=InstanceId,Value=${instance} >> ${file}
done
done

