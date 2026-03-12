function install_ruby_related_deps {
	while true; do
		select opt in \
			"RVM" \
			"Ruby" \
			"Pry" \
			"Exit"; do
			case $opt in
				"RVM")  curl -L https://get.rvm.io | bash -s stable && source ~/.rvm/scripts/rvm ;;
				"Ruby") rvm use ruby --install --default && ruby -v ;;
				"Pry")  gem install pry ;;
				"Exit") return ;;
				*)      echo "Invalid option" ;;
			esac
			break
		done
	done
}
