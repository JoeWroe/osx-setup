# This function takes a single parameter that is the number of parameters you
# expect to have been passed to the script. If this number differs, the script
# should fail with a wrong number of args exit code.

function check_number_of_script_args {
	SCRIPT_NAME=`basename $0`
	NUMBER_OF_EXPECTED_ARGS=0
	WRONG_NUMBER_ARGS_ERROR=85

	if [ $# -ne $NUMBER_OF_EXPECTED_ARGS ]
	then
		echo "${SCRIPT_NAME} takes a different number of args" 
		exit $WRONG_NUMBER_ARGS_ERROR
	fi
}
