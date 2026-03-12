function install_javascript_related_deps {
	while true; do
		select opt in \
			"NVM" \
			"Node" \
			"Yarn" \
			"Exit"; do
			case $opt in
				"NVM")  git clone http://github.com/creationix/nvm.git ~/.nvm ;;
				"Node") brew install node ;;
				"Yarn") brew install yarn ;;
				"Exit") return ;;
				*)      echo "Invalid option" ;;
			esac
			break
		done
	done
}
