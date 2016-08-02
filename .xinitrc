#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
#以下是消除蜂鸣声
xset b off  #图形界面下
#setterm -blength 0 #控制台下
#setterm -bfreq 10 # 控制台下
fcitx &
#pcmanfm --desktop &   #设置壁纸
volumeicon &
sh  ~/.autostart/feh.sh &  #设置壁纸
xss-lock -- i3lock -i ~/.wallpaper/a32.png  --insidevercolor=0000a0bf --insidewrongcolor=ff8000bf --insidecolor=ffffffbf --ringvercolor=0020ffff --ringwrongcolor=4040ffff --ringcolor=404090ff --textcolor=ffffffff --linecolor=aaaaaaff --keyhlcolor=30ccccff --bshlcolor=ff8000ff  &
# xss-lock -- lock &
xbindkeys &
#sysctl -w kernel.core_pattern=/var/log/corefiles/%e.core.%p
exec i3

#exec openbox-session

