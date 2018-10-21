#!/bin/bash

function install_with {
    if [ $current_user_input = yes ]
    then
        $1
    fi
}
