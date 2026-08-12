#!/bin/bash
STATUS=$(hyprctl monitors all -j | python3 -c "import sys,json; monitors=json.load(sys.stdin); print(next(m['disabled'] for m in monitors if m['name']=='eDP-1'))")
if [ "$STATUS" = "False" ]; then
  hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
else
  hyprctl eval 'hl.monitor({ output = "desc:HKC OVERSEAS LIMITED 0x36B1", mode = "1366x768@60", position = "1920x0", scale = 1 })'
fi
