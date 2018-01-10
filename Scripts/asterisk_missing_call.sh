#!/bin/bash

log="/var/log/nginx/access.log"
x=0
total=0
while true; do
				sleep 1
				let x=$x+1
				cmd=$(cat $log | grep -E "403" | awk '{print $1}' | wc -l)
				if [ $? == 0 ]; then
								let total=$total+1
				else
								echo Error
				fi
				if [ $x -gt 10 ]; then
								total=0
				else	
								echo "Counter: " $total
				fi
done
