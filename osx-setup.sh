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
		${yellow_text}∆ ${red_text}Homebrew${white_text} - The missing package manager for macOS.
		${yellow_text}∆ ${red_text}Update Homebrew${white_text} - Usually regularly recommended.
		${yellow_text}∆ ${red_text}Ruby related tools${white_text} - What you need to develop with Ruby.
		${yellow_text}∆ ${red_text}Yarn${white_text} - JavaScript dependency management.
		${yellow_text}∆ ${red_text}Sass${white_text} - CSS with superpowers.
		${yellow_text}∆ ${red_text}Heroku toolbelt${white_text} - For the Heroku Cloud Platform.
		${yellow_text}∆ ${red_text}iTerm2${white_text} - macOS terminal replacement.
		${yellow_text}∆ ${red_text}Atom${white_text} - Text based, plug and play, source code editor.
		${yellow_text}∆ ${red_text}IntelliJ${white_text} - Because Eclipse sucks.
		${yellow_text}∆ ${red_text}Google Chrome${white_text} - That thing you usually us Internet Explorer to download.
		${yellow_text}∆ ${red_text}Bash profile${white_text} - Sort out your terminal.
		${yellow_text}∆ ${red_text}Git aliases${white_text} - Make everyone else's git horrible to use.
		${yellow_text}∆ ${red_text}Exit${white_text}
		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input "key pair" && ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"
		check_user_input "xcode" && xcode-select --install
		check_user_input "homebrew" && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		check_user_input "update homebrew" && brew update
		check_user_input "ruby related tools" && install_ruby_related_deps
		check_user_input "yarn" && brew install yarn
		check_user_input "sass" && brew install sass
		check_user_input "heroku toolbelt" && brew install heroku/brew/heroku
		check_user_input "iterm2" && brew cask install iterm2
		check_user_input "atom" && brew cask install atom
		check_user_input "intellij" && brew cask install intellij-idea
		check_user_input "google chrome" && brew cask install google-chrome
		check_user_input "bash profile" && setup_bash_profile
		check_user_input "git aliases" && git config --global alias.st status

		clean_exit
	done
}

run_osx_setup

logout

echo ''
echo 'Setup Finished!'
