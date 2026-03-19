#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

check_number_of_script_args $# 1

user_email=$1
PS3="Select an option (q to exit, Q to quit): "

function run_system_setup {
	while true; do
		select opt in \
			"Homebrew" \
			"Update Homebrew" \
			"Git config" \
			"ZSH" \
			"Bash profile"; do
			case $opt in
				"Homebrew")        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" ;;
				"Update Homebrew") brew update ;;
				"Git config")      mkdir -p ~/.config/git/functions && cp ./configs/git/.gitconfig ~/.gitconfig && cp ./configs/git/ping.sh ./configs/git/pong.sh ~/.config/git/functions/ ;;
				"ZSH")             sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && cp .zshrc ~/.zshrc ;;
				"Bash profile")    setup_bash_profile ;;
				*)                 [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
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
			"C# related tools"; do
			case $opt in
				"Ruby related tools")       install_ruby_related_deps ;;
				"Javascript related tools") install_javascript_related_deps ;;
				"Python related tools")     install_python_related_deps ;;
				"C# related tools")         install_csharp_related_deps ;;
				*)                 	    [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
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
			"Claude Code"; do
			case $opt in
				"Ghostty")       brew install --cask ghostty ;;
				"iTerm2")        brew install --cask iterm2 ;;
				"Neovim")        brew install neovim ;;
				"Neovim config") git clone git@github.com:JoeWroe/nvim.git ~/.config/nvim ;;
				"Claude Code")   brew install --cask claude-code ;;
				*)               [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
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
			"Webstorm"; do
			case $opt in
				"Atom")     brew install --cask atom ;;
				"IntelliJ") brew install --cask intellij-idea ;;
				"Webstorm") brew install --cask webstorm ;;
				*)          [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_infrastructure_setup {
	while true; do
		select opt in \
			"Containerisation tools" \
			"Heroku toolbelt"; do
			case $opt in
				"Containerisation tools") install_containerisation_deps ;;
				"Heroku toolbelt")        brew install heroku/brew/heroku ;;
				*)                        [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
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
			"Clocker" \
			"Google Chrome" \
			"Insomnia" \
      "Insta 360" \
      "Obsidian" \
			"Postman" \
			"Steam" \
			"Zen Browser" \
			"Zoom"; do
			case $opt in
				"1Password")	   brew install --cask 1password ;;
				"1Password CLI") brew install --cask 1password-cli ;;
				"Clocker")       brew install --cask clocker ;;
				"Google Chrome") brew install --cask google-chrome ;;
				"Insomnia")      brew install --cask insomnia ;;
        "Insta 360")     brew install --cask insta360-link-controller ;;
        "Obsidian")      brew install --cask obsidian ;;
				"Postman")       brew install --cask postman ;;
				"Steam")	       brew install --cask steam ;;
				"Zen Browser") 	 brew install --cask zen ;;
				"Zoom")          brew install --cask zoom ;;
				*)               [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}

function run_cli_tools_setup {
	while true; do
		select opt in \
			"jq" \
			"Git aliases"; do
			case $opt in
				"jq")          brew install jq ;;
				"Git aliases") git config --global alias.st status ;;
				*)             [[ $REPLY == "q" ]] && return; [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
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
			"CLI Tools"; do
			case $opt in
				"System")         run_system_setup ;;
				"Languages")      run_languages_setup ;;
				"Terminal")       run_terminal_setup ;;
				"Editors & IDEs") run_editors_setup ;;
				"Infrastructure") run_infrastructure_setup ;;
				"Apps")           run_apps_setup ;;
				"CLI Tools")      run_cli_tools_setup ;;
				*)                [[ $REPLY == "q" ]] || [[ $REPLY == "Q" ]] && { echo 'Setup Finished!'; exit 0; }; echo "Invalid option" ;;
			esac
			break
		done
	done
}

run_osx_setup
