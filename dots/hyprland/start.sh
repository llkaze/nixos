#!/usr/bin/env bash

# wallpaper daemon
swww init &
swww img ~/Documents/git/nixos/dots/swww/sunset.png &

# bar, launcher notifications and widgets
ags &

# networkmanager applet
nm-applet --indicator &

# bluetooth applet
blueman-applet 