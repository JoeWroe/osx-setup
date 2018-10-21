#!/bin/bash

function if_yes_run_with {
    if [ $current_user_input = yes ]
    then
        $1
    fi
}
