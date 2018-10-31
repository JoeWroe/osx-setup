function install_ruby_related_deps {

	while [ $current_user_input != exit ]; do
		read -d '' current_options <<"		EOV"

		Please select which Ruby related dependency you would like to install:

		∆ Ruby Version Manager (RVM)
		∆ RVM's default Ruby version
		∆ Pry - A Ruby REPL that is a nice alternative to IRB.
		∆ exit

		EOV

		echo "$current_options"

		read current_user_input

		check_user_input Pry && gem install pry
	done



    # ---- working stuff ----

    ask_to 'install Ruby Version Manager (RVM)'
    check_user_input yes && curl -L https://get.rvm.io | bash -s stable && source /Users/joe-wroe/.rvm/scripts/rvm

    ask_to "install RVM's default Ruby version"
    check_user_input yes && rvm use ruby --install --default && ruby -v
}
