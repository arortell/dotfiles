
# _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
# =============== Config =

# If you come from bash you might have to change your $PATH.
# REMOVE PYENV
export PATH="$HOME/bin:$PATH"


# disable multibyte
unsetopt MULTIBYTE

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Java Bullshit
#export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"
#export _JAVA_OPTIONS="-Dsun.awt.disablegrab=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
#export _SILENT_JAVA_OPTIONS="$_JAVA_OPTIONS"
#unset _JAVA_OPTIONS
#alias java='java "$_SILENT_JAVA_OPTIONS"'

# auto cd 'Just type dir name'
setopt autocd
cdpath+=(~)

## Powerline Theme settings
POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='blue'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='20'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='46'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='235'
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='178'
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='235'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND='88'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='235'
POWERLEVEL9K_BATTERY_CHARGED_ICON='/UF240'
POWERLEVEL9K_BATTERY_LOW_ICON='/UF240'
POWERLEVEL9K_BATTERY_CHARGING_ICON='/UF1E6'
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='195'
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='009'
POWERLEVEL9K_BATTERY_ICON='\UF1E6'

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ " 
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="249"
POWERLEVEL9K_TODO_BACKGROUND="black"
POWERLEVEL9K_TODO_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="249"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"
POWERLEVEL9K_STATUS_OK_BACKGROUND="black"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="black"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('status' 'todo' 'dir' 'vcs' 'dir_writable')
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('background_jobs' 'load' 'ram_joined' 'public_ip' 'battery')
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="robbyrussell"
# ZSH_THEME="igeek"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"


# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alias-finder archlinux colorize colored-man-pages_mod compleat copyfile cp common-aliases dircycle dirhistory dirpersist fasd fzf git github git-prompt history history-substring-search pip python rsync sudo systemd systemadmin zsh-syntax-highlighting zsh-autosuggestions zsh-completions zsh-history-substring-search zsh_reload zsh-navigation-tools zshmarks)
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit compinit promptinit run-help
alias help=run-help
compinit
promptinit
zstyle ':completion:*' menu select
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# User configuration
export MANPATH="/usr/local/man:/usr/share/man"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# We will try this here now
export SUDO_ASKPASS="$HOME/.config/Dropbox/bin/daskpass"

# Bash compatibily
function bashsource(){
  if [ -z $1 ]; then
    echo "bashsource FILE"
    return 1
  fi
  export BASH_SOURCE=$(dirname $1)
  source $1
}


### Get number of jobs
function precmd {
	psvar[2]=$#jobstates; [[ $psvar[2] -eq 0 ]] && psvar[2]=()
}

zmodload zsh/parameter

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


#######################COLORS
# Great example page https://misc.flogisoft.com/bash/tip_colors_and_formatting

#Foreground
BLACK="\e[30m"
WHITE="\e[97m"
LIGHT_GREY="\e[37m"
DARK_GREY="\e[90m"
RED="\e[31m"
LIGHT_RED="\e[91m"
GREEN="\e[32m"
LIGHT_GREEN="\e[92m"
YELLOW="\e[93m"
OBBLUE="\e[34m"
LIGHT_BLUE="\e[94m"
MAGENTA="\e[35m"
LIGHT_MAGENTA="\e[95m"
CYAN="\e[36m"
LIGHT_CYAN="\e[96m"

#Background
B_BLACK="\e[40m"
B_LIGHT_GREY="\e[47m"
B_DARK_GREY="\e[100m"
B_LIGHT_RED="\e[41m"
B_RED="\e[101m"
B_LIGHT_GREEN="\e[42m"
B_GREEN="\e[102m"
B_YELLOW="\e[43m"
B_LIGHT_YELLOW="\e[103m"
B_BLUE="\e[44m"
B_LIGHT_BLUE="\e[104m"
B_MAGENTA="\e[45m"
B_LIGHT_MAGENTA="\e[105m"
B_CYAN="\e[46m"
B_LIGHT_CYAN="\e[106m"
B_WHITE="\e[107m"

#Formating
DIM="\e[2m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
INVERT="\e[7m"
BOLD="\e[1m"
HIGHLIGHT=$(printf "\033[42;1m")
NORM="\e[0m"

# prevent file from being overwritten with >
# can be overcome with >|
set -o noclobber

# disables csh-style history expansion.
# enables echo "#!" > 
set +o histexpand

# enable extened globs
setopt extendedglob

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias j="jump"
alias b="bookmark"
alias count='ls -1 | wc -l'
alias l="ls -CF"
alias ll="ls -lh"
alias la="ls -A"
alias pc="pycp $@"
alias c="clear"
alias ct="/usr/bin/cat"
alias cat="ccat"
alias cp="acp -g $@"
alias dd='dd status=progress'
alias ec='emacsclient -nw'
alias vcp="vcp -vp $@"
alias du='cdu -sidh'
alias pm='pymv -g $@'
alias rm='rm -iv $@'
alias mv='amv -g $@'
alias mkdir='mkdir -p $@'
alias ncdu='ncdu --color dark'
alias def="/usr/bin/sdcv"
alias del="trash-put $@"
alias debug="pudb3 $@"
alias df='dfc -p /dev/'
alias sa='sudoedit $1'
alias cfg-zsh='ec ~/.zshrc'
alias cfg-term='ec ~/.config/alacritty/alacritty.yml'
alias cfg-qute='ec ~/.config/qutebrowser/config.py'
alias cfg-herb='ec ~/.config/herbstluftwm/autostart'
alias cfg-profile='sa /etc/profile'
alias cfg-rofi='te ~/.Xresources'
alias rld-rofi='xrdb ~/.Xresources'
alias rld-zsh='source ~/.zshrc'
alias rld-profile='source /etc/profile'
alias free='free -h'
alias vdir='vdir --color=auto'
alias clr='clear && ls'
alias lock='sudo passwd -l $1'
alias unlock='sudo passwd -u $1'
alias spell='aspell -a $@'
alias update="pik"
alias rcp='rsync -aP'
alias rmv='rsync -aP --remove-source-files'
alias restore='trash-restore'
alias how='function hdi(){ howdoi $* -c -n 5; }; hdi'
alias quit='sudo shutdown -h now'

# unalias grep
# alias grep='grep --color=always'

# add some color to grep
export GREP_COLORS='sl=49;39:cx=49;39:mt=49;31;1:fn=49;35:ln=49;32;1:bn=49;32;3;4:se=49;36';

#cat ~/.oh-my-zsh/term_start
#task list
################# Functions ######################

# List network stats
m-ip() {
  echo "--------------- Network Information ---------------"
  echo "router ip:" $(netstat -rn | awk 'FNR == 3 {print $2}')
  # newer system like archlinux
  ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
  ip addr | awk '/global/ {print $3,$4}'
  ip addr | awk '/ether/ {print $1,$2}'
  ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
  echo "External IP: $(dig +short myip.opendns.com @resolver1.opendns.com)"
  echo "---------------------------------------------------"
}

# list everything connected to network with nmap
m-connected() {
  echo "--------------- Connected Devices -----------------"
    nmap -sn $(netstat -rn | awk 'FNR == 3 {print $2}')/24
  echo "---------------------------------------------------"
}

# list everything connected to network
m-devices() {
  echo "---------------- Connected Devices ---------------"
  sudo arp-scan --interface=wlan0 --localnet

}

# Kill all zombie process
killall-zombies() { 
  kill -HUP $(ps -A -ostat,ppid | grep -e '[zZ]'| awk '{ print $2 }') ;
}

# create backup copy
cpbak() { 
  cp $1{,.bak} ;
}

# Duh read the function name
update-grub() {
  sudo grub-mkconfig -o /boot/grub/grub.cfg ;
}


# ls recent items at bottom with green TODAY yellow YESTERDAY substituted with file permission also
lst() {
  ls -vAFq --color=yes -got --si --time-style=long-iso "$@" \
  | sed "s/$(date +%Y-%m-%d)/\x1b[32m     TODAY\x1b[m/;s/$(date +'%Y-%m-%d' -d yesterday)/\x1b[33m YESTERDAY\x1b[m/" \
  | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}' | tac
}

# make and cd to "$1" directory
function mcd ()
{
   mkdir -p "$1"; cd "$1";
}

function emacs()
{
  # -c creates a new frame
  # -a= fires a new emacs server if none is running
  emacsclient -c -a= $*
}

# rember dirs for dirs -v
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi

DIRSTACKSIZE=20

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

# rehas automaticly
zstyle ':completion:*' rehash true

# file manager keybindings
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# arrow driven completions
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# entered completion colorize
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# rvm ruby virtualenv
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Fix for home and end keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#### THIS NEEDS TO BE UNCOMMENTED FOR SPACESHIOP TO WORK
#source "/home/b14ckr41n/.oh-my-zsh/custom/themes/spaceship.zsh-theme"


eval "$(fasd --init auto)"

source ~/.oh-my-zsh/plugins/dasht/completions.zsh
# syntax highlight source ######################### MUST BE LAST LINE IN FILE ###################
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
