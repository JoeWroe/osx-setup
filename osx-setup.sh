#!/bin/bash

source ./functions/ask_to_install.sh

yes="y";
no="n";

current_user_input="";

echo ""
read -p "Would you like to setup a public/private key pair? Please input y/n.  " current_user_input;

if [ "$current_user_input" = "$yes" ];
then
    ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"
fi

ask_to_install "Xcode";

if [ "$current_user_input" = "$yes" ];
then
    xcode-select --install;
fi

ask_to_install "Homebrew";

if [ "$current_user_input" = "$yes" ];
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    brew update;
fi

ask_to_install "Ruby Version Manager (RVM)"

if [ "$current_user_input" = "$yes" ];
then
    \curl -L https://get.rvm.io | bash -s stable;
fi

echo ''
echo 'Setup Finished!'
