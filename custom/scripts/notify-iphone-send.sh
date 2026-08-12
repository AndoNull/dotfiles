#!/bin/bash
# Evitar múltiples instancias
if pgrep -f "notify-iphone-send.sh" | grep -v $$ >/dev/null; then
  exit 1
fi

SINCE=$(date +%s)
LOCKFILE="/tmp/iphone-notify.lock"

curl -s --no-buffer "https://ntfy.sh/iphone-and00pium-85/sse?since=${SINCE}" | while IFS= read -r line; do
  if [[ "$line" == *'"event":"message"'* ]] && [[ "$line" == data:* ]]; then
    NOW=$(date +%s)
    LAST=$(cat "$LOCKFILE" 2>/dev/null || echo 0)
    if ((NOW - LAST > 3600)); then
      DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" \
        notify-send "📱 iPhone" "Ya está al 85%, desconéctalo" -u critical
      echo "$NOW" >"$LOCKFILE"
    fi
  fi
done
