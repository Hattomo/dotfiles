# to set up this exec follow command
# cp ./.bashrc ~/.bashrc

autoload -Uz vcs_info
autoload -Uz compinit && compinit
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
setopt prompt_subst #プロンプト表示する度に変数を展開
# zstyle ':vcs_info:git:*' formats '%b'
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'

# precmd(){
#     vcs_info
#     #success_indicator
# }

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
# Only Bash
#shopt -s checkwinsize

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ls='ls -GF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
# Check Environment ============
# ⚠ Please check git environment for PS1

# home brew
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(jump shell --bind=cd)"
# eval "$(zoxide init bash --cmd cd --hook pwd)"
# cd() { builtin cd "$@"; }
# eval "$(ssh-agent -s)"
#===============================

# notification
# alias alert=osascript -e 'display notification "message" with title "title" subtitle "subtitle" sound "notification"'

PROMPT='%(?:%{$fg_bold[green]%}🚀:%{$fg_bold[red]%}🔥)|%T|%F{cyan}%n%F{white}@%F{green}%m%F{white}:%F{magenta}%c%F{white}`git_branch`$ '
#PROMPT='%(?:%{$fg_bold[green]%}😶:%{$fg_bold[red]%}🙃🙃🙃)|%T|%F{cyan}%n%F{white}@%F{green}%m%F{white}:%F{magenta}%c%F{white}'\$vcs_info_msg_0_'$ '
#PROMPT='%(?:%{$fg_bold[green]%}😶:%{$fg_bold[red]%}🙃🙃🙃)|%T|%F{cyan}%n%F{white}@%F{green}%m%F{white}:%F{magenta}%c%F{white}`(__git_ps1)`$ '

#Bash
#PS1='${debian_chroot:+($debian_chroot)}$(success_indicator)\[$(tput sgr0)\]|\A|\[\033[01;94m\]\u\[\033[91m\]*\[\033[32m\]\h\[\033[39m\]:\[\033[35m\]\W\[\033[00m\]$(git_branch)\$'
#PS1='${debian_chroot:+($debian_chroot)}$(success_indicator)\[$(tput sgr0)\]|\A|\[\033[01;94m\]\u\[\033[91m\]*\[\033[32m\]\h\[\033[39m\]:\[\033[35m\]\W\[\033[00m\]$(__git_ps1)\$'
export LSCOLORS="gxfxcxdxabegedabagacad"
