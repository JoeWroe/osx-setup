for file in ./tool-sets/bash_profile/*.sh; do . $file; done

function setup_bash_profile {

    ask_to 'add sugar to bash'
    check_if_user_input_yes && setup_bash_sugar 

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
    EOF

    source ~/.bash_profile
}
