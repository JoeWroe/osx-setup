#!/bin/bash

source ./functions/ask_to_install.sh
source ./functions/install_with.sh

yes="y";
no="n";

current_user_input="";

echo ""
read -p "Would you like to setup a public/private key pair? Please input y/n.  " current_user_input;
install_with 'ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"'

ask_to_install 'Xcode'
install_with 'xcode-select --install'

ask_to_install 'Homebrew'
install_with 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
brew update

ask_to_install "Ruby Version Manager (RVM)"
install_with "curl -L https://get.rvm.io | bash -s stable"

echo ""
echo "Setup Finished!"
