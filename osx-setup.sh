#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*.sh; do . $tool_set; done

ask_to 'setup' 'a public/private key pair'
check_user_input yes && ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"

ask_to 'install' 'Xcode'
check_user_input yes && xcode-select --install

ask_to 'install' 'Homebrew'
check_user_input yes && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ask_to 'update' 'brew'
check_user_input yes && brew update

ask_to 'setup' 'Ruby related tools'
check_user_input yes && install_ruby_related_deps

ask_to 'install' 'the Heroku Toolbelt'
check_user_input yes && brew install heroku/brew/heroku

ask_to 'install' 'iTerm2'
check_user_input yes && brew cask install iterm2

ask_to 'install' 'Atom'
check_user_input yes && brew cask install atom

ask_to 'install' 'Google Chrome'
check_user_input yes && brew cask install google-chrome

ask_to 'setup bash_profile'
check_user_input yes && setup_bash_profile

ask_to 'add' 'git alias "st" for status'
check_user_input yes && git config --global alias.st status

echo ''
echo 'Setup Finished!'
