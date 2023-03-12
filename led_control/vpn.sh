#!/bin/bash
gpio -g mode $LED_VPN out
while true
do
#gpio -g write 4 1
a=`sudo wg show wg0 transfer | cut -f 2 | tr -d '\n'`
sleep 5
b=`sudo wg show wg0 transfer | cut -f 2 | tr -d '\n'`
#gpio -g mode 4 out
#echo -n "a/n: $a"
#echo -n "b/n: $b"
#echo "a:$a\nb:$b"
gpio -g write $LED_VPN 1
sleep 0.01
if [ $a -eq $b ]
then
	#echo "OFF"
	gpio -g write $LED_VPN 0
else
	#echo "ON : $a $b"
	gpio -g write $LED_VPN 1
	sleep 300
fi
done
