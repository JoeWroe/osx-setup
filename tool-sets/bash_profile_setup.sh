for file in ./tool-sets/bash_profile/*.sh; do . $file; done

function setup_bash_profile {
red_text=$(tput setaf 1)
yellow_text=$(tput setaf 3)
white_text=$(tput setaf 7)

	while [ $current_user_input != exit ]; do
		read -d '' current_options <<-EOV

		Please select what you would like to add to your bash profile. (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Bash sugar${white_text}
		${yellow_text}∆ ${red_text}Bash aliases${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		check_user_input "Bash sugar" && setup_bash_sugar
		check_user_input "Bash aliases" && setup_bash_aliases
	done

	source ~/.bash_profile
}
