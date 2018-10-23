#!/bin/bash

function install_ruby_related_deps {
    ask_to 'install' 'Ruby Version Manager (RVM)'
    check_if_user_input_yes && curl -L https://get.rvm.io | bash -s stable && source /Users/joe-wroe/.rvm/scripts/rvm

    ask_to 'install' "RVM's default Ruby version"
    check_if_user_input_yes && rvm use ruby --install --default && ruby -v

    ask_to 'install' 'PRY'
    check_if_user_input_yes && gem install pry
}
