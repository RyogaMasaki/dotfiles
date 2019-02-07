# dotfiles
System config backup

each dot\_ directory matches an XDG Base Directory type

- dot\_config : XDG\_CONFIG\_HOME
- dot\_data : XDG\_DATA\_HOME

scripts should go in /usr/local/bin

GRUB settings:
/etc/default/grub
~~~~
GRUB_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT=1
GRUB_HIDDEN_TIMEOUT_QUIET="true"
GRUB_CMDLINE_LINUX_DEFAULT="quiet video=vesafb:ywrap,mtrr:3"
GRUB_GFXMODE=1920x1080x32,auto
~~~~

## Programs
- Shell: zsh
- Window Mgr: i3-gaps
- Compositer: compton
- Bar: polybar
- Terminal: Termite (migrating from urxvt)
- Launcher: rofi
- Notifications: dunst
- Sys Info: conky
- Image Viewer: feh
- Music: mpd / ncmpcpp
- IME: ibus (Japanese: ibus-anthy)

## Other tools to reinstall (in no particular order)
- udiskie (disk auto mount)
- exfat-utils (exfat for SD cards)
- p7zip (7zip)
