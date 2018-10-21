#!/bin/bash

for file in ./functions/*; do . $file; done

current_user_input=''

ask_to 'setup' 'a public/private key pair'
if_yes_run_with 'ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"'

ask_to 'install' 'Xcode'
if_yes_run_with 'xcode-select --install'

ask_to 'install' 'Homebrew'
if_yes_run_with 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

ask_to 'update' 'brew'
if_yes_run_with 'brew update'

ask_to 'install' 'Ruby Version Manager (RVM)'
if [ '$current_user_input' = 'yes' ]
then
    \curl -L https://get.rvm.io | bash -s stable
    source /Users/joe-wroe/.rvm/scripts/rvm
fi

echo ''
echo 'Setup Finished!'
