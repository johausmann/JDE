#!/bin/bash
# spectrwm bar action script
# This script provides information for the spectrwm status bar

while :; do
    # Date and time
    DATETIME=$(date "+%a %b %d %H:%M")
    
    # Battery status (if available)
    BATTERY=""
    if [ -d /sys/class/power_supply/BAT0 ]; then
        CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "?")
        STATUS=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo "?")
        BATTERY="BAT: ${CAPACITY}% (${STATUS}) | "
    fi
    
    # Volume (requires alsa-utils)
    VOLUME=$(amixer get Master 2>/dev/null | grep -o '[0-9]*%' | head -1 || echo "N/A")
    
    echo "${BATTERY}VOL: ${VOLUME} | ${DATETIME}"
    
    sleep 1
done
