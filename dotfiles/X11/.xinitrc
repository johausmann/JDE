#!/bin/sh
# xinitrc - X initialization script
# This file is executed when starting X with startx

# Load X resources
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Set keyboard layout (uncomment and modify if needed)
# setxkbmap us

# Start compositor for transparency and effects
picom -b &

# Set wallpaper (uncomment and set path if you have a wallpaper)
# feh --bg-scale /path/to/wallpaper.jpg &

# Launch polybar
~/.config/polybar/launch.sh &

# Start spectrwm window manager
exec spectrwm
