function setup_bash_aliases {
	while true; do
		select opt in \
			"Ascii art" \
			"Up arrow history search" \
			"Down arrow history search" \
			"Preferred list" \
			"Exit"; do
			case $opt in
				"Ascii art")                 add_ascii_art_aliases_header ;;
				"Up arrow history search")   add_up_arrow_bash_history_search ;;
				"Down arrow history search") add_down_arrow_bash_history_search ;;
				"Preferred list")            add_preferred_list_alias ;;
				"Exit")                      return ;;
				*)                           echo "Invalid option" ;;
			esac
			break
		done
	done
}

function add_ascii_art_aliases_header {
	cat <<-EOF >>~/.bash_profile

		#
		#      _/_/_/      _/_/      _/_/_/  _/    _/        _/_/    _/        _/_/_/    _/_/      _/_/_/  _/_/_/_/    _/_/_/
		#     _/    _/  _/    _/  _/        _/    _/      _/    _/  _/          _/    _/    _/  _/        _/        _/
		#    _/_/_/    _/_/_/_/    _/_/    _/_/_/_/      _/_/_/_/  _/          _/    _/_/_/_/    _/_/    _/_/_/      _/_/
		#   _/    _/  _/    _/        _/  _/    _/      _/    _/  _/          _/    _/    _/        _/  _/              _/
		#  _/_/_/    _/    _/  _/_/_/    _/    _/      _/    _/  _/_/_/_/  _/_/_/  _/    _/  _/_/_/    _/_/_/_/  _/_/_/
		#

	EOF
}

function add_up_arrow_bash_history_search {
	cat <<'	EOF' >>~/.bash_profile
	bind '"\e[A":history-search-backward'        # Up arrow bash history search
	EOF
}

function add_down_arrow_bash_history_search {
	cat <<'	EOF' >>~/.bash_profile
	bind '"\e[B":history-search-forward'         # Down arrow bash history search
	EOF
}

function add_preferred_list_alias {
	cat <<'	EOF' >>~/.bash_profile
	alias ls='ls -FGlAhp'                        # Preferred 'ls'
	EOF
}
