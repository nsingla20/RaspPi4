#!/bin/bash
while true
do
gpio -g mode 5 out
a=`w|wc -l`
gpio -g write 5 1
sleep 0.02
if [ $a -gt 4 ] ; then
	gpio -g write 5 1
else
	gpio -g write 5 0
fi
sleep 1
#gpio -g write 4 1
done
