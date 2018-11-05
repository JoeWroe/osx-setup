function install_ruby_related_deps {
red_text=$(tput setaf 1)
yellow_text=$(tput setaf 3)
white_text=$(tput setaf 7)

	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select which Ruby related dependency you would like to install (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}RVM ${white_text}- Ruby's Version Manager
		${yellow_text}∆ ${red_text}Ruby ${white_text}- RVM's default version
		${yellow_text}∆ ${red_text}Pry ${white_text}- A Ruby REPL that is a nice alternative to IRB.
		${yellow_text}∆ ${red_text}exit ${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		check_user_input RVM && curl -L https://get.rvm.io | bash -s stable && source /Users/joe-wroe/.rvm/scripts/rvm
		check_user_input Ruby && rvm use ruby --install --default && ruby -v
		check_user_input Pry && gem install pry
	done
}
