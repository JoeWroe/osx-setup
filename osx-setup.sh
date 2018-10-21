#!/bin/bash

source ./functions/ask_to.sh
source ./functions/install_with.sh

current_user_input=''

ask_to 'setup' 'a public/private key pair'
install_with 'ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"'

ask_to 'install' 'Xcode'
install_with 'xcode-select --install'

ask_to 'install' 'Homebrew'
install_with 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

ask_to 'update' 'brew'
install_with 'brew update'
echo $current_user_input

ask_to 'install' 'Ruby Version Manager (RVM)'
if [ '$current_user_input' = 'yes' ]
then
    \curl -L https://get.rvm.io | bash -s stable
    source /Users/joe-wroe/.rvm/scripts/rvm
fi

echo ''
echo 'Setup Finished!'
