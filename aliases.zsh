# ~/.oh-my-zsh/custom/aliases.zsh
alias vim="nvim"
alias vi="vim -u NONE"
alias py="source .venv/bin/activate"
alias open="wslview"
alias psql="PAGER='less -S' psql"  # Use less -S for left/right arrows in psql output

# Change namespace used by kubectl if none is specified
alias knsp="kubectl config set-context --current --namespace"

# Stern
alias stern="stern --exclude-container='istio-proxy' --timestamps"

# Checkout master, and clear any deleted branches
master() {
  main_branch=$(git symbolic-ref refs/remotes/origin/HEAD | rev | cut -d '/' -f 1 | rev)
  git checkout ${main_branch}
  git pull
  git gone
}
