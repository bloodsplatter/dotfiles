#!/bin/env bash

# kill current polybars
killall -q polybar

#wait for kill to finish
while pgrep -u $UID -x polybar >/dev/null; do
	sleep 1; done


polybar -r top &
polybar -r bottom &
