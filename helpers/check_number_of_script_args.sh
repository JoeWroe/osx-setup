# This function takes a single parameter that is the number of parameters you
# expect to have been passed to the script. If this number differs, the script
# should fail with a wrong number of args exit code.

function check_number_of_script_args {
	script_name=`basename $0`
	number_of_args_passed_to_script=$1
	number_of_expected_args=$2
	wrong_number_of_args_error=85

	if [ $number_of_args_passed_to_script -ne $number_of_expected_args ]
	then
		echo "${script_name} takes ${number_of_expected_args} parameters, it looks like you passed in ${number_of_args_passed_to_script} parameters." 
		exit $wrong_number_of_args_error
	fi
}
