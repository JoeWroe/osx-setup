function setup_bash_aliases {
red_text=$(tput setaf 1)
yellow_text=$(tput setaf 3)
white_text=$(tput setaf 7)

	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select which aliases you would like to add to your bash profile. (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Ascii art${white_text} - add an ascii art header to the aliases part of your bash profile.
		${yellow_text}∆ ${red_text}Up arrow history search${white_text} - a single press of the 'up' arrow searches your bash history for the most recent, alphabetically similar command.
		${yellow_text}∆ ${red_text}Down arrow history search${white_text} - a single press of the 'down' arrow searches your bash history for the most recent, alphabetically similar command.
		${yellow_text}∆ ${red_text}Preferred list${white_text} - 'ls' does 'ls -FGlAhp'.
		${yellow_text}∆ ${red_text}Exit${white_text}
		EOV

		echo "$current_options"

		read current_user_input

		check_user_input "Ascii art" && add_ascii_art_aliases_header
		check_user_input "Up arrow history search" && add_up_arrow_bash_history_search
		check_user_input "Down arrow history search" && add_down_arrow_bash_history_search
		check_user_input "Preferred list" && add_preferred_list_alias
	done
}

function add_ascii_art_alises_header {
	cat <<-EOF >>~/.bash_profile

		# 
		#      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/    _/        _/_/_/    _/_/      _/_/_/  _/_/_/_/    _/_/_/   
		#     _/    _/  _/    _/  _/        _/    _/      _/    _/  _/          _/    _/    _/  _/        _/        _/          
		#    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/      _/_/_/_/  _/          _/    _/_/_/_/    _/_/    _/_/_/      _/_/       
		#   _/    _/  _/    _/        _/  _/    _/      _/    _/  _/          _/    _/    _/        _/  _/              _/      
		#  _/_/_/    _/    _/  _/_/_/    _/    _/      _/    _/  _/_/_/_/  _/_/_/  _/    _/  _/_/_/    _/_/_/_/  _/_/_/         
		#

	EOF
}

function add_up_arrow_bash_history_search {
	cat <<'	EOF' >>~/.bash_profile
	bind '"\e[A":history-search-backward'        # Up arrow bash history search
	EOF
}

function add_down_arrow_bash_history_search {
	cat <<'	EOF' >>~/.bash_profile
	bind '"\e[B":history-search-forward'         # Down arrow bash history search
	EOF
}

function add_preferred_list_alias {
	cat <<'	EOF' >>~/.bash_profile
	alias ls='ls -FGlAhp'                        # Preferred 'ls'
	EOF
}
