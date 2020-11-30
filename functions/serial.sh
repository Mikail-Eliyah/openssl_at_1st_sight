#!/bin/sh

function generate_case_serial (){
	printf "\n"
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec);
	#date -d @1491904317 +'%Y-%m-%d %H:%M:%S'
	#date +%s
	#date -d "Oct 21 1973" +%s
	echo "status: [Suspended, Trusted, Revoked]"
	# status=":Suspended" 
	read status
	case_serial="$time_stamp: $status"
	echo "case_serial: "
	echo $case_serial | openssl enc -aes-256-cbc -a -k $passcode

	printf "\n"
}

function decode_case_serial() {
	echo "case_serial: "
	read case_serial
	echo "case_serial (decoded): "
	echo $case_serial | openssl enc -aes-256-cbc -d -a -k $passcode # timestamp=$(date +%s) 
	
	# case_serial=$(timestamp":Suspended")
	printf "\n"
}

function generate_random_bytes (){
	number_of_bytes=500
	printf "\n"
    # openssl rand -base64 5
	openssl rand -hex $number_of_bytes
}
