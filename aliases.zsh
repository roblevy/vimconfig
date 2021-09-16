# ~/.oh-my-zsh/custom/aliases.zsh
alias vi="vim -u NONE"
alias py="source .venv/bin/activate"
alias open="xdg-open"
alias psql="PAGER='less -S' psql"  # Use less -S for left/right arrows in psql output
alias sso="aws sso login --profile dar"
alias sso_staging="aws sso login --profile dar_b"
alias staging-b="sshuttle -r robl@salt-master --dns 172.16.0.0/16"
alias staging-a="sshuttle -r robl@salt-master --dns 192.168.0.0/16"
alias prod="sshuttle -r robl@salt-prod --dns 192.168.0.0/16"
alias tsup="sudo tailscale up --accept-routes"
alias tsd="sudo tailscale down"

# Change namespace used by kubectl if none is specified
alias knsp="kubectl config set-context --current --namespace"

# Stern
alias stern="stern --exclude-container='istio-proxy' --timestamps"
