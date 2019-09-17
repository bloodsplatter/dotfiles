#!/bin/env bash
# set a random wallpaper
feh --randomize --bg-fill ~/Images/Wallpapers/* &

# launch notification daemon
twmnd &

# composer
compton --backend glx --vsync & >/dev/null

# kill current polybars
killall -q polybar

#wait for kill to finish
while pgrep -u $UID -x polybar >/dev/null; do
	sleep 1; done


polybar -r top & >/dev/null
polybar -r bottom & >/dev/null
