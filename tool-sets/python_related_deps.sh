function install_python_related_deps {
	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select which Python related dependency you would like to install (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Python 3 ${white_text}- ?Nobody expects the Spanish Inquisition!?
		${yellow_text}∆ ${red_text}Pipenv ${white_text}- Python package manager.
		${yellow_text}∆ ${red_text}Pyenv ${white_text}- Simple version manager for Python.
		${yellow_text}∆ ${red_text}Pip ${white_text}- PIPPIIN!!
		${yellow_text}∆ ${red_text}Virtualenv ${white_text}- Who knows why?
		${yellow_text}∆ ${red_text}Pynvim ${white_text}- Neovim Python client.
		${yellow_text}∆ ${red_text}Exit ${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input 'python 3' && brew install python@3
		check_user_input 'pipenv' && brew install pipenv
		check_user_input 'pyenv' && brew install pyenv
		check_user_input 'pip' && pip3 install --upgrade pip
		check_user_input 'virtualenv' && pip3 install virtualenv
		check_user_input 'pynvim' && install_pynvim

		clean_exit
	done
}


function install_pynvim {

  mkdir -p ~/.virtualenv
  cd ~/.virtualenv
  python3 -m venv ./neovim
  source neovim/bin/activate
  pip install --upgrade pynvim

  echo "Done!"
}
