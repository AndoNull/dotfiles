#!/usr/bin/env bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || cat /sys/class/power_supply/BAT1/status 2>/dev/null)

if [ -z "$capacity" ]; then
  echo ""
  exit 0
fi

if [ "$status" = "Charging" ]; then
  icon="󰂄"
elif [ "$capacity" -ge 90 ]; then
  icon="󰁹"
elif [ "$capacity" -ge 60 ]; then
  icon="󰂀"
elif [ "$capacity" -ge 30 ]; then
  icon="󰁾"
elif [ "$capacity" -ge 15 ]; then
  icon="󰁻"
else
  icon="󰁺"
fi

echo "${icon}  ${capacity}%"
