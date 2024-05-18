#!/bin/sh

notify-send " $(wpctl get-volume @DEFAULT_SINK@)"
