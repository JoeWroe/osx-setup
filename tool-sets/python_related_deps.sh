function install_python_related_deps {
	while true; do
		select opt in \
			"uv" \
			"Python 3" \
			"Pyright" \
			"Pipenv" \
			"Pynvim" \
			"Exit"; do
			case $opt in
				"uv")      brew install uv ;;
				"Python 3") uv python install ;;
				"Pyright")  uv tool install pyright ;;
				"Pipenv")   uv tool install pipenv ;;
				"Pynvim")   install_pynvim ;;
				"Exit")     return ;;
				*)          echo "Invalid option" ;;
			esac
			break
		done
	done
}

function install_pynvim {
	mkdir -p ~/.virtualenv
	uv venv ~/.virtualenv/neovim
	source ~/.virtualenv/neovim/bin/activate
	uv pip install pynvim
	echo "Done!"
}
