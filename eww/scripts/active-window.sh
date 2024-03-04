#!/bin/sh
hyprctl activewindow -j | jq --raw-output .class
