#!/bin/env bash
# set a random wallpaper
feh --randomize --bg-fill ~/Images/Wallpapers/* &

# update newsboat
newsboat -x reload &