#!/usr/bin/env bash

SCRIPT_NAME=`basename $0`
SCRIPT_ARGUMENT=$1
NUMBER_OF_EXPECTED_ARGS=2
WRONG_NUMBER_ARGS_ERROR=85

echo "script name = ${SCRIPT_NAME}"
echo "script argument = ${SCRIPT_ARGUMENT}"
echo "number of expected args = ${NUMBER_OF_EXPECTED_ARGS}"
echo "ars error = ${WRONG_NUMBER_ARGS_ERROR}"


if [ $# -ne $NUMBER_OF_EXPECTED_ARGS ]
then
  echo "${SCRIPT_NAME} takes a single arg. Please supply your name."
  exit $WRONG_NUMBER_ARGS_ERROR
fi

ping() {
  git add . &&
  git commit -n -m "PINGPONG WIP" &&
  git push origin +HEAD:$1/pingpong &&
  git reset --hard origin/main;
}

ping $SCRIPT_ARGUMENT;

