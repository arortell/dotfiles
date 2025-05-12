# _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|
# =============== Config =

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Adding bin to path
export BIN="$HOME/.dotfiles/bin/:$HOME/.local/bin:$PATH"
export PATH="$BIN:$PATH"

# Setting default browser
export BROWSER=qutebrowser

# Setting default editor
export EDITOR=nvim
export VISUAL=nvim

# Read Man pages from neovim
export MANPAGER='nvim +Man!'

# enable fasd
eval "$(fasd --init auto)"

# disable multibyte
unsetopt MULTIBYTE

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# enable googler elvis
#source ~/.config/Dropbox/source/googler_at

# auto cd 'Just type dir name'
setopt autocd
cdpath+=(~)


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
SPACESHIP_PROMPT_ORDER=(
  time     #
  vi_mode  # these sections will be
  user     # before prompt char
  host     #
  char
  dir
  git
  node
  ruby
  jobs
  swift
  golang
  docker
  venv
  pyenv
)

# USER
SPACESHIP_USER_PREFIX="" # remove `with` before username
SPACESHIP_USER_SUFFIX="" # remove space before host

# HOST
# Result will look like this:
#   username@:(hostname)
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

# DIR
SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='1' # show only last directory

# GIT
# Disable git symbol
SPACESHIP_GIT_SYMBOL="" # disable git prefix
SPACESHIP_GIT_BRANCH_PREFIX="" # disable branch prefix too
# Wrap git in `git:(...)`
SPACESHIP_GIT_PREFIX='git:('
SPACESHIP_GIT_SUFFIX=") "
SPACESHIP_GIT_BRANCH_SUFFIX="" # remove space after branch name
# Unwrap git status from `[...]`
SPACESHIP_GIT_STATUS_PREFIX=""
SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE
SPACESHIP_NODE_PREFIX="node:("
SPACESHIP_NODE_SUFFIX=") "
SPACESHIP_NODE_SYMBOL=""

# RUBY
SPACESHIP_RUBY_PREFIX="ruby:("
SPACESHIP_RUBY_SUFFIX=") "
SPACESHIP_RUBY_SYMBOL=""

# XCODE
SPACESHIP_XCODE_PREFIX="xcode:("
SPACESHIP_XCODE_SUFFIX=") "
SPACESHIP_XCODE_SYMBOL=""

# SWIFT
SPACESHIP_SWIFT_PREFIX="swift:("
SPACESHIP_SWIFT_SUFFIX=") "
SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
SPACESHIP_GOLANG_PREFIX="go:("
SPACESHIP_GOLANG_SUFFIX=") "
SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
SPACESHIP_DOCKER_PREFIX="docker:("
SPACESHIP_DOCKER_SUFFIX=") "
SPACESHIP_DOCKER_SYMBOL=""

# VENV
SPACESHIP_VENV_PREFIX="venv:("
SPACESHIP_VENV_SUFFIX=") "

# PYENV
SPACESHIP_PYENV_PREFIX="python:("
SPACESHIP_PYENV_SUFFIX=") "
SPACESHIP_PYENV_SYMBOL=""

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME=""
#ZSH_THEME="spaceship"
##ZSH_THEME="powerlevel10k/powerlevel10k"

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

# can add k to plugins for anothe eza like list cmd
plugins=(vi-mode starship archlinux colorize colored-man-pages copyfile copypath command-not-found copybuffer eza common-aliases dirhistory fzf fasd github taskwarrior rsync sudo systemd systemadmin zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search herbstclient keep yazi zsh-system-clipboard)
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
#export SUDO_ASKPASS="$HOME/.config/Dropbox/bin/daskpass"

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
export ARCHFLAGS="-arch x86_64 -march=raptorlake"

#######################COLORS
# Great example page https://misc.flogisoft.com/bash/tip_colors_and_formatting

#Foreground
BLACK="\e[30m"
WHITE="\e[97m"
BRIGHT_GREY="\e[37m"
DARK_GREY="\e[90m"
RED="\e[31m"
BRIGHT_RED="\e[91m"
GREEN="\e[32m"
BRIGHT_GREEN="\e[92m"
YELLOW="\e[93m"
OBBLUE="\e[34m"
BRIGHT_BLUE="\e[94m"
MAGENTA="\e[35m"
BRIGHT_MAGENTA="\e[95m"
CYAN="\e[36m"
BRIGHT_CYAN="\e[96m"

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

unalias cp
alias ls='eza'
alias l='eza '
alias ll='eza -l'
alias la='eza -a'
alias lla='eza -al'
alias lt='eza -T'
alias lh='eza --long --header'
alias lth='eza -l -T --header'
alias vi='nvim'
alias vim='nvim'
alias mv='amv -g'
alias cp='acp -g'
alias dd='dd status=progress'
alias ncdu='ncdu --color dark'
alias sa='sudoedit $1'
alias reload='source ~/.zshrc'
alias hc='herbstclient'
alias free='free -h'
alias vdir='vdir --color=auto'
alias clr='clear'
alias lock='sudo passwd -l $1'
alias unlock='sudo passwd -u $1'
alias spell='aspell -a $@'
alias how='how2'
alias quit='systemctl poweroff'
alias gc='git clone $@'
alias cat='bat'
alias ct="cat"

# tldr aliases
alias tld='tldr'
alias tl='tldr'


# shortcuts for dotfile editing
alias cfg-term='$EDITOR ~/.config/kitty/kitty.conf'
alias cfg-tmux='$EDITOR ~/.config/tmux/tmux.conf.local'
alias cfg-bar='$EDITOR ~/.config/barpyrus/config.py'
alias cfg-qute='$EDITOR ~/.config/qutebrowser/config.py'
alias cfg-herb='$EDITOR ~/.config/herbstluftwm/autostart'
alias cfg-zsh='$EDITOR ~/.zshrc'


# fasd aliases
alias f='fasd -e'
alias ff='fasd -e -f'
alias fr='fasd -e -r'
alias fs='fasd -e -s'
alias fd='fasd -e -d'
alias fc='fasd -e -c'
alias fw='fasd -e -w'
alias fz='fasd -e -z'
alias fss='fasd -e -s -S'
alias c='fasd_cd -d'

# fzf 
fzf_ps='ps aux | fzf'

# Open fzf in a different directory
fzf_dir() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: fzf_dir <directory>";
  else
    find "$1" -type f | fzf --multi
  fi
}

# Edit a file found with fzf
fzf_vi() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: fzf_dir <directory>";
  else
    nvim $(fzf_dir "$1");
  fi
}

# fzf surfraw
fzf-surfraw() { 
    surfraw "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf -e)" ;
}

# Wrapper for sdcv
function def() {
    sdcv -n --utf8-output --color "$@" 2>&1 | \
    fold --width=$(tput cols) | \
    less --quit-if-one-screen -RX
}

# Wrapper for Yazi to change directory
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

SDCV_PAGER='less --quit-if-one-screen -RX'

export FZF_DEFAULT_OPTS='--layout reverse --color dark'

# add some color to grep
export GREP_COLORS='sl=49;39:cx=49;39:mt=49;31;1:fn=49;35:ln=49;32;1:bn=49;32;3;4:se=49;36';

# Show tasks on terminal open
task next

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS

# rehas automaticly
zstyle ':completion:*' rehash true

# history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS

# Enable completion on dotfiles
_comp_options+=(globdots)

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# ---------- Changes cursor shape depending on the VI mode
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    function zle-keymap-select {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode
# ---------------- End

# Keybindings
bindkey '^z' clear-screen
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# arrow driven completions
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# entered completion colorize
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# Unlock BitWarden
export BW_SESSION="NLlGm85LrZYHAR1I7Q1CR0HDfT9m7dX2Dv0uDNp10aBMbh4NiaIcClcRtDylWVSyKM/RVjL4QVTsJ8YMIWRSzw=="

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

autoload -U compinit; compinit
source ~/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh

# enable fasd
eval "$(fasd --init auto)"

########################## MUST BE CLOSE TO THE LAST LINE IN THE FILE ###################
source ~/.oh-my-zsh/plugins/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

