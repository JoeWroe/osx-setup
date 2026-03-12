function install_python_related_deps {
	while true; do
		select opt in \
			"Python 3" \
			"Pipenv" \
			"Pyenv" \
			"Pip" \
			"Virtualenv" \
			"Pynvim" \
			"Exit"; do
			case $opt in
				"Python 3")   brew install python@3 ;;
				"Pipenv")     brew install pipenv ;;
				"Pyenv")      brew install pyenv ;;
				"Pip")        pip3 install --upgrade pip ;;
				"Virtualenv") pip3 install virtualenv ;;
				"Pynvim")     install_pynvim ;;
				"Exit")       return ;;
				*)            echo "Invalid option" ;;
			esac
			break
		done
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
