#!/bin/sh

while true; do
    # 🎵 Music
    SONG=$(playerctl metadata title 2>/dev/null)
    [ -z "$SONG" ] && SONG="No Music"

    # 🌐 Network (IP address)
    NET=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7}' | head -n1)
    [ -z "$NET" ] && NET="Disconnected"

    # 🔋 Battery
    BAT=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)%

    # 🔊 Volume
    VOL=$(pamixer --get-volume-human)

    # 📅 Date and Time
    DATE=$(date "+%b %d (%a)")
    TIME=$(date "+%H:%M")

    # 🧠 Compose bar with icons
    xsetroot -name "  󰓇 $SONG  󰛳 $NET  󰋑 $BAT  󰕾 $VOL  󰃭 $DATE  󰥔 $TIME"

    sleep 5
done
