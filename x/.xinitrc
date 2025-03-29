#!/bin/env bash
#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___ 
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__ 
# /_/\_\_|_| |_|_|\__|_|  \___|
#================== xorg init =

#export QT_QPA_PLATFORMTHEME=gtk2

if [ -d /etc/X11/xinit/xinitrc.d ]
then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh
	do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

unclutter &
picom &

# Setting Cursor
xsetroot -cursor_name left_ptr 2>&1 &

# Remap Capslock to ctrl
setxkbmap -layout us -option ctrl:nocaps 2>/dev/null

#echo "starting gpg-agent daemon" >> ~/.logs/xinit.log
gpg-agent --daemon --pinentry-program /usr/bin/pinentry-rofi &

# THIS WILL BE -SETROOT-  NOW ====> READ MAN PAGE
setroot -f /diskb/onedrive/Pictures/Wallpapers/JaiuQL.jpg



# Turn off Screen Blanking
xset s off
xset s noblank
xset -dpms

# Only needed for siji font
xset +fp /home/b14ckr41n/.local/share/fonts
xset fp rehash

# Auto mount USB
#udiskie > ~/.logs/xinit.log &

exec herbstluftwm --locked
