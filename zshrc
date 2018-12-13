#-*-sh-*-

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

setopt HIST_IGNORE_SPACE

# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="tzbob"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git sbt systemd vi-mode extract)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

source ~/.localAlias

alias em="emacsclient -c -a emacs"

alias subs="subberthehut -qsf "
alias o="mimeopen"
alias syu="yay"
alias df="df -h"
alias ls="ls -F --color=auto"

alias sus="systemctl suspend"
alias hib="systemctl hibernate"
alias off="systemctl poweroff"
alias reb="systemctl reboot"

alias sudo="sudo "

alias b="cd ~/bin"
alias t="cd ~/Torrents"
alias d="cd ~/Downloads"

function mnt() {
    target=$(ls /dev/sd* | rofi -dmenu)
    udisksctl mount -b $target
}

function umnt() {
    target=$(ls /run/meda/bob/* | rofi -dmenu)
    udisksctl unmount -p $target
}

function chpwd() {
    emulate -L zsh
    exa -a
}

function pdf2ps2pdf() {
    temp=/tmp/"$1".ps
    pdf2ps "$1" $temp
    ps2pdf $temp min."$1"
}
