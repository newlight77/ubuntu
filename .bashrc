echo "Hello $LOGNAME"
export PATH=/apps/VSCode:$PATH
export PATH=/apps/idea:$PATH
export PATH=/apps/sts:$PATH
export PATH=/apps/cassandra/bin:$PATH
export PATH=/apps/devcenter/bin:$PATH
export PATH=/apps/tomcat/bin:$PATH
export PATH=/apps/maven/bin:$PATH


YELLOW="\033[1;33m"
GREEN="\033[1;32m"
PURPLE="\033[1;35m"
WHITE="\033[1;37m"
RESET="\033[0;37m"

function parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " *"
}

function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[$WHITE\]\t \[${YELLOW}\]\u@\h\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch) \[$WHITE\]in \[$GREEN\]\w\n\[$YELLOW\][\#]\[$WHITE\]\$ \[$RESET\]"
