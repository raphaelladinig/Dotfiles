#!/bin/sh

volume_level=$(wpctl get-volume @DEFAULT_SINK@ | grep -oE '[0-9]+\.[0-9]+' | sed -e 's/\.//g')
volume_level=${volume_level#0}
volume_level=${volume_level#0}

echo "$volume_level"