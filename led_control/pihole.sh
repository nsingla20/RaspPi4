#!/bin/bash
gpio -g mode $LED_PIHOLE out
tail -f /var/log/pihole.log | while read INPUT
do
	gpio -g write $LED_PIHOLE 1
	sleep 0.01
	gpio -g write $LED_PIHOLE 0
	sleep 0.01
done
