function install_csharp_related_deps {
	while true; do
		select opt in \
			"Dotnet" \
			"Exit"; do
			case $opt in
				"Dotnet") brew install --cask dotnet-sdk ;;
				"Exit")   return ;;
				*)        [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}
