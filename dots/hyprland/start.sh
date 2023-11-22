#!/usr/bin/env bash

# wallpaper daemon
swww init &
sww img ~/Documents/git/nixos/dots/swww/evening-sky.png &

# bar, launcher notifications and widgets
ags &

# networkmanager applet
nm-applet --indicator &

# bluetooth applet
blueman-applet 