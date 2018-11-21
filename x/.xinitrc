#!/bin/bash
#       _       _ _
# __  _(_)_ __ (_) |_ _ __ ___ 
# \ \/ / | '_ \| | __| '__/ __|
#  >  <| | | | | | |_| | | (__ 
# /_/\_\_|_| |_|_|\__|_|  \___|
#================== xorg init =

#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#    for f in /etc/X11/xinit/xinitrc.d/?* ; do
#        [ -x "$f" ] && . "$f"
#    done
#    unset f
#fi

echo '################### Starting Daemons #######################\n' > ~/.logs/xinit.log

echo 'starting unclutter\n' >> ~/.logs/xinit.log
unclutter >> ~/.logs/xinit.log 2>&1 &

echo 'starting undiskie\n' >> ~/.logs/xinit.log
udiskie >> ~/.logs/xinit.log 2>&1 &

echo 'starting compton\n' >> ~/.logs/xinit.log 
compton >> ~/.logs/xinit.log 2>&1 &

echo 'setting Cursor\n' >> ~/.logs/xinit.log
xsetroot -cursor_name left_ptr 2>&1 &

echo 'starting gpg-agent daemon\n' >> ~/.logs/xinit.log
gpg-agent --daemon --pinentry-program /usr/bin/pinentry >> ~/.logs/xinit.log 2>&1 &

echo '##################### Setting Wallpaper ###################\n' >> ~/.logs/xinit.log
feh --bg-fill /home/Yandex-Disk/images/Wallpapers/Arch/b4ck4rch.png

echo '##################### Java Work Around ###################\n' >> ~/.logs/xinit.log
export _JAVA_AWT_WM_NONREPARENTING=1

echo '##################### Turn off Screen Blanking ####################\n' >> ~/.logs/xinit.log
xset s off
xset s noblank
xset -dpms

# start herbstluftwm
echo '###################### Starting Window-Manager ################\n' >> ~/.logs/xinit.log
echo 'starting herbstluftwm\n' >> ~/.logs/herbstluftwm.log
exec herbstluftwm --locked
