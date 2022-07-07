#!/bin/bash
gpio -g mode 2 out
tail -f /var/log/pihole.log | while read INPUT
do
	gpio -g mode 2 out
	gpio -g write 2 1
	sleep 0.01
	gpio -g write 2 0
	sleep 0.01
done
