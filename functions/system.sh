#!/bin/sh

function show_timestamp(){
	#source "./scripts/time.sh"
	printf "\n"
    get_timestamp;
			
	#source "./scripts/data_convert.sh"
	seed="Hi There"
	ans=$(ascii_to_hex "$seed")
	echo $ans
}

function get_bash_version () {
	#source "./scripts/terminal_setting.sh"
	clr;
	N=10
		
	for VARIABLE in 1 2 3 4 5 .. N
	do
		printf "\n"
	done
	echo "Bash version ${BASH_VERSION}..."
	
	echo "Home path: $HOME"
}

function clean_all_openssl_processes () {
	kill -9 $(ps aux | grep -e openssl | awk '{ print $2 }')
	rm -rf ./messages/msg.txt.*
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



