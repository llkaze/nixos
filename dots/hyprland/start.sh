#!/usr/bin/env bash

# wallpaper daemon
swww init &
sww img 

# bar, launcher notifications and widgets
ags &

# networkmanager applet
nm-applet --indicator &

# bluetooth applet
blueman-applet 
