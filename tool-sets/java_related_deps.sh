function install_java_related_deps {
	while true; do
		select opt in \
			"SDKMAN" \
			"Java (LTS)" \
			"Maven" \
			"Gradle" \
			"Exit"; do
			case $opt in
				"SDKMAN")    curl -s "https://get.sdkman.io" | bash ;;
				"Java (LTS)") source ~/.sdkman/bin/sdkman-init.sh && sdk install java ;;
				"Maven")     sdk install maven ;;
				"Gradle")    sdk install gradle ;;
				"Exit")   return ;;
				*)        [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}
