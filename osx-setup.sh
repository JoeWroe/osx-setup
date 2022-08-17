#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

check_number_of_script_args $# 1
set_colours

user_email=$1

function run_osx_setup {
	while [ "$current_user_input" != exit ]; do
		clear

		read -d '' current_options <<-EOV

		Please select what you would like to setup (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Key pair${white_text} - Setup a public/private key pair.
		${yellow_text}∆ ${red_text}Xcode${white_text} - Add Apple's IDE.
		${yellow_text}∆ ${red_text}ZSH${white_text} - Setup ZSH configuration.
		${yellow_text}∆ ${red_text}Git${white_text} - Setup Git configuration.
		${yellow_text}∆ ${red_text}Homebrew${white_text} - The missing package manager for macOS.
		${yellow_text}∆ ${red_text}Update Homebrew${white_text} - Usually regularly recommended.
		${yellow_text}∆ ${red_text}Ruby related tools${white_text} - What you need to develop with Ruby.
		${yellow_text}∆ ${red_text}Python related tools${white_text} - What you need to develop with Python.
		${yellow_text}∆ ${red_text}Node${white_text} - If you Node, you Node.
		${yellow_text}∆ ${red_text}Yarn${white_text} - JavaScript dependency management.
		${yellow_text}∆ ${red_text}Heroku toolbelt${white_text} - For the Heroku Cloud Platform.
		${yellow_text}∆ ${red_text}iTerm2${white_text} - macOS terminal replacement.
		${yellow_text}∆ ${red_text}Atom${white_text} - Text based, plug and play, source code editor.
		${yellow_text}∆ ${red_text}IntelliJ${white_text} - Because Eclipse sucks.
		${yellow_text}∆ ${red_text}Webstorm${white_text} - Because JetBrains.
		${yellow_text}∆ ${red_text}Docker${white_text} - Pack, ship and run any application as a lightweight container.
		${yellow_text}∆ ${red_text}Docker Compose${white_text} - Run Docker Compose files.
		${yellow_text}∆ ${red_text}Colima${white_text} - Free containerization, because I won't pay for the Docker license.
		${yellow_text}∆ ${red_text}Google Chrome${white_text} - That thing you usually us Internet Explorer to download.
		${yellow_text}∆ ${red_text}Spectacle${white_text} - Like the Matrix, but with windows.
		${yellow_text}∆ ${red_text}Zoom${white_text} - Fairly stationary video calling.
		${yellow_text}∆ ${red_text}Postman${white_text} - Like royal mail for the internet.
		${yellow_text}∆ ${red_text}Clocker${white_text} - The master of Time.
		${yellow_text}∆ ${red_text}jq${white_text} - A CLI json parser.
		${yellow_text}∆ ${red_text}Bash profile${white_text} - Sort out your terminal.
		${yellow_text}∆ ${red_text}Git aliases${white_text} - Make everyone else's git horrible to use.
		${yellow_text}∆ ${red_text}Neovim${white_text} - Hyperextensible Vim-basted text editor.
		${yellow_text}∆ ${red_text}Neovim config${white_text} - I'm not a sado-masochist.
		${yellow_text}∆ ${red_text}Exit${white_text}
		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input "key pair" && ssh-keygen -t rsa -b 4096 -C "$user_email"
		check_user_input "xcode" && xcode-select --install
		check_user_input "zsh" && cp .zshrc ~/.zshrc
		check_user_input "git" && cp .gitconfig ~/.gitconfig
		check_user_input "homebrew" && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		check_user_input "update homebrew" && brew update
		check_user_input "ruby related tools" && install_ruby_related_deps
		check_user_input "python related tools" && install_python_related_deps
		check_user_input "node" && brew install node
		check_user_input "yarn" && brew install yarn
		check_user_input "heroku toolbelt" && brew install heroku/brew/heroku
		check_user_input "iterm2" && brew install iterm2 --cask 
		check_user_input "atom" && brew install atom --cask 
		check_user_input "intellij" && brew install intellij-idea --cask 
		check_user_input "webstorm" && brew install webstorm --cask 
		check_user_input "docker" && brew install docker
		check_user_input "docker compose" && brew install docker-compose
		check_user_input "colima" && brew install colima
		check_user_input "google chrome" && brew install google-chrome --cask 
		check_user_input "spectacle" && brew install spectacle --cask 
		check_user_input "zoom" && brew install zoom
		check_user_input "postman" && brew install postman --cask
		check_user_input "clocker" && brew install clocker --cask
		check_user_input "jq" && brew install jq
		check_user_input "bash profile" && setup_bash_profile
		check_user_input "git aliases" && git config --global alias.st status
		check_user_input "neovim" && brew install neovim
		check_user_input "neovim config" && mkdir -p ~/.config/nvim && cp .init.vim ~/.config/nvim/init.vim

		clean_exit
	done
}

run_osx_setup

logout

echo ''
echo 'Setup Finished!'
