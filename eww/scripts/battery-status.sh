#!/bin/sh

if [ $(cat "/sys/class/power_supply/AC/online") = 1 ]; then
	echo "󰂄"
elif [ $(cat "/sys/class/power_supply/AC/online") = 0 ]; then
	echo "󰁹"
fi