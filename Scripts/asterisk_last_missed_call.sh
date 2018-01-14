#!/bin/bash


email_in="root@jangofett.tech"
email_out="notify@jangofett.tech"
subject="Notification from Segmento"
smtp="mail.jangofett.tech:587"
email_out_password="***"


log="queue_log"
queue=1192
x=0
total=0
export lastnumber=0
cmd=$(cat $log | grep $queue )
if [ $? -eq 0 ]; then
	id=$(echo "${cmd}" | grep ABANDON | tail -n1 | sed 's\|\ \g' | awk '{print $2}' | sed 's/\./ /g' | awk '{print $2}' )
	number=$(echo "${cmd}" | grep $id | grep ENTERQUEUE | sed 's\|\ \g' | awk '{print $6}')
	if [ "$lastnumber" -eq "$number" ]; then
		sendnotify=$(echo "New missed call! $number" | mailx -v -r "$email_out" -s "$subject" -S smtp="$smtp" -S smtp-auth=login -S smtp-auth-user="$email_out" -S smtp-auth-password="$email_out_password" -S ssl-verify=ignore $email_in)
		export lastnumber=$number
		echo "LAST NUMBER NOT EQUAL CURRENT NUMBER"
	else
		echo "Number equal"
		export lastnumber=$number
	fi
	echo $number
else 
	echo ERROR
fi
