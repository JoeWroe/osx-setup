#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

check_number_of_script_args $# 1

user_email=$1
PS3="Select an option: "

function run_osx_setup {
	while true; do
		select opt in \
			"Key pair" \
			"ZSH" \
			"Git" \
			"Homebrew" \
			"Update Homebrew" \
			"Ruby related tools" \
			"Python related tools" \
			"NVM" \
			"Node" \
			"Yarn" \
			"Dotnet" \
			"Heroku toolbelt" \
			"Ghostty" \
			"iTerm2" \
			"Atom" \
			"IntelliJ" \
			"Webstorm" \
			"Docker" \
			"Docker Compose" \
			"Colima" \
			"Google Chrome" \
			"Spectacle" \
			"Zoom" \
			"Postman" \
			"Insomnia" \
			"Clocker" \
			"Claude Code" \
			"jq" \
			"Bash profile" \
			"Git aliases" \
			"Neovim" \
			"Neovim config" \
			"Exit"; do
			case $opt in
				"Key pair")           ssh-keygen -t rsa -b 4096 -C "$user_email" ;;
				"ZSH")                cp .zshrc ~/.zshrc ;;
				"Git")                cp .gitconfig ~/.gitconfig ;;
				"Homebrew")           ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ;;
				"Update Homebrew")    brew update ;;
				"Ruby related tools") install_ruby_related_deps ;;
				"Python related tools") install_python_related_deps ;;
				"NVM")                git clone http://github.com/creationix/nvm.git ~/.nvm ;;
				"Node")               brew install node ;;
				"Yarn")               brew install yarn ;;
				"Dotnet")             brew install --cask dotnet-sdk ;;
				"Heroku toolbelt")    brew install heroku/brew/heroku ;;
				"Ghostty")            brew install --cask ghostty ;;
				"iTerm2")             brew install --cask iterm2 ;;
				"Atom")               brew install --cask atom ;;
				"IntelliJ")           brew install --cask intellij-idea ;;
				"Webstorm")           brew install --cask webstorm ;;
				"Docker")             brew install docker ;;
				"Docker Compose")     brew install docker-compose ;;
				"Colima")             brew install colima ;;
				"Google Chrome")      brew install --cask google-chrome ;;
				"Spectacle")          brew install --cask spectacle ;;
				"Zoom")               brew install zoom ;;
				"Postman")            brew install --cask postman ;;
				"Insomnia")           brew install --cask insomnia ;;
				"Clocker")            brew install --cask clocker ;;
				"Claude Code")        brew install --cask claude-code ;;
				"jq")                 brew install jq ;;
				"Bash profile")       setup_bash_profile ;;
				"Git aliases")        git config --global alias.st status ;;
				"Neovim")             brew install neovim ;;
				"Neovim config")      mkdir -p ~/.config/nvim && cp .init.vim ~/.config/nvim/init.vim ;;
				"Exit")               echo 'Setup Finished!'; return ;;
				*)                    echo "Invalid option" ;;
			esac
			break
		done
	done
}

run_osx_setup
