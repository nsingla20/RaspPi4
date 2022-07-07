#!/bin/bash
gpio -g mode 4 out
while true
do
	temp=`vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*'|awk '{printf "%d",$1}'`
	cpu=`top -bn1 | grep load | awk '{printf "%d", $(NF-2)}'`
	ram=`free -m | grep Mem | cut -d " " -f 3`
	disk=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
	echo "temp:$temp cpu:$cpu ram:$ram disk:$disk"
	if [[ $temp -ge 60 ||  $cpu -ge 3 || $ram -ge 1000 || disk -ge 40 ]]
	then
		gpio -g write 4 1
		sleep 300
	else
		gpio -g write 4 0
	fi
	sleep 3
done
