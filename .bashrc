
if [ -f ~/.ubuntu/.bashrc_natenadau ]; then
    source ~/.ubuntu/.bashrc_natenadau
fi

if [ -f ~/.ubuntu/.bash_aliases ]; then
    source ~/.ubuntu/.bashrc_aliases
fi

if [ -f ~/.ubuntu/.bash_pS12 ]; then
    source ~/.ubuntu/.bashrc_ps12
fi

if [ -f ~/.ubuntu/.profile ]; then
    source ~/.ubuntu/.profile
fi

if [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
    source ~/.bash-git-prompt/gitprompt.sh
fi

# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
