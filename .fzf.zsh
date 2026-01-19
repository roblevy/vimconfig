# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/rob.levy/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/rob.levy/.fzf/bin"
fi

source <(fzf --zsh)
