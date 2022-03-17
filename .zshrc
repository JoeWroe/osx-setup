# ---------------------------------------------------------------------------
# OH MY ZSH DEFAULT CONFIG OPTIONS

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="refined"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time format
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
plugins=(chucknorris git history-substring-search)

source $ZSH/oh-my-zsh.sh

# ---------------------------------------------------------------------------
# USER CONFIGURATION

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export HISTCONTROL=erasedups
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# ---------------------------------------------------------------------------
# PYTHON CONFIGURATION

function auto_active_env() {
  ## Default path to virtualenv in your projects
  DEFAULT_ENV_PATH="./.venv"

  ## If env folder is found then activate the vitualenv
  function activate_venv() {
    if [[ -f "${DEFAULT_ENV_PATH}/bin/activate" ]] ; then 
      source "${DEFAULT_ENV_PATH}/bin/activate"
      echo "Activating ${VIRTUAL_ENV}"
    fi
  }

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    activate_venv
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate then run a new env folder check
      parentdir="$(dirname ${VIRTUAL_ENV})"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        echo "Deactivating ${VIRTUAL_ENV}"
        deactivate
        activate_venv
      fi
  fi
}
chpwd_functions=(${chpwd_functions[@]} "auto_active_env")

# PudB config
export PYTHONBREAKPOINT="pudb.set_trace"

export PIPENV_VENV_IN_PROJECT=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# ---------------------------------------------------------------------------
# ALIASES

alias ls='ls -lGFAhp'

alias vim='nvim'
alias vi='nvim'
