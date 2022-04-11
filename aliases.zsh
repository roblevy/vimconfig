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
alias ts="tailscale status"

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

# How long has my AWS SSO token got left?
sso-expires() {
  jq .expiresAt < $(echo "$HOME/.aws/sso/cache/$(ls -t $HOME/.aws/sso/cache  | head -n 1)")
}

# Create a Postgres docker and psql onto it
psql-local() {
  image="psql-local"
  tmux split-window "docker run --rm --name ${image} postgres:11.6"
  while ! docker exec --user postgres psql-local psql &> /dev/null
  do
    echo -n "."
    sleep 0.2
  done
  echo
  echo "Container up. Split pane will close on ctrl-c"
  sleep 0.2
  docker exec --user postgres -ti psql-local psql
}
