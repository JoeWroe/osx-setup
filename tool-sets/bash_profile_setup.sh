for file in ./tool-sets/bash_profile/*.sh; do . $file; done

function setup_bash_profile {
	while true; do
		select opt in \
			"Bash sugar" \
			"Bash aliases" \
			"Exit"; do
			case $opt in
				"Bash sugar")   setup_bash_sugar ;;
				"Bash aliases") setup_bash_aliases ;;
				"Exit")         source ~/.zshrc; return ;;
				*)              echo "Invalid option" ;;
			esac
			break
		done
	done
}
