#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -r /home/sydney/.byobu/prompt ] && . /home/sydney/.byobu/prompt   #byobu-prompt#
complete -F _complete_alias config
