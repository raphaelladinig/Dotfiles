#!/bin/sh

network_info=$(nmcli -t -f active,ssid,signal dev wifi | grep yes)

if [ -n "$network_info" ]; then
    network_name=$(echo "$network_info" | cut -d':' -f2)
    signal_strength=$(echo "$network_info" | cut -d':' -f3)
    notify-send " $network_name: $signal_strength%" 
else
    notify-send "No network connected"
fi
