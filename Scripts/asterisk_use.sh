#!/bin/bash
queue=1192
using=$(asterisk -rx "queue show 1192" | grep "In use" | wc -l)
if [ $? == 0 ]; then
	echo $using
else
        echo 0
fi
