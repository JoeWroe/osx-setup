#!/bin/bash

function setup_bash_profile {
    ask_to 'add' 'a friendly command prompt'
    check_if_user_input_yes && cat <<'    EOF' >>~/.bash_profile

    # A friendly command prompt
    # ------------------------------------------------
    export PS1='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] Hi, \u you are in \w, it is currently \@ \n\[\e[41m\] \[\e[40m\] ~>\[\e[0m\] '
    export PS2='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] cont. ~> \[\e[0m\]'
    EOF

    ask_to 'add' 'coloured terminal output'
    check_if_user_input_yes && cat <<'    EOF' >>~/.bash_profile

    # Coloured Terminal Output
    # ------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    EOF

    ask_to 'add' 'up arrow bash history search'
    check_if_user_input_yes && cat <<'    EOF' >>~/.bash_profile

    # Up arrow bash history search
    # -----------------------------------------------
    bind '"\e[A":history-search-backward'               
    EOF

    ask_to 'add' 'down arrow bash history search'
    check_if_user_input_yes && cat <<'    EOF' >>~/.bash_profile

    # Down arrow bash history search
    # -----------------------------------------------
    bind '"\e[B":history-search-forward'
    EOF

    ask_to 'setup' 'prefered list alias'
    check_if_user_input_yes && cat <<'    EOF' >>~/.bash_profile

    alias ls='ls -FGlAhp'                       # Preferred 'ls' implementation
    
    source ~/.bash_profile
}
