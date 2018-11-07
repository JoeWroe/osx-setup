#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

function run_osx_setup {
red_text=$(tput setaf 1)
yellow_text=$(tput setaf 3)
white_text=$(tput setaf 7)

	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select what you would like to setup. (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}Key pair${white_text} - Setup a public/private key pair.
		${yellow_text}∆ ${red_text}Xcode${white_text} - Add Apple's IDE.
		${yellow_text}∆ ${red_text}Homebrew${white_text} - The missing package manager for macOS.
		${yellow_text}∆ ${red_text}Update Homebrew${white_text} - Usually regularly recommended.
		${yellow_text}∆ ${red_text}Ruby related tools${white_text} - What you need to develop with Ruby.
		${yellow_text}∆ ${red_text}Heroku toolbelt${white_text} - For the Heroku Cloud Platform.
		${yellow_text}∆ ${red_text}iTerm2${white_text} - macOS terminal replacement.
		${yellow_text}∆ ${red_text}Atom${white_text} - Text based, plug and play, source code editor.
		${yellow_text}∆ ${red_text}Google Chrome${white_text} - That thing you usually us Internet Explorer to download.
		${yellow_text}∆ ${red_text}Bash profile${white_text} - Sort out your terminal.
		${yellow_text}∆ ${red_text}Git aliases${white_text} - Make everyone else's git horrible to use.
		${yellow_text}∆ ${red_text}Exit${white_text}
		EOV

		echo "$current_options"

		read current_user_input

		check_user_input "Key pair" && ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"
		check_user_input "Xcode" && xcode-select --install
		check_user_input "Homebrew" && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		check_user_input "Update Homebrew" && brew update
		check_user_input "Ruby related tools" && install_ruby_related_deps
		check_user_input "Heroku toolbelt" && brew install heroku/brew/heroku
		check_user_input "iTerm2" && brew cask install iterm2
		check_user_input "Atom" && brew cask install atom
		check_user_input "Google Chrome" && brew cask install google-chrome
		check_user_input "Bash profile" && setup_bash_profile
		check_user_input "Git aliases" && git config --global alias.st status

		clean_exit
	done
}

run_osx_setup

echo ''
echo 'Setup Finished!'
