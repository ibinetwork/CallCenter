#!/bin/bash

# Variables for notify
email_in="root@jangofett.tech"
email_out="notify@jangofett.tech"
subject="Notification from Segmento"
smtp="mail.jangofett.tech:587"
email_out_password="*****"
date=$(date)

# Variables for log analyze
log="queue_log"
queue="DGK-queue"
x=0
total=0

cmd=$(cat $log | grep $queue )
if [ $? -eq 0 ]; then
	id=$(echo "${cmd}" | grep ABANDON | tail -n1 | sed 's\|\ \g' | awk '{print $2}' | sed 's/\./ /g' | awk '{print $2}' )
	number=$(echo "${cmd}" | grep $id | grep ENTERQUEUE | sed 's\|\ \g' | awk '{print $6}' | tail -n1)
	echo $number
else 
	echo ERROR
fi
if [ "$lastnumber" -eq "$number" ]; then
	export lastnumber=$number
else
	export lastnumber=$number
	sendnotify=$(echo "New missed call! \n Client: $number \n Time: $date" | mailx -v -r "$email_out" -s "$subject" -S smtp="$smtp" -S smtp-auth=login -S smtp-auth-user="$email_out" -S smtp-auth-password="$email_out_password" -S ssl-verify=ignore $email_in &> /dev/null)
fi
