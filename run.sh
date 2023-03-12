#!/bin/bash

sleep 5

cd /home/pi/github/RaspPi4

export LED_LOGIN=5
export LED_PIHOLE=2
export LED_VPN=3
export LED_DANGER=4

./led_control/danger.sh &
./led_control/login.sh &
./led_control/pihole.sh &
./led_control/vpn.sh &

./relay_control/reboot.sh &
