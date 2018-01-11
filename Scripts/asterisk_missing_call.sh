#!/bin/bash

log="queue_log"
queue=1192
x=0
total=0
while true; do
	sleep 1
	cmd=$(cat $log | grep $queue)
	if [ $? == 0 ]; then
		echo "${cmd}" | grep ENTERQUEUE | sed 's\|\ \g' | awk '{print $6}' | tail -n1
	else 
		echo ERROR
	fi
done
