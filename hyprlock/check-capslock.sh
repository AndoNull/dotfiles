#!/usr/bin/env bash

state=$(cat /sys/class/leds/input*::capslock/brightness 2>/dev/null | head -n1)

if [ "$state" = "1" ]; then
  echo "󰪛  Caps Lock"
else
  echo ""
fi
