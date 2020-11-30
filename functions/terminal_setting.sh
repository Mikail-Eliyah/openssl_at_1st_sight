#!/bin/bash
alias clr="echo -en '\033c'"

function list_bash_functions() {
	echo ""
	echo "======================"
	echo "List of bash functions"
    echo "======================"
	eval "compgen -A function" 
}

function clr(){
	echo -en '\033c';
}

function set_terminal_title() {
      export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
      echo -ne "\e]0;$1\a"
}

echo ""
: <<'COMMENT_SET_TERMINAL_TITLE_FOR_MAC'



function set_terminal_title() {
     #export PS1="\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n$ "
     # echo -ne "\e]0;$1\a"
	 echo "\033]0;$1\007"
}
COMMENT_SET_TERMINAL_TITLE_FOR_MAC
echo ""

function open_new_window() {
	cygstart /bin/bash -li;
}

function get_env_vars () {
	echo "OSTYPE: " + $OSTYPE ;
	echo "USER: " + $USER ; # login name
	echo "HOME: " + $HOME ; # path name of home dir
	echo "HOST: " + $HOST ; # name of computer 
	echo "Architecture: " + $ARCH ; # architecture of computers processor
	echo "Display: " + $DISPLAY ; # name of computer screen to display X windows
	echo "PRINTER: " + $PRINTER ; # default printer to send print jobs
	echo "PATH: " + $PATH ; # directories shell should search to find a command
	echo "Current dir : " + $CWD ;
	echo "prompt : " + $prompt ; # text string used to prompt for interactive commands shell login shell)
	echo "SHELL: " + $SHELL ;
echo "Terminal: " + $TERM ;
	echo "displayed more details : use printenv, env or set" # putting commands in `` will execute the commands
}

function replay_command() {
	history
	echo ""
	echo ""
	read   -p "cmd_choice (e.g. index number*):" cmd_choice
	eval "!$cmd_choice"
}

function open_dir_given_path () {
	destination_path"$1" # "C:\Ursa\...\Gaia"
	# eval ". $(HOME)/.bashrc"
	# eval ". ~/.bashrc"
	cd ${destination_path}
	eval "opendir"
}

function get_bash_version () {
	#N=10
		
	#for VARIABLE in 1 2 3 4 5 .. N
	#do
	#	printf "\n"
	#done
	echo "Bash version ${BASH_VERSION}..."
	echo "Home path: $HOME"
}

function clr_history () {
	# Clear all previous history using option -c
	history -c
	> $HOME/.bash_history  # delete all contents of file
	# echo "" > .bash_history	
	echo "history cleared."
}

function refresh_bashrc(){
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	
	echo ""
	echo "Refreshing bashrc"
	echo $time_stamp; 
	eval ". "$HOME"/.bashrc"
}

