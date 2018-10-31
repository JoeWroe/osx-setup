for file in ./tool-sets/bash_profile/*.sh; do . $file; done

function setup_bash_profile {

    ask_to 'add sugar to bash'
    check_user_input yes && setup_bash_sugar 

    ask_to 'add preferred aliases'
    check_user_input yes && setup_bash_aliases

    source ~/.bash_profile
}
