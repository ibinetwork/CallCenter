#!/bin/bash

log="queue_log"
queue=1192
x=0
total=0
while true; do
	sleep 1
	cmd=$(cat $log | grep $queue)
	if [ $? == 0 ]; then
		id=$(echo "${cmd}" | tail -n1 | sed 's\|\ \g' | awk '{print $2}' | sed 's/\./ /g' | awk '{print $2}' )
		number=$(echo "${cmd}" | grep $id | grep "ENTERQUEUE" | sed 's\|\ \g' | awk '{print $6}')
		echo $number
	else 
		echo ERROR
	fi
done
