#!/bin/sh

muted=$(wpctl get-volume @DEFAULT_SINK@ | grep -o MUTED)

if [ $muted = MUTED ]; then
	volume_status="󰖁"
else
	volume_status="󰕾" 
fi

echo "$volume_status"