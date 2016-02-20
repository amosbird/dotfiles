#!/bin/bash

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xrdb -merge $HOME/.Xresources
PATH=$PATH:$HOME:$HOME/bin:$HOME/.scripts/:/usr/local/bin
copyq &
ibus-daemon &
pulseaudio &
compton &
i3
