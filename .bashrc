PS1='[\[\e[0;32m\]\u\[\e[m\]@\[\e[0;32m\]\h\[\e[m\]] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

alias ls='ls -FphG'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# Quick look.
alias qlf='qlmanage -p "$@" >& /dev/null'

# Django.
alias rs='workon doors; python ~/Scripts/mysite/manage.py runserver_plus'

alias sshfs='sshfs -oauto_cache,reconnect'

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=$PATH:$HOME/.rvm/bin

# Erase duplicates across whole history.
#export HISTCONTROL=erasedups

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/share/python/virtualenvwrapper.sh

# SVN.
export SVN_EDITOR=vim

# Vi mode for bash.
#set -o vi

# Brew Autocompletes.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
