export ZSHRC="${ZDOTDIR}/.zshrc"

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep extendedglob
unsetopt nomatch
# End of lines configured by zsh-newuser-install
#
export TERM='xterm-256color'
export EDITOR='vim'
export VISUAL='vim'
export LS_COLORS="di=0;34:ln=0;35:so=32;40:pi=33;40:ex=0;31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export PS_FORMAT=pid,user,args

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh '
alias la='ls -lAh'
alias ps='ps -ax'
alias mount='mount | column -t'
alias df='df -kh'
alias mkdir="mkdir -p"

alias beep='echo -en "\007"'
alias hs='history | grep -i'
alias lp="ps | grep -i"
alias root='sudo -i'
alias try='xdg-open'
alias watch='tail -f'
alias hw-off="systemctl poweroff"
alias hw-suspend="systemctl suspend"
alias hw-reboot="systemctl reboot"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E \"state|to\\ full|percentage\""

cl() { cd $@ && ll; }
js() { jstrings $1 | iconv -f SHIFT-JIS -t UTF-8 -c | less; }

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
autoload colors && colors

bindkey -e
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
bindkey -s '\el' 'ls\n' 
bindkey -s '\ex' 'clear\n'

# note system
n() {
        $EDITOR ~/notes/"$*"
}

nls() {
        ls -c ~/notes/ | grep "$*"
}

# load zmv for intelligent mass file renames
autoload -U zmv

source ${ZDOTDIR}/prompt.zsh

echo ""
echo $fg[yellow] $(uname -mrs)$reset_color
echo $fg[blue] $(date +"%Y.%m.%d") $(date +"%H:%M:%S") $fg[green]"$USER"@"$HOST"$reset_color

