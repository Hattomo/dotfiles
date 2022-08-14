# to set up this exec follow command
# cp ./.bashrc ~/.bashrc

function success_indicator() {
    if [ $? -eq 0 ] ; then
        echo "🚀"
    else
        echo "🔥"
    fi
}

git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#sudo find / -name git-completion.bash
#sudo find / -name git-prompt.sh
#if [ -f "~/mnt/c/Program Files/Git/etc/profile.d/git-prompt.sh" ]; then
#  source "~/mnt/c/Program Files/Git/etc/profile.d/git-prompt.sh"
#fi

#if [ -f "~/mnt/c/Program Files/Git/mingw64/share/git/completion/git-completion.bash" ]; then
#  source "~/mnt/c/Program Files/Git/mingw64/share/git/completion/git-completion.bash"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias rsync='rsync -ahvrz --info=progress2'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -Iv'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# git alias
alias clone='git clone'
alias push='git push'
alias pull='git pull'
alias commit='git commit -m'
alias switch='git switch'
alias checkout='git checkout'
alias branch='git branch'
alias log='git log'
alias status='git status'
alias merge='git merge'
alias diff='git diff'

# Don't override files
set -o noclobber
export LESSCHARSET=utf-8

# Add an "alert" alias for long running commands.  Use like so:
# for linux
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# 👀 check your environment===========
# home brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(jump shell --bind=cd)"
# eval "$(zoxide init bash --cmd cd --hook pwd)"
# cd() { builtin cd "$@"; }

# ======================================

#PS1='${debian_chroot:+($debian_chroot)}$(success_indicator)\[$(tput sgr0)\]|\A|\[\033[01;94m\]\u\[\033[91m\]*\[\033[32m\]\h\[\033[39m\]:\[\033[35m\]\W\[\033[00m\]$(__git_ps1)\$'
PS1='${debian_chroot:+($debian_chroot)}$(success_indicator)\[$(tput sgr0)\]|\A|\[\033[01;94m\]\u\[\033[91m\]*\[\033[32m\]\h\[\033[39m\]:\[\033[35m\]\W\[\033[00m\]$(git_branch)\$'

##############################
