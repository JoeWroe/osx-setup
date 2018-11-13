# Thus function takes a single argument and converts all chars in it to lower
# case.

function downcase {
	echo "$1" | tr '[:upper:]' '[:lower:]'
} 
