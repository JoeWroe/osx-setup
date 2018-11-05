# This function should take a single argument and checks that the argument
# matches the current_user_input variable. It's used to confirm user input when
# deciding which tool to install.

function check_user_input {
    [[ $current_user_input = $1 ]]
}
