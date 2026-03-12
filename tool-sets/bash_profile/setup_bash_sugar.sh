function setup_bash_sugar {
	while true; do
		select opt in \
			"Ascii art" \
			"Command prompt" \
			"Coloured output" \
			"Exit"; do
			case $opt in
				"Ascii art")      add_ascii_art_sugar_header ;;
				"Command prompt") add_command_prompt ;;
				"Coloured output") add_coloured_terminal_output ;;
				"Exit")           return ;;
				*)                echo "Invalid option" ;;
			esac
			break
		done
	done
}

function add_ascii_art_sugar_header {
	cat <<-EOF >>~/.bash_profile

		#
		#      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/_/  _/    _/    _/_/_/    _/_/    _/_/_/
		#     _/    _/  _/    _/  _/        _/    _/      _/        _/    _/  _/        _/    _/  _/    _/
		#    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/        _/_/    _/    _/  _/  _/_/  _/_/_/_/  _/_/_/
		#   _/    _/  _/    _/        _/  _/    _/            _/  _/    _/  _/    _/  _/    _/  _/    _/
		#  _/_/_/    _/    _/  _/_/_/    _/    _/      _/_/_/      _/_/      _/_/_/  _/    _/  _/    _/
		#

	EOF
}

function add_command_prompt {
	cat <<'        EOF' >>~/.bash_profile

		# A friendly command prompt
		# ------------------------------------------------
		export PS1='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] Hi, \u you are in \w, it is currently \@ \n\[\e[41m\] \[\e[40m\] ~>\[\e[0m\] '
		export PS2='\[\e[41m\] \[\e[40m\]\[\e[1;37m\] cont. ~> \[\e[0m\]'
        EOF
}

function add_coloured_terminal_output {
	cat <<-EOF >>~/.bash_profile

		# Coloured Terminal Output
		# ------------------------------------------------
		export CLICOLOR=1
		export LSCOLORS=ExFxBxDxCxegedabagacad
	EOF
}
