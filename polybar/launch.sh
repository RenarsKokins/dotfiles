#!/usr/bin/env sh

BARNAME="renarabar"

# Terminate already running instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Find main monitor to display system tray
PRIMARY=$(polybar --list-monitors | grep "primary" | cut -d":" -f1)
OTHERS=$(polybar --list-monitors | grep -v "primary" | cut -d":" -f1)

# Launch main polybar
MONITOR=$PRIMARY TRAY="right" polybar --reload $BARNAME &

# Launch other bars
for m in $OTHERS; do
    MONITOR=$m TRAY="none" polybar --reload $BARNAME &
done
