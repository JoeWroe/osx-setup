#!/bin/bash

yes="y";
no="n";

current_user_input="";

echo ""
read -p "Would you like to setup a public/private key pair? Please input y/n.  " current_user_input;

if [ "$current_user_input" = "$yes" ];
then
    ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"
fi

echo ""
read -p "Would you like to install xcode? Please input y/n.  " current_user_input;

if [ "$current_user_input" = "$yes" ];
then
    xcode-select --install;
fi

echo ""
read -p "Would you like to install Homebrew? Please input y/n.  " current_user_input;

if [ "$current_user_input" = "$yes" ];
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    brew update;
fi

echo ""
read -p "Would you like to install Ruby Version Manager (RVM)? Please input y/n.  " current_user_input;

if [ "$current_user_input" = "$yes" ];
then
    \curl -L https://get.rvm.io | bash -s stable;
fi

echo ""
read -p "Would you like to install Ruby? Please input y/n.  " current_user_input;


echo ''
echo 'Setup Finished!'
