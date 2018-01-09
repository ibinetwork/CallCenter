#!/bin/bash
cmd=$(asterisk -rx "queue show 1192" | grep -A 10 Callers: | wc -l);
if [ "$cmd" -ge 3 ]; then
        let queue=$cmd-2
        echo $queue
else
        echo $cmd
fi


