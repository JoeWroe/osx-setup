[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#
#      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/_/  _/    _/    _/_/_/    _/_/    _/_/_/    
#     _/    _/  _/    _/  _/        _/    _/      _/        _/    _/  _/        _/    _/  _/    _/   
#    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/        _/_/    _/    _/  _/  _/_/  _/_/_/_/  _/_/_/      
#   _/    _/  _/    _/        _/  _/    _/            _/  _/    _/  _/    _/  _/    _/  _/    _/     
#  _/_/_/    _/    _/  _/_/_/    _/    _/      _/_/_/      _/_/      _/_/_/  _/    _/  _/    _/      
#


# A friendly command prompt
# ------------------------------------------------
source ~/.git-prompt.sh

export PS1='\[\e[41m\] \[\e[00m\]\[\e[1;31m\] Hi \u, you where in \w on \d at \@ \[\e[01;34m\]$(__git_ps1 " (%s)") \n\[\e[41m\] \[\e[00m\] \[\e[01;31m\]~>\[\e[0m\] '
export PS2='\[\e[41m\] \[\e[00m\]\[\e[1;31m\] cont. ~> \[\e[0m\]'

# Coloured Terminal Output
# ------------------------------------------------
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

bind '"\e[A":history-search-backward'        # Up arrow bash history search
bind '"\e[B":history-search-forward'         # Down arrow bash history search

alias ls='ls -FGlAhp'                        # Preferred 'ls'




# >>> use neovim (not system) >>>
alias vim="nvim"
alias vi="nvim"
# <<< use neovim <<<

# >>> PYTHON >>>

# >>> Set Global default Python to use pyenv >>>
export PIPENV_VENV_IN_PROJECT=true
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$PATH:/Users/joe/.local/bin"
eval "$(pyenv init -)"
# <<< Python <<<

# >>> Activate venv if it exists >>>
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

export PROMPT_COMMAND=auto_active_env

# >>> Python pubd debugging config >>>
export PYTHONBREAKPOINT="pudb.set_trace"
# <<< Python <<<

# <<< PYTHON <<<


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/joe/.sdkman"
[[ -s "/Users/joe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/joe/.sdkman/bin/sdkman-init.sh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joe/.google-cloud-sdk/path.bash.inc' ]; then . '/Users/joe/.google-cloud-sdk/path.bash.inc'; fi


# The next line enables shell command completion for gcloud.
if [ -f '/Users/joe/.google-cloud-sdk/completion.bash.inc' ]; then . '/Users/joe/.google-cloud-sdk/completion.bash.inc'; fi
