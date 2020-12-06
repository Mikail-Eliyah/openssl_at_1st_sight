#!/bin/bash
#dos2unix "./parameters.sh"
source $HOME"/scripts/parameters.sh"

function hmac_message(){
	get_key_for_authentication;
	
	if [ "$1" == "" ] # not specified 
	then	
		NOP;
	else
		message_input=$1;	
	fi;		
	
	ANS=''
	ANS=$(echo -n $message_input | xxd -r -p | openssl dgst -$hash_algo -mac HMAC -macopt hexkey:$key_hmac_sha256_authentication | awk '{print $2}')
	
	echo "HMAC: " $ANS
	
	ret=$ANS # return string as return $ANS only return numeric
}

function hmac_message_verify(){
	if [ "$2" == "" ] # not specified 
	then	
		echo "Missing 2nd parameter: hmac_to_verify"
		return;
		# NOP;
	else
		hmac_to_verify=$2;	
	fi;	
	
	get_key_for_authentication;
	
	if [ "$1" == "" ] # not specified 
	then	
		NOP;
	else
		message_input=$1;	
	fi;		
	
	ANS=$(echo -n $message_input | xxd -r -p | openssl dgst -$hash_algo -mac HMAC -macopt hexkey:$key_hmac_sha256_authentication | awk '{print $2}')
	
	if [ $ANS == $hmac_to_verify ];then
		echo "HMAC_SHA256: verification OK"
	else
		echo "HMAC_SHA256: verification NOT OK"
	fi
}

function hmac_file(){

	if [ "$TARGET_FILE" == "" ] # not specified 
	then	
		echo "Choose a file to hmac: "
		echo "======================"
		ls $message_store_path
		read -p "Check passcode of file: [input just file name] " file_chosen
		TARGET_FILE=$message_store_path$file_chosen;
		# NOP;
	else
		TARGET_FILE=$1;	
	fi;	
	
	filename="$message_store_path$TARGET_FILE"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;
	
	get_key_for_authentication;
	
	ANS=$(openssl dgst -$hash_algo -mac HMAC -macopt hexkey:$key_hmac_sha256_authentication -hex "$message_store_path$TARGET_FILE" | awk '{print $2}')
	
	TARGET_FILE=''
	echo "HMAC: " $ANS
	
	ret=$ANS # return string as return $ANS only return numeric	
}

function hmac_file_verify(){
	if [ "$2" == "" ] # not specified 
	then	
		echo "Missing 2nd parameter: hmac_to_verify"
		return;
		# NOP;
	else
		hmac_to_verify=$2;	
	fi;		

	if [ "$TARGET_FILE" == "" ] # not specified 
	then	
		echo "Choose a file to hmac: "
		echo "======================"
		ls $message_store_path
		read -p "Check passcode of file: [input just file name] " file_chosen
		TARGET_FILE=$message_store_path$file_chosen;
		# NOP;
	else
		TARGET_FILE=$1;	
	fi;	
	
	filename="$message_store_path$TARGET_FILE"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;

	get_key_for_authentication;
	
	ANS=$(openssl dgst -$hash_algo -mac HMAC -macopt hexkey:$key_hmac_sha256_authentication -hex "$message_store_path$TARGET_FILE" | awk '{print $2}')
	
	TARGET_FILE=''
	
	if [ $ANS == $hmac_to_verify ];then
		echo "HMAC_SHA256: verification OK"
	else
		echo "HMAC_SHA256: verification NOT OK"
	fi
}


