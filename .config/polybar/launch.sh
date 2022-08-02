#!/usr/bin/env bash

# Terminate already-running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload bar & 
	done
else
	polybar --reload bar & 
fi
