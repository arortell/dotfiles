#!/bin/bash

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

echo 'starting dropbox\n' >> ~/.logs/xinit.log
dropbox-cli start >> ~/.logs/xinit.log 2>&1 &

echo 'starting yandex disk\n' >> ~/.logs/xinit.log
yandex-disk start >> ~/.logs/xinit.log 2>&1 &

echo 'starting compton\n' >> ~/.logs/xinit.log 
compton >> ~/.logs/xinit.log 2>&1 &

echo 'setting Cursor\n' >> ~/.logs/xinit.log
xsetroot -cursor_name left_ptr 2>&1 &

echo 'starting gpg-agent daemon\n' >> ~/.logs/xinit.log
gpg-agent --daemon --pinentry-program /usr/bin/pinentry >> ~/.logs/xinit.log 2>&1 &

echo '##################### Setting Wallpaper ###################\n' >> ~/.logs/xinit.log
feh --bg-fill /home/Yandex-Disk/images/Wallpapers/Hacking/1522538.jpg

echo '##################### Java Work Around ###################\n' >> ~/.logs/xinit.log
export _JAVA_AWT_WM_NONREPARENTING=1

echo '##################### Turn off Screen Blanking ####################\n' >> ~/.logs/xinit.log
xset s off
xset s noblank
xset -dpms

# start bspwm and sxhkd
echo '###################### Starting Window-Manager ################\n' >> ~/.logs/xinit.log
#echo 'starting sxhkd\n' >> ~/.logs/sxhkd.log
#exec sxhkd > ~/.logs/sxhkd.log 2>&1 &
3echo 'starting bspwm\n' >> ~/.logs/bspwm.log
#exec wm > ~/.logs/bspwm.log 2>&1
exec herbstluftwm --locked
