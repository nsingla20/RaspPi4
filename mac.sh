#!/bin/bash
gpio -g mode 6 out
function check(){
	gpio -g write 6 1
	sleep 1
	gpio -g write 6 0
	ping -c 1 `cat /proc/net/arp | grep $1 | cut -d " " -f 1`
#	gpio -g write 6 1
	if [ $? -eq 0 ]
	then
		gpio -g write 6 1
	else
		gpio -g write 6 0
	fi
}
delight="34:7d:f6:b0:84:e3"
while true
do
#	gpio -g write 6 1
	check $delight
	sleep 5
done
