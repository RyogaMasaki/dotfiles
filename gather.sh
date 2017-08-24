#!/usr/bin/env sh

# GLOBAL
CONFIG=$HOME/.config

ZSH=zsh
I3=i3
X11=x11
VIM=vim
POLYBAR=polybar
WALLPAPER=wallpaper
CONKY=conky

md() {
	if [ -z $1 ]; then
		return
	fi

	if [ ! -d $1 ]; then
		mkdir -p $1
	fi
}


# GATHER
#  zsh
zsh() {
	if [ -n $1 ]; then
		# restore
	else
		# gather
		md $ZSH
		cp $CONFIG/zsh/.zshrc $ZSH/zshrc
		cp $HOME/.zshenv $ZSH/zshenv
	fi
}

i3() {
	if [ -n $1 ]; then
		# restore
	else
		#gather
		md $I3
		cp $CONFIG/i3/config $I3
	fi
}

x11() {
	if [ -n $1 ]; then
		# restore
	else
		#gather
		md $X11
		cp ~/.Xresources x11/Xresources
		cp ~/.xinitrc x11/xinitrc
	fi
}

vim() {
	if [ -n $1 ]; then
		# restore
	else
		md $VIM
		cp ~/.vimrc vim/vimrc
	fi
}

mkdir -p zsh
cp ~/.zshenv zsh/zshenv
cp ~/.config/zsh/* zsh/

mkdir -p polybar
cp ~/.config/polybar/config polybar

mkdir -p neofetch
cp ~/.config/neofetch/config neofetch

mkdir -p config
cp ~/.config/locale.conf config/locale.conf
# and don't forget to ln ~/.local/share to /usr/local/share
cp ~/.config/mimeapps.list config/mimeapps.list

mkdir -p wallpaper
cp ~/.wallpaper/* wallpaper

mkdir -p dunst
cp ~/.config/dunstrc dunst

cp ~/.fehbg fehbg

mkdir -p conky
cp ~/.config/conky/conky.conf conky

