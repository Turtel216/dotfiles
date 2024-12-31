#!/usr/bin/env bash

# initializing wallpaper daemon
swww init &
# setting wallpaper
swww img ~/Pictures/Wallpapers/psych1.png &

waybar &

dunst &
