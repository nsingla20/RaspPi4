#!/bin/bash
file=~/relay_config
arr=(7 8 9 10)
delay=60
for i in ${arr[@]};do
    gpio -g mode $i out
done
Save(){
    echo "var=()">$file
    for i in ${arr[@]};do
        x=$(gpio -g read $i)
        echo "var+=($x)">>$file
    done
}
Load(){
    source $file
    ind=0
    for i in ${arr[@]};do
        gpio -g write $i ${var[$ind]}
        ((ind++))
    done
}
if [ -f "$file" ]
then
    Load
else
    for i in ${arr[@]};do
        gpio -g write $i 1
    done
    Save
fi
while true;do
    sleep $delay
    Save
done
