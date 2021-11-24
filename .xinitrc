#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

setxkbmap us altgr-intl
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#keyboard layout


#display resolution

#compositor
xrandr --output DisplayPort-0 --primary --mode 2560x1440 --rate 165 --pos 1920x0 --rotate normal --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-2 --off --output HDMI-A-0 --off

picom --experimental-backends &
# wallpaper


nitrogen --restore &

# loop
while true; do
	dwm >/dev/null 2>&1
done
#set monitor config

#execute dwm
exec dwm 

