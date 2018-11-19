function install_ruby_related_deps {
	while [ "$current_user_input" != exit ]; do
		read -d '' current_options <<-EOV

		Please select which Ruby related dependency you would like to install (type the phrase in ${red_text}red${white_text}):

		${yellow_text}∆ ${red_text}RVM ${white_text}- Ruby's Version Manager
		${yellow_text}∆ ${red_text}Ruby ${white_text}- RVM's default version
		${yellow_text}∆ ${red_text}Pry ${white_text}- A Ruby REPL that is a nice alternative to IRB.
		${yellow_text}∆ ${red_text}Exit ${white_text}

		EOV

		echo "$current_options"

		read current_user_input

		current_user_input=$(downcase "$current_user_input")

		check_user_input 'rvm' && curl -L https://get.rvm.io | bash -s stable && source /Users/joe-wroe/.rvm/scripts/rvm
		check_user_input 'ruby' && rvm use ruby --install --default && ruby -v
		check_user_input 'pry' && gem install pry

		clean_exit
	done
}
