#!/bin/bash
gpio -g mode 1 out
sudo tcpdump -l -q | while read INPUT
do
	gpio -g mode 1 out
	gpio -g write 1 1
	sleep 0.01
	gpio -g write 1 0
	sleep 0.01
done
