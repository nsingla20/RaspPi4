#!/bin/bash
while true
do
gpio -g mode $LED_LOGIN out
a=`w|wc -l`
gpio -g write $LED_LOGIN 1
sleep 0.02
if [ $a -gt 4 ] ; then
	gpio -g write $LED_LOGIN 1
else
	gpio -g write $LED_LOGIN 0
fi
sleep 1
#gpio -g write 4 1
done
