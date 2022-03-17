function install_python_related_deps {
	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select which Python related dependency you would like to install (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Python 3 ${white_text}- ?Nobody expects the Spanish Inquisition!?
		${yellow_text}∆ ${red_text}Pipenv ${white_text}- Python package manager.
		${yellow_text}∆ ${red_text}Pyenv ${white_text}- Simple version manager for Python.
		${yellow_text}∆ ${red_text}Exit ${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input 'python 3' && brew install python@3
		check_user_input 'pipenv' && brew install pipenv
		check_user_input 'pyenv' && brew install pyenv

		clean_exit
	done
}
