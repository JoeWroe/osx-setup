#!/bin/bash

# This function takes two arguments and generates a question with them,
# prompting the user to select a yes/no answer which is read from STDIN and set
# to the current_user_input variable.
 
function ask_to {
    echo ""
    read -p "Would you like to $1 $2? (Anything other than 'yes' will move to the next step) ~> " current_user_input;
}
