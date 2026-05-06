function install_containerisation_deps {
	while true; do
		select opt in \
			"Docker" \
			"Docker Compose" \
			"Colima" \
			"Exit"; do
			case $opt in
				"Docker")         brew install docker ;;
				"Docker Compose") brew install docker-compose ;;
				"Colima")         brew install colima ;;
				"Exit")           return ;;
				*)                [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}
