# ~/.oh-my-zsh/custom/aliases.zsh
alias vim="nvim"
alias vi="vim -u NONE"
alias py="source .venv/bin/activate"
alias psql="PAGER='less -S' psql"  # Use less -S for left/right arrows in psql output

# Change namespace used by kubectl if none is specified
alias knsp="kubectl config set-context --current --namespace"

# Stern
alias stern="stern --exclude-container='istio-proxy' --timestamps"

# Checkout master, and clear any deleted branches
dev() {
  main_branch=$(git remote show origin | grep 'HEAD branch' | sed 's/.*: //')
  git checkout ${main_branch}
  git pull
  git gone
}

# Django
alias dj="python manage.py"

alias tests="PYTHONBREAKPOINT= pytest --disable-warnings --tb=short --randomly-dont-reorganize"

# Git
alias gb='git branch --sort -committerdate --column=auto'
