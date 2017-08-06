#!/usr/bin/env sh

mkdir -p i3
cp ~/.config/i3/config i3

mkdir -p x11
cp ~/.Xresources x11/Xresources
cp ~/.xinitrc x11/xinitrc

mkdir -p vim
cp ~/.vimrc vim/vimrc

mkdir -p zsh
cp ~/.zshrc zsh/zshrc
cp ~/.oh-my-zsh/themes/avit_mod.zsh-theme zsh

mkdir -p polybar
cp ~/.config/polybar/config polybar

mkdir -p neofetch
cp ~/.config/neofetch/config neofetch

mkdir -p config
cp ~/.config/locale.conf config/locale.conf

mkdir -p wallpaper
cp ~/.wallpaper/* wallpaper

mkdir -p dunst
cp ~/.config/dunstrc dunst

