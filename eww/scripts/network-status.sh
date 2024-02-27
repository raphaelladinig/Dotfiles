#!/bin/sh

if [ $(cat /sys/class/net/wlp2s0/operstate) = up ]; then
    echo "󰤨"
else
    echo "󰤭"
fi
