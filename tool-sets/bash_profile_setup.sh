for file in ./tool-sets/bash_profile/*.sh; do . $file; done

function setup_bash_profile {
	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select what you would like to add to your bash profile. (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Bash sugar${white_text} - add some sugar to your terminal.
		${yellow_text}∆ ${red_text}Bash aliases${white_text} - add some useful aliases to your terminal.
		${yellow_text}∆ ${red_text}Exit${white_text}
		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input "bash sugar" && setup_bash_sugar
		check_user_input "bash aliases" && setup_bash_aliases

		clean_exit
	done

	source ~/.bash_profile
}
