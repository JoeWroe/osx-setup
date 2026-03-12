#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

check_number_of_script_args $# 1

user_email=$1
PS3="Select an option: "

function run_system_setup {
	while true; do
		select opt in \
			"Key pair" \
			"ZSH" \
			"Git config" \
			"Homebrew" \
			"Update Homebrew" \
			"Bash profile" \
			"Exit"; do
			case $opt in
				"Key pair")        ssh-keygen -t rsa -b 4096 -C "$user_email" ;;
				"ZSH")             cp .zshrc ~/.zshrc ;;
				"Git config")      cp .gitconfig ~/.gitconfig ;;
				"Homebrew")        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ;;
				"Update Homebrew") brew update ;;
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
				*)                          echo "Invalid option" ;;
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
				"Neovim config") mkdir -p ~/.config/nvim && cp .init.vim ~/.config/nvim/init.vim ;;
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
			"Google Chrome" \
			"Zoom" \
			"Clocker" \
			"Postman" \
			"Insomnia" \
			"Exit"; do
			case $opt in
				"Google Chrome") brew install --cask google-chrome ;;
				"Zoom")          brew install zoom ;;
				"Clocker")       brew install --cask clocker ;;
				"Postman")       brew install --cask postman ;;
				"Insomnia")      brew install --cask insomnia ;;
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
