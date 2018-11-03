function setup_bash_sugar {
red_text=$(tput setaf 1)
yellow_text=$(tput setaf 3)
white_text=$(tput setaf 7)

	while [ $current_user_input != exit ]; do
		read -d '' current_options <<-EOV

		Please select which bash profile sugar you would like to add. (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Ascii art${white_text} - add an ascii art header to the sugar part of your bash profile.
		${yellow_text}∆ ${red_text}Command prompt${white_text} - add a friendly command prompt.
		${yellow_text}∆ ${red_text}Coloured output${white_text} - add colour to the text output from common terminal commands.
		${yellow_text}∆ ${red_text}Exit${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		check_user_input "Ascii art" && add_ascii_art_sugar_header
		check_user_input "Command prompt" && add_command_prompt
		check_user_input "Coloured output" && add_coloured_terminal_output
	done
}

function add_ascii_art_sugar_header {
	cat <<-EOF >>~/.bash_profile

		#
		#      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/_/  _/    _/    _/_/_/    _/_/    _/_/_/    
		#     _/    _/  _/    _/  _/        _/    _/      _/        _/    _/  _/        _/    _/  _/    _/   
		#    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/        _/_/    _/    _/  _/  _/_/  _/_/_/_/  _/_/_/      
		#   _/    _/  _/    _/        _/  _/    _/            _/  _/    _/  _/    _/  _/    _/  _/    _/     
		#  _/_/_/    _/    _/  _/_/_/    _/    _/      _/_/_/      _/_/      _/_/_/  _/    _/  _/    _/      
		#

	EOF
}
                                                                                              
function add_command_prompt {
	cat <<'        EOF' >>~/.bash_profile

		# A friendly command prompt
		# ------------------------------------------------
		export PS1='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] Hi, \u you are in \w, it is currently \@ \n\[\e[41m\] \[\e[40m\] ~>\[\e[0m\] '
		export PS2='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] cont. ~> \[\e[0m\]'
        EOF
}

function add_coloured_terminal_output {
	cat <<-EOF >>~/.bash_profile

		# Coloured Terminal Output
		# ------------------------------------------------
		export CLICOLOR=1
		export LSCOLORS=ExFxBxDxCxegedabagacad
	EOF
}
