#!/usr/bin/env bash

SCRIPT_NAME=`basename $0`
SCRIPT_ARGUMENT=$1
NUMBER_OF_EXPECTED_ARGS=2
WRONG_NUMBER_ARGS_ERROR=85

if [ $# -ne $NUMBER_OF_EXPECTED_ARGS ]
then
  echo "${SCRIPT_NAME} takes a single arg. Please supply the name of the developer you are receiving code from."
  exit $WRONG_NUMBER_ARGS_ERROR
fi

pong() {
  git fetch &&
  git reset --hard origin/$1/pingpong &&
  git reset --soft HEAD^1 &&
  git reset HEAD . ;
}

pong $SCRIPT_ARGUMENT;
