#!/bin/sh

# Clipboard
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

# Compositing manager
xcompmgr -cCfF -t-5 -l-5 -r4.2 -o.55 -D6 &

# URxvt settings
xrdb -load ~/.Xresources &

# Background set
eval `cat ~/.fehbg` &

# Set up font
xset +fp /usr/share/fonts/local
xset fp rehash

# Start mpd
mpd &
# Xscreensaver
xscreensaver -no-splash &
# Trayer
trayer --edge bottom --align right --SetDockType true --expand true --transparent true --alpha 0 --tint 0x000000 --height 6 --width 10  &


# Start Pidgin and wicd-client
# pidgin &
wicd-client -t &
gtk-redshift -l 43.7:-85.0 &
xfce4-power-manager &

# start conky
sh ~/.weather-conky/conky-restart.sh &
# Start WM
# ck-launch-session added so that udisk can be run without root prmission under X
# xsetroot -cursor_name left_ptr; exec ck-launch-session xmonad
xsetroot -cursor_name left_ptr; exec dbus-launch --exit-with-session xmonad
