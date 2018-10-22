#!/bin/bash --login

for file in ./functions/*; do . $file; done

ask_to 'setup' 'a public/private key pair'
check_if_user_input_yes && ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"

ask_to 'install' 'Xcode'
check_if_user_input_yes && xcode-select --install

ask_to 'install' 'Homebrew'
check_if_user_input_yes && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ask_to 'update' 'brew'
check_if_user_input_yes && brew update

ask_to 'install' 'Ruby Version Manager (RVM)'
check_if_user_input_yes && curl -L https://get.rvm.io | bash -s stable && source /Users/joe-wroe/.rvm/scripts/rvm

ask_to 'install' "RVM's default Ruby version"
check_if_user_input_yes && rvm use ruby --install --default && ruby -v

ask_to 'install' 'PRY'
check_if_user_input_yes && gem install pry

ask_to 'install' 'the Heroku Toolbelt'
check_if_user_input_yes && brew install heroku/brew/heroku

ask_to 'install' 'iTerm2'
check_if_user_input_yes && brew cask install iterm2

echo ''
echo 'Setup Finished!'
