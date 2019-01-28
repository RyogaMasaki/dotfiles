# AVIT ZSH Theme
# ryogamasaki mod

local _current_dir="%F{11}%3~%f "
local _return_status="%F{1}%(?..✖)%f"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

#function _current_dir() {
#  local _max_pwd_length="65"
#  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
#    echo "%{$fg_bold[yellow]%}%-2~ ... %3~%{$reset_color%} "
#  else
#    echo "%{$fg_bold[yellow]%}%~%{$reset_color%} "
#  fi
#}

function _user_host() {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ "$LOGNAME" != "$USER" ]]; then
    me="%n"
  fi
  if [ -n "$me" ]; then
    echo "%F{4}$me%f ・"
  fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="9"
else
  CARETCOLOR="6"
fi

#MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

# LS colors, made with http://geoff.greer.fm/lscolors/
#export LSCOLORS="exfxcxdxbxegedabagacad"
#export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
#export GREP_COLOR='1;33'

PROMPT="
$(_user_host)${_current_dir} 
%F{$CARETCOLOR}▶%f "

PROMPT2="%F{$CARETCOLOR}◀%f "

RPROMPT="%{$(echotc UP 1)%}${_return_status}%{$(echotc DO 1)%}"

#
