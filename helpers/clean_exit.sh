# This function wraps the checking of user input for 'exit', it then unsets
# #current_user_input to prevent it's persistence breaking other parts of the
# program (or system....), finally, it breaks out the loop a single level to
# the parent loop, this prevents an exit ending the program.

function clean_exit {
	check_user_input "exit" && source ~/.zshrc && unset current_user_input && break
}
