#!/bin/bash
#dos2unix "./parameters.sh"
source $HOME"/parameters.sh" 

# function pack_n_sha { get_timestamp ; tar -cvzf "$1"_$time_stamp.tar .; sha256_result=$(openssl dgst -sha256 "$1"_$time_stamp.tar); echo $sha256_result; }

function pack_n_sha { 
	if [ "$1" == "" ]; # not specified 
	then	# use current_folder as name
		current_folder_name=${PWD##*/};
	else
		current_folder_name=$1;	
	fi;
	 
	echo $current_folder_name;
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	zip -r "$current_folder_name"_$time_stamp.zip .; 
	# tar -cvzf $(current_folder_name)_$time_stamp.tar .; 
	sha256_result=$(openssl dgst -sha256 "$current_folder_name"_$time_stamp.zip); 
	echo $sha256_result; 
}

function get_file_sha { 
	sha256_result=$(openssl dgst -sha256 "$1"); echo $sha256_result; 
}

#function cipher_file { openssl enc -aes-256-cbc -salt -in "$1" -out "$2"; }
#function decipher_file { openssl enc -aes-256-cbc -d -in "$1" -out "$2"; }
function cipher_file { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        	echo "Usage : $0 cipher_file $1: (input_file) $2: (output_file) "
			return;
	fi

	# openssl enc -aes-256-cbc -salt -in "$1" -out "$2";
	openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -in "$1" -out "$2";
}

function decipher_file { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        		echo "Usage : $0 decipher_file $1: (input_file) $2: (output_file) "
		return;
	fi
 
	# openssl enc -aes-256-cbc -d -in "$1" -out "$2"; 
	openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -d -in "$1" -out "$2";
}

function cipher_message_in_hex_strings { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		#clr;
        echo "Usage : $0 cipher_message $1: (message) $2: (passcode) "
		return;
	fi
	
	# echo "$1" | openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -a -k "$2"; 
	
	# non-fixed nonce	
	#echo -n $1 | xxd -p -r | openssl enc -aes-128-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -K $2 -iv '00000000000000000000000000000000' | xxd -p
	
	# fixed nonce
	echo -n $1 | xxd -p -r | openssl enc -aes-128-cbc -nopad -nosalt -K $2 -iv '00000000000000000000000000000000' | xxd -p
}
function decipher_message_in_hex_strings { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		#clr;
        echo "Usage : $0 decipher_message $1: (message) $2: (passcode) "
		return;
	fi
	
	# echo "$1" | openssl enc -aes-256-cbc -d -a -k "$2";
	# echo "$1" | openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -d -a -k "$2";

	# non-fixed nonce	
	#echo -n $1 | xxd -p -r | openssl enc -aes-128-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -d -K $2 -iv '00000000000000000000000000000000' | xxd -p
	
	# fixed nonce
	echo -n $1 | xxd -p -r | openssl enc -aes-128-cbc -nopad -nosalt -d -K $2 -iv '00000000000000000000000000000000' | xxd -p	
}

function cipher_message { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        echo "Usage : $0 cipher_message $1: (message) $2: (passcode) "
		return;
	fi
	
	# echo "$1" | openssl enc -aes-256-cbc -salt -a -k "$2"; 
	echo "$1" | openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -a -k "$2"; 
}
function decipher_message { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        echo "Usage : $0 decipher_message $1: (message) $2: (passcode) "
		return;
	fi
	
	# echo "$1" | openssl enc -aes-256-cbc -d -a -k "$2";
	echo "$1" | openssl enc -aes-256-cbc -pbkdf2 -iter $number_of_cipher_nonce_rounds -d -a -k "$2"; 
	
}


function derive_key { 
	if [ -z "$1" ]; then 
		echo "Usage advisory: derive_key \$passcode \$salt \$iteration_count"
		return 
	fi
	
	pbkdf_source=$HOME"\scripts\functions\supports"
	echo "$1" | $pbkdf_source/pbkdf2 "$2" "$3";
}

#
function encrypt_then_mac_folder {	

	if [ $2 == "" ];
	then
		clr;
		echo "Output file name unspecified."
        echo "Usage : $0 encrypt_then_mac_folder $1: (input folder (current if unspecified)) $2: (output file name) "
		return;
	fi
	
	# pack folder 
	if [ "$1" == "" ] # not specified 
	then
		current_folder_name=${PWD##*/};
	else
		current_folder_name=$1;	
	fi;
	 
	echo $current_folder_name;
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	zip -r "$current_folder_name"_$time_stamp.zip .; 
	# tar -cvzf $(current_folder_name)_$time_stamp.tar .; 
	# sha256_result=$(openssl dgst -sha256 "$current_folder_name"_$time_stamp.zip); 
	# echo $sha256_result; 
	# return "$current_folder_name"_$time_stamp.zip;
	
	unciphered_zip="$current_folder_name"_$time_stamp.zip;
	echo $unciphered_zip " manufactured."
	
	# cipher package 
	openssl enc -aes-256-cbc -salt -in $unciphered_zip -out "$2";
	
	sha256_result=$(openssl dgst -sha256 $2); 
	echo $sha256_result; 	
}

function cipher_then_mac_file {	

	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        echo "Usage : $0 encrypt_then_mac_file $1: (input file name) $2: (output file name) "
		return;
	fi
	
	touch $2; # create empty output file
	# cipher  
	cipher_file $1 $2;
	# get_file_sha "$2"; 
	sha256_result=$(openssl dgst -sha256 $2); 
	echo $sha256_result; 	
}

# opposite actions of cipher_then_mac_file
function mac_file_then_decipher { 
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ];
	then
		clr;
        echo "Usage : $0 mac_file_then_decipher $1: (input file name) $2: (output file name) "
		return;
	fi
	get_file_sha "$1"; 
	decipher_file "$1" "$2"; 	
}
 
