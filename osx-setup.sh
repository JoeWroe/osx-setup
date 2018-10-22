#!/bin/bash

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
check_if_user_input_yes && curl -L https://get.rvm.io | bash -s stable

echo ''
echo 'Setup Finished!'
