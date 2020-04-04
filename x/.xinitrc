#!/bin/env bash
#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___ 
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__ 
# /_/\_\_|_| |_|_|\__|_|  \___|
#================== xorg init =

export QT_QPA_PLATFORMTHEME=gtk2

if [ -d /etc/X11/xinit/xinitrc.d ]
then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh
	do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

unclutter >> ~/.logs/xinit.log 2>&1 &
udiskie >> ~/.logs/xinit.log 2>&1 &
picom >> ~/.logs/xinit.log 2>&1 &

# Setting Cursor
xsetroot -cursor_name left_ptr 2>&1 &

echo "starting gpg-agent daemon" >> ~/.logs/xinit.log
gpg-agent --daemon --pinentry-program /usr/bin/pinentry-rofi >> ~/.logs/xinit.log 2>&1 &

# feh --bg-fill /home/Yandex-Disk/images/Wallpapers/cosmos/outerspaceEarth.jpg
# feh --bg-fill /home/Yandex-Disk/images/Wallpapers/Star_Trek/Borg-Cube-With-Sphere.jpg
feh --bg-fill /home/Yandex-Disk/images/Wallpapers/BSG/Cylon-Heavy-Raider.jpg


# Turn off Screen Blanking
xset s off
xset s noblank
xset -dpms

dropbox &
exec herbstluftwm --locked
