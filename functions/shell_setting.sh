#!/bin/bash
alias clr="echo -en '\033c'"

# $ list_bash_functions | delete_lines_from_to 75 80 | cat -n # --number
function list_bash_functions() {
	#echo ""
	#echo "======================"
	#echo "List of bash functions"
    #echo "======================"
	eval "compgen -A function" 
}

function list_bash_functions_enumerated() {
	echo ""
	echo "======================"
	echo "List of bash functions"
    echo "======================"
	list_bash_functions | grep -v gawk | cat -n
}

function search_function () {
	keyword="$1"
	list_bash_functions | seek_further $keyword
}

function seek { 
	if [ "$1" == "" ] # not specified 
	then
		echo 'Search key word required'
		echo "Usage : $0 seek $1"
	else
		echo $1
		GREP_COLORS='ms=01;32' egrep -inr --color=always $1 $2; # $2 := path_start
	fi;

	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	
	echo $time_stamp; 
}

# $ seek $key_word_00 | seek_further $key_word_01 | seek_further $key_word_02 ...
function seek_further { 
	if [ "$1" == "" ] # not specified 
	then
		echo 'Search key word required'
		echo "Usage : $0 seek $1"
	else
		GREP_COLORS='ms=01;36' egrep -i --color=always $1;
	fi;

	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	
	echo $time_stamp; 
}

function find_bash_function_in_list(){
	read   -p "Input keyword (e.g. update*):" keyword
	echo 'Found (if not empty or NIL): '
	if [ ! -z $keyword ] # not empthy 
		then : # 
			echo '=========== [start] ==========='
			search_function $keyword;
			echo '============ [end] ============'	
		else : # $1 was not given 
			echo '=========== [start] ==========='
			list_bash_functions 
			echo '============ [end] ============'		
	fi
 
}

function where_is_function(){
	keyword="$1"
	path_start=$HOME'/scripts/functions/'
	seek $keyword  $path_start
}


#
#		read -r -p "keyword for list_bash_functions [e.g. read] (enter nothing to list ALL) : "  word_to_search
#		# echo $word_to_search
#		
#		if [ "$word_to_search" = '' ]
#		then
#			compgen -A function # list_bash_functions
#		else
#			compgen -A function | grep $word_to_search
#		fi


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
	destination_path="$1" # "C:\Ursa\...\Gaia"
	# eval ". $(HOME)/.bashrc"
	# eval ". ~/.bashrc"
	cd ${destination_path}
	eval "opendir"
}

#$ gnome-open .
#or
#$ nautilus .

# cygwin 
#alias nwin=”cygstart /bin/bash -li” # “mintty.exe -i /Cygwin-Terminal.ico - &”

# ubuntu
#alias nwin=”gnome-terminal”

function get_bash_version () {
	#N=10
		
	#for VARIABLE in 1 2 3 4 5 .. N
	#do
	#	printf "\n"
	#done
	echo "Bash version ${BASH_VERSION}..."
	echo "Home path: $HOME"
}

function count_parameters(){
	printf "Hello, $USER.\n\n"
	printf "There are "$#" arguments.\n"
	#input_length=20
	#read  -n $input_length -p "Input arguments:" arguments 
	echo ""
	demarcator="===================================================="
	# handle > 10 parameters in shell
	# can have up to ${255}
	# Use curly braces to set them off:
	# echo "${10}"
	printf "\n $demarcator \n"	
	# iterate over the positional parameters
	# for arg
	printf "\n $demarcator \n"			
	# for arg in "$@"
	printf "\n $demarcator \n"			
	#or
	while (( $# > 0 )) # or [ $# -gt 0 ] 
	do 
		echo "$1" 
		shift 
	done
	printf "\n $demarcator \n"	
}

function show_latest_command_and_argument_history () {
	echo "[show_latest_command_and_argument_history]"
	echo "latest command: " 
	echo "type '!!'"
	echo "latest argument: " 
	echo "type '!$'"
}

function clean_all_openssl_processes () {
	kill -9 $(ps aux | grep -e openssl | awk '{ print $2 }')
	rm -rf ./messages/msg.txt.*
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

function exit_program_for_menu() {
	printf "\n quit.\n"
	echo 'X' : quitprogram
}