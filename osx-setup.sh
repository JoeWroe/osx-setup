#!/bin/bash --login

for file in ./helpers/*; do . $file; done
for tool_set in ./tool-sets/*; do . $tool_set; done

ask_to 'setup' 'a public/private key pair'
check_if_user_input_yes && ssh-keygen -t rsa -b 4096 -C "joe_wroe@icloud.com"

ask_to 'install' 'Xcode'
check_if_user_input_yes && xcode-select --install

ask_to 'install' 'Homebrew'
check_if_user_input_yes && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ask_to 'update' 'brew'
check_if_user_input_yes && brew update

ask_to 'setup' 'Ruby related tools'
check_if_user_input_yes && install_ruby_related_deps

ask_to 'install' 'the Heroku Toolbelt'
check_if_user_input_yes && brew install heroku/brew/heroku

ask_to 'install' 'iTerm2'
check_if_user_input_yes && brew cask install iterm2

ask_to 'install' 'Atom'
check_if_user_input_yes && brew cask install atom

ask_to 'install' 'Google Chrome'
check_if_user_input_yes && brew cask install google-chrome

ask_to 'add' 'up arrow history search to bash'
check_if_user_input_yes && cat <<'EOF' >>~/.bashrc

# Up arrow bash history search
bind '"\e[A":history-search-backward'
EOF

ask_to 'add' 'git alias "st" for status'
check_if_user_input_yes && git config --global alias.st status

source ~/.bashrc

echo ''
echo 'Setup Finished!'
