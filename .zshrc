# Path to your oh-my-zsh installation.
export ZSH="/home/rob/.oh-my-zsh"
export TERM=xterm-256color

export AIRFLOW_HOME="/home/rob/dev/airflow-infrastructure"
export KUBECONFIG="/home/rob/.kube/config"
source /home/rob/.github_token
# This is useful for making git output only use a pager if necessary, _and_ to
# not clear the screen when less is quit.
export LESS="-F -X -R $LESS"

# Airflow
export AIRFLOW_HOME=/home/rob/dev/airflow

# Make things that respect EDITOR use vim
# export EDITOR=vim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# Uncomment this function to make the title match the CWD
function precmd () {
  window_title="\033]0;${PWD}\007"
  echo -ne "$window_title"
}
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting kubectl docker docker-compose)

source $ZSH/oh-my-zsh.sh

# User configuration
# PYPI
source /home/rob/.pypi_login
export PIP_INDEX_URL=https://${PYPI_USER}:${PYPI_PASSWORD}@pypi.limejump.io/simple

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
s3-zipfile() {
  aws s3 cp $1 - | zcat | vim -
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Spin up a Postgres instance
# Specify other params (such as --name) at the command line
function make_pg() {
  tag=$1
  shift
  docker run --detach --rm --env POSTGRES_HOST_AUTH_METHOD='trust' -p 5411:5432 $@ postgres:${tag}
  docker ps
  echo "Created a Postgres ${tag} instance."
  echo 'Try `psql_local` to connect'
}
function psql_local() {
  psql -p 5411 -h localhost -U postgres $@
}

# Kubectl autocompletion
source <(kubectl completion zsh)
complete -F __start_kubectl k

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Report CPU usage for commands running longer than 10 seconds
export REPORTTIME=10

function get-ip {
  echo $(getent hosts ${1} | awk '{ print $1 }' | head -n 1)
}

function random {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n 1
}

source /home/rob/.billing-dco
