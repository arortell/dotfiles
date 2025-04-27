#!/bin/env bash
#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__
# /_/\_\_|_| |_|_|\__|_|  \___|
#================== xorg init =

#export QT_QPA_PLATFORMTHEME=gtk3

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Start background stuff
#unclutter &
#udiskie &
#dunst &
#picom &

# Setting Cursor
xsetroot -cursor_name left_ptr 2>&1 &

# Remap Capslock to ctrl
setxkbmap -layout us -option ctrl:nocaps 2>/dev/null

# Needed for media keys on the corsair keyboard
xmodmap ~/.dotfiles/xmodmap/xmodmap.conf &

# Starting gpg-agent daemon
gpg-agent --daemon --pinentry-program /usr/bin/pinentry-rofi &

# set Wallpaper
setroot -f /diskb/onedrive/Pictures/Wallpapers/blackarch/wallpaper-NINJARCH-code.png

# Turn off Screen Blanking
xset s off
xset s noblank
xset -dpms

# Only needed for siji font
xset +fp /home/b14ckr41n/.local/share/fonts
xset fp rehash

exec herbstluftwm --locked
