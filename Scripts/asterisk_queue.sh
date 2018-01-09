#!/bin/bash
oneminute=60
default=0
time=$(asterisk -rx "queue show 1192" | grep -A 10 wait: | awk '{print $4}' | sed 's/,//' | head -n1);
if [ "$?" == "$default" ]; then
        minute=$(echo $time | sed 's\:\ \' | awk '{print $1}') 2> /dev/null
        second=$(echo $time | sed 's\:\ \' | awk '{print $2}') 2> /dev/null
	if [ "$time" == "0:07" ]; then
		time=7
	fi
        let min=$oneminute*$minute 2> /dev/null
        let time=$second+$min 2> /dev/null
		if [ $? -eq 0 ]; then
			echo $time
		elif [ "$time" == "0:07" ]; then
			time=7
			echo $time
		elif [ "$time" == "0:08" ]; then
			time=8
			echo $time
		elif [ "$time" == "0:09" ]; then
			time=9
			echo $time
		elif [ "$time" == "1:07" ]; then
			time=67
			echo $time
		elif [ "$time" == "1:08" ]; then
			time=68
			echo $time
		elif [ "$time" == "1:09" ]; then
			time=69
			echo $time
		elif [ "$time" == "2:07" ]; then
			time=127
			echo $time
		elif [ "$time" == "2:08" ]; then
			time=128
			echo $time
		elif [ "$time" == "2:09" ]; then
			time=129
			echo $time
		elif [ "$time" == "3:07" ]; then
			time=187
			echo $time
		elif [ "$time" == "3:08" ]; then
			time=188
			echo $time
		elif [ "$time" == "3:09" ]; then
			time=189
			echo $time
		elif [ "$time" == "4:07" ]; then
			time=247
			echo $time
		elif [ "$time" == "4:08" ]; then
			time=248
			echo $time
		elif [ "$time" == "4:09" ]; then
			time=249
			echo $time
                else
                        echo $default
                fi
fi

