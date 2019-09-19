#!/bin/env bash
# set a random wallpaper
feh --randomize --bg-fill ~/Images/Wallpapers/* &

# launch notification daemon
twmnd &

# composer
killall -q compton
compton -i 1.0 --blur-method kawase --blur-strength 10 -b -C --backend glx

# kill current polybars
killall -q polybar

#wait for kill to finish
while pgrep -u $UID -x polybar >/dev/null; do
	sleep 1; done


polybar -r top & >/dev/null
polybar -r bottom & >/dev/null
