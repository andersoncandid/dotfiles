#!/usr/bin/env bash

current=$(xsct | awk '{print $5}')

# Change temperature with varying values
if [[ "$current" == "5500" ]]; then
  xsct 5000 && notify-send "Temp: 5000"
elif [ "$current" == "5000" ]; then
  xsct 4500 && notify-send "Temp: 4500"
else
  xsct 5500 && notify-send "Temp: 5500"
fi
