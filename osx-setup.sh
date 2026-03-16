#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

check_number_of_script_args $# 1

user_email=$1
PS3="Select an option: "

function run_system_setup {
	while true; do
		select opt in \
			"Homebrew" \
			"Update Homebrew" \
			"Git config" \
			"ZSH" \
			"Bash profile" \
			"Exit"; do
			case $opt in
				"Homebrew")        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ;;
				"Update Homebrew") brew update ;;
				"Git config")      mkdir -p ~/.config/git/functions && cp ./configs/git/.gitconfig ~/.gitconfig && cp ./configs/git/ping.sh ./configs/git/pong.sh ~/.config/git/functions/ ;;
				"ZSH")             sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && cp .zshrc ~/.zshrc ;;
				"Bash profile")    setup_bash_profile ;;
				"Exit")            return ;;
				*)                 echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_languages_setup {
	while true; do
		select opt in \
			"Ruby related tools" \
			"Javascript related tools" \
			"Python related tools" \
			"C# related tools" \
			"Exit"; do
			case $opt in
				"Ruby related tools")       install_ruby_related_deps ;;
				"Javascript related tools") install_javascript_related_deps ;;
				"Python related tools")     install_python_related_deps ;;
				"C# related tools")         install_csharp_related_deps ;;
				"Exit")                     return ;;
				*)                 	    echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_terminal_setup {
	while true; do
		select opt in \
			"Ghostty" \
			"iTerm2" \
			"Neovim" \
			"Neovim config" \
			"Claude Code" \
			"Exit"; do
			case $opt in
				"Ghostty")       brew install --cask ghostty ;;
				"iTerm2")        brew install --cask iterm2 ;;
				"Neovim")        brew install neovim ;;
				"Neovim config") git clone https://github.com/JoeWroe/nvim.git ~/.config/nvim ;;
				"Claude Code")   brew install --cask claude-code ;;
				"Exit")          return ;;
				*)               echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_editors_setup {
	while true; do
		select opt in \
			"Atom" \
			"IntelliJ" \
			"Webstorm" \
			"Exit"; do
			case $opt in
				"Atom")     brew install --cask atom ;;
				"IntelliJ") brew install --cask intellij-idea ;;
				"Webstorm") brew install --cask webstorm ;;
				"Exit")     return ;;
				*)          echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_infrastructure_setup {
	while true; do
		select opt in \
			"Containerisation tools" \
			"Heroku toolbelt" \
			"Exit"; do
			case $opt in
				"Containerisation tools") install_containerisation_deps ;;
				"Heroku toolbelt")        brew install heroku/brew/heroku ;;
				"Exit")                   return ;;
				*)                        echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_apps_setup {
	while true; do
		select opt in \
			"1Password" \
			"1Password CLI" \
			"Google Chrome" \
			"Zen Browser" \
			"Zoom" \
			"Clocker" \
			"Postman" \
			"Insomnia" \
			"Steam" \
			"Exit"; do
			case $opt in
				"1Password")	 brew install --cask 1password ;;
				"1Password CLI") brew install --cask 1password-cli ;;
				"Google Chrome") brew install --cask google-chrome ;;
				"Zen Browser") 	 brew install --cask zen ;;
				"Zoom")          brew install --cask zoom ;;
				"Clocker")       brew install --cask clocker ;;
				"Postman")       brew install --cask postman ;;
				"Insomnia")      brew install --cask insomnia ;;
				"Steam")	 brew install --cask steam ;;
				"Exit")          return ;;
				*)               echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_cli_tools_setup {
	while true; do
		select opt in \
			"jq" \
			"Git aliases" \
			"Exit"; do
			case $opt in
				"jq")          brew install jq ;;
				"Git aliases") git config --global alias.st status ;;
				"Exit")        return ;;
				*)             echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_osx_setup {
	while true; do
		select opt in \
			"System" \
			"Languages" \
			"Terminal" \
			"Editors & IDEs" \
			"Infrastructure" \
			"Apps" \
			"CLI Tools" \
			"Exit"; do
			case $opt in
				"System")         run_system_setup ;;
				"Languages")      run_languages_setup ;;
				"Terminal")       run_terminal_setup ;;
				"Editors & IDEs") run_editors_setup ;;
				"Infrastructure") run_infrastructure_setup ;;
				"Apps")           run_apps_setup ;;
				"CLI Tools")      run_cli_tools_setup ;;
				"Exit")           echo 'Setup Finished!'; return ;;
				*)                echo "Invalid option" ;;
			esac
			break
		done
	done
}

run_osx_setup
