function setup_bash_sugar {
    ask_to 'add' 'an ascii art header to bash sugar section'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile

    #
    #      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/_/  _/    _/    _/_/_/    _/_/    _/_/_/    
    #     _/    _/  _/    _/  _/        _/    _/      _/        _/    _/  _/        _/    _/  _/    _/   
    #    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/        _/_/    _/    _/  _/  _/_/  _/_/_/_/  _/_/_/      
    #   _/    _/  _/    _/        _/  _/    _/            _/  _/    _/  _/    _/  _/    _/  _/    _/     
    #  _/_/_/    _/    _/  _/_/_/    _/    _/      _/_/_/      _/_/      _/_/_/  _/    _/  _/    _/      
    #

    EOF
                                                                                              
    ask_to 'add' 'a friendly command prompt'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile

    # A friendly command prompt
    # ------------------------------------------------
    export PS1='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] Hi, \u you are in \w, it is currently \@ \n\[\e[41m\] \[\e[40m\] ~>\[\e[0m\] '
    export PS2='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] cont. ~> \[\e[0m\]'
    EOF

    ask_to 'add' 'coloured terminal output'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile

    # Coloured Terminal Output
    # ------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    EOF
}
