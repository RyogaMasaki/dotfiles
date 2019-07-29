xrdb -I$HOME ~/.Xresources

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx
udiskie --no-notify --tray --use-udisks2 &

exec i3
#exec startkde
#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop

