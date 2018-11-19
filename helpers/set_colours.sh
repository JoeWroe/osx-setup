# This function sets text colours using `tput`

function set_colours {
	red_text=$(tput setaf 1)
	yellow_text=$(tput setaf 3)
	white_text=$(tput setaf 7)
}
