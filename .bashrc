
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
# Most FreeBSD & Apple Darwin supports colors
export CLICOLOR=true
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

USER_COLOR=$COLOR_YELLOW                     # user's color
[ $UID -eq "0" ] && USER_COLOR=$COLOR_LIGHT_RED   # root's color

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }

TIME=${COLOR_LIGHT_GRAY}'\]\t '
HOST=${USER_COLOR}'\]\u'${COLOR_LIGHT_BLUE}'\]@'${COLOR_CYAN}'\]\h '
LOCATION=${USER_COLOR}'\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"` '
BRANCH=${COLOR_BROWN}' \]$(git_branch)\['${COLOR_NC}'\] \n\['${COLOR_LIGHT_GREEN}'\]→\['${COLOR_NC}'\]'
PS1=$TIME$HOST$LOCATION$BRANCH
PS2='\['${COLOR_LIGHT_CYAN}'\]>'
