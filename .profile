
export LSCOLORS=ExFxCxDxBxegedabagacad
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
# Most FreeBSD & Apple Darwin supports colors
export CLICOLOR=true
# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
