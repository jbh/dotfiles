#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -s polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
for m in $(polybar --list-monitors | cut -d":" -f1); do
	WIRELESS=$(ls /sys/class/net/ | grep ^w1 | awk 'NR==1{print $1}') MONITOR=$m polybar --reload mainbar-bspwm &
done

echo "Polybar launched..."

