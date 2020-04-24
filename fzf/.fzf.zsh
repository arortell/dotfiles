# Setup fzf
# ---------
if [[ ! "$PATH" == */home/b14ckr41n/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/b14ckr41n/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/b14ckr41n/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/b14ckr41n/.fzf/shell/key-bindings.zsh"
