function setup_bash_aliases {
        ask_to 'add an ascii art header to bash aliases section'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile

    # 
    #      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/    _/        _/_/_/    _/_/      _/_/_/  _/_/_/_/    _/_/_/   
    #     _/    _/  _/    _/  _/        _/    _/      _/    _/  _/          _/    _/    _/  _/        _/        _/          
    #    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/      _/_/_/_/  _/          _/    _/_/_/_/    _/_/    _/_/_/      _/_/       
    #   _/    _/  _/    _/        _/  _/    _/      _/    _/  _/          _/    _/    _/        _/  _/              _/      
    #  _/_/_/    _/    _/  _/_/_/    _/    _/      _/    _/  _/_/_/_/  _/_/_/  _/    _/  _/_/_/    _/_/_/_/  _/_/_/         
    #

    EOF

    ask_to 'add up arrow bash history search'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile
    bind '"\e[A":history-search-backward'        # Up arrow bash history search
    EOF

    ask_to 'add down arrow bash history search'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile
    bind '"\e[B":history-search-forward'         # Down arrow bash history search
    EOF

    ask_to 'add preferred list alias'
    check_user_input yes && cat <<'    EOF' >>~/.bash_profile
    alias ls='ls -FGlAhp'                        # Preferred 'ls'
    EOF
}
