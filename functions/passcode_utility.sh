#!/bin/bash

declare passcode=''

function create_ciphered_passcode(){
	read -p '[passcode_to_be_ciphered]: ' passcode_to_be_ciphered
	read -p '[master_passcode as key]: ' passcode
	read -p '[passcode_ciphered_file, <user_id@account>.pass e.g.  ursa@facebook.pass]: ' passcode_ciphered_file
	
	if [ -z "$passcode_to_be_ciphered" ] || [ -z "$passcode" ];then
        echo "Usage : $0 cipher_message $passcode_to_be_ciphered: (message) $passcode: (passcode) "
		return;
	fi
	
	passcode_ciphered=$(echo "$passcode_to_be_ciphered" | openssl enc -aes-256-cbc -salt -pbkdf2 -a -k "$passcode")
	echo $passcode_ciphered > $passcodes_store_path$passcode_ciphered_file
	
}

function retrieve_ciphered_passcode(){
	label="[passcode repo]: ";
	print_label;
	tree $passcodes_store_path
	
	read -p '[master_passcode as key]: ' passcode
	read -p '[passcode_ciphered_file, <user_id@account>.pass e.g.  ursa@facebook.pass]: ' passcode_ciphered_file
	
	filename=$passcodes_store_path$passcode_ciphered_file
	check_if_file_exists;
	
	if [ $status == "false" ]; then 
		label="[ "$filename" does not exists. ]";
		print_label;
		
		exit;
	else
		label="[ "$filename" exists. ]";
		print_label;
		
		passcode_ciphered_file=$filename
		
		# echo "passcode_ciphered_file: "$passcode_ciphered_file
		# get pass_ciphered from pass file
		pass_ciphered=$(cat $passcode_ciphered_file)
		pass_deciphered=$(echo "$pass_ciphered" | openssl enc -aes-256-cbc -salt -pbkdf2 -d -a -k "$passcode")
		echo "pass_deciphered: "$pass_deciphered
	fi	
}

function retrieve_passcode(){
	key=$(cat $key_file_with_path)
	
	echo "passcode_ciphered_file: "$passcode_ciphered_file
	# get pass_ciphered from pass file
	pass_ciphered=$(cat $passcode_ciphered_file)
	pass_deciphered=$(echo "$pass_ciphered" | openssl enc -aes-256-cbc -salt -pbkdf2 -d -a -k "$key")
	echo "pass_deciphered: "$pass_deciphered
}

function write_ciphered_passcode_to_file(){
	key=$(cat $key_file_with_path)
	pass_ciphered=$(echo "$pass" | openssl enc -aes-256-cbc -salt -pbkdf2 -a -k "$key")
		
	echo $pass_ciphered > $passcode_ciphered_file

	pass_ciphered=$(cat $passcode_ciphered_file)
	
	#key_file_with_path=$key_of_agent_aes_cbc_ciphering_file
	#retrieve_passcode;
	
	#pass_deciphered=$(echo "$pass_ciphered" | openssl enc -aes-256-cbc -salt -pbkdf2 -d -a -k "$key")
	#echo "pass_deciphered: "$pass_deciphered
}

function passcode_change_for_agent(){
	filename=$key_of_agent_aes_cbc_ciphering_file
	check_if_file_exists;
	
	agent_pass_with_path=$passcodes_store_path'agent_'$agent_name'.pass'
	
	if [ $status == "false" ]; then 
		label="[ "$filename" generating. ]";
		number_of_bytes=16
		echo 'Generating :'$key_of_agent_aes_cbc_ciphering_file
		openssl rand -hex $number_of_bytes > $key_of_agent_aes_cbc_ciphering_file
		cat $key_of_agent_aes_cbc_ciphering_file
		print_label;
		
		read -p '[Create Kharon_master_passcode]: ' pass
		
		passcode_ciphered_file=$agent_pass_with_path
		key_file_with_path=$key_of_agent_aes_cbc_ciphering_file
		write_ciphered_passcode_to_file;
	
		echo 'Kharon_master_passcode created'
		
		exit;
	else
		label="[ "$filename" exists. ]";
		print_label;
	fi
	
	key=$(cat $key_of_agent_aes_cbc_ciphering_file)
	echo "key: "$key
	read -p '[Kharon_master_passcode]: ' pass
	passcode_ciphered_file=$agent_pass_with_path
	key_file_with_path=$key_of_agent_aes_cbc_ciphering_file
	retrieve_passcode;
	echo "pass_deciphered: "$pass_deciphered
	echo "pass: "$pass
	
	if [ "$pass_deciphered" == "$pass" ];then
		echo "Matched. Updating Kharon_master_passcode."
		
		read -p '[Kharon_master_passcode (new) ]: ' pass
		
		passcode_ciphered_file=$agent_pass_with_path
		write_ciphered_passcode_to_file;
		
		# ls '.'$passcodes_store_path
		# ls $passcodes_store_path
		# cat $agent_pass_with_path
	
	else
		echo "NOT Matched. Update passcode failed."
		exit;
	fi

}

function passcode_checkpoint_for_agent(){
	filename=$key_of_agent_aes_cbc_ciphering_file
	check_if_file_exists;
	
	agent_pass_with_path=$passcodes_store_path'agent_'$agent_name'.pass'
	
	if [ $status == "false" ]; then 
		label="[ "$filename" generating. ]";
		number_of_bytes=16
		echo 'Generating :'$key_of_agent_aes_cbc_ciphering_file
		openssl rand -hex $number_of_bytes > $key_of_agent_aes_cbc_ciphering_file
		cat $key_of_agent_aes_cbc_ciphering_file
		print_label;
		
		read -p '[Create Kharon_master_passcode]: ' pass
		
		passcode_ciphered_file=$agent_pass_with_path
		key_file_with_path=$key_of_agent_aes_cbc_ciphering_file
		write_ciphered_passcode_to_file;
	
		echo 'passcode created'
		
		exit;
	else
		label="[ "$filename" exists. ]";
		print_label;
	fi
	
	key=$(cat $key_of_agent_aes_cbc_ciphering_file)
	echo "key: "$key
	read -p '[Kharon_master_passcode]: ' pass
	passcode_ciphered_file=$agent_pass_with_path
	key_file_with_path=$key_of_agent_aes_cbc_ciphering_file
	retrieve_passcode;
	echo "pass_deciphered: "$pass_deciphered
	echo "pass: "$pass
	
	if [ "$pass_deciphered" == "$pass" ];then
		echo "Matched: passcode check pass."
		
		status="true"
	else
		echo "NOT Matched: passcode check failed."
		status="false"
		exit;
	fi

}

function write_passcode_plaintext_to_file(){
	key_AES=''
	number_of_bytes=16
	
	if [ “$1” == ‘’ ]
		then 
			NOP; # or “:”
		else
			number_of_bytes="$1"
	fi
	
	#t=$(echo "key_AES='m m'")
	#echo "$t" > keys_for_messaging.txt

	text_to_write=$(echo "key_AES='$(openssl rand -hex $number_of_bytes)'"); # e.g. 9ebbb1e5, babb1e5
	echo "$text_to_write" > ./scripts/passcodes/keys_for_messaging.txt

	#$ echo "key_AES='Any string'" > keys_for_messaging.txt
	#$ source ./keys_for_messaging.txt # load key with variable 
 
	echo $key_AES
}

function make_passcode_with_N_rounds (){
	printf "\n"
	#SALT_FIXED=$(echo '0: FC89BFC2B05F1C2E64B8784392783AC9' | xxd -r)
	# $(openssl rand -base64 24)
	# $(openssl rand -hex 24) # 24 or less hex characters
	prefix="Salted__"
	suffix=""
			
	SALT_FIXED="11111111"
	PASS_FIXED=$(echo "111111111111111" | xxd -p)
	# printf "$s\n" "$SALT_FIXED"
	#echo $SALT_FIXED 
	#SALT=$(echo SALT_FIXED | xxd -p) # to hex
	SALT=$SALT_FIXED
	#echo $SALT
	#echo $PASS_FIXED
	
	source $HOME"/scripts/functions/data_convert.sh"
	#read -p "Enter seed string:" seed
	seed="Hi There"
	# $1=$seed (with spaces)
	#seed_hex=$(ascii_to_hex "$seed")	# use double quote to get string with spaces as 1 argument
	#len=$(echo $seed_hex | wc -c)
	#seed_hex=${seed_hex:0:(len-1)} # remove last character
	seed_hex=$(echo -n "$seed" | xxd -p) 
	echo $seed_hex
	
	read -p "Enter N:" N
	#N=3
	# 7eb48561
				
	for VARIABLE in $(seq 1 1 $N)
	do 
		#printf "Round: %d \n" "$VARIABLE"
		ANS=$(echo -n $seed_hex | xxd -p -r | openssl enc -aes-256-cbc -S $SALT -k $PASS_FIXED)
		# truncate prefix="Salted__"
		# echo "$string" | sed -e "s/^$prefix//" -e "s/$suffix$//"
		ANS_FINAL=$(echo $ANS | sed -e "s/^$prefix//" -e "s/$suffix$//")
		ANS_FINAL=$(echo $ANS_FINAL | xxd -p)	
		#printf "\n[%d] untruncated salt: %s\n" "$VARIABLE" "$ANS_FINAL"
		SALT=${ANS_FINAL: -10} # renew SALT last 5 bytes only
		SALT=${SALT:0:8} # remove last byte
		#echo ${ANS_FINAL:0:8} # get 1st 4 bytes
			#echo ${ANS_FINAL: -8} # get last 4 bytes
			#printf "\nSALT:" echo $SALT		
			#printf "\nPASS_FIXED:" echo $PASS_FIXED	
		done			
	
		#echo $SALT
		printf "\npasscode: %s\n" "$SALT"
}

function make_passcode (){
	salt_hex=$(generate_random_hex 16)
	echo $salt_hex
	# echo ${#salt_hex}
	# echo 'FC89BFC2B05F1C2E64B8784392783AC9'
	printf "\n"
	salt=$(echo '0: '$salt_hex | xxd -r)
	# $(openssl rand -base64 24)
	# $(openssl rand -hex 24) # 24 or less hex characters
	PASS_FIXED="test"
	# printf "$s\n" "$salt"
	echo $salt
	# salt enc -base64 -aes-256-cbc -S $salt -k $PASS_FIXED
	#openssl enc -aes-256-cbc -S $salt -k $PASS_FIXED
	# ans=$(cipher_message  '00000000000000000000000000000000' $PASS_FIXED)
	
	ans=$(echo -n $seed_hex | xxd -p -r | openssl enc -aes-256-cbc -S '0000000000000000' -k $PASS_FIXED)
	# truncate prefix="Salted__"
	# echo "$string" | sed -e "s/^$prefix//" -e "s/$suffix$//"
	prefix="Salted__"
	suffix=""
	#echo $ans
	#ans=$(remove_spaces $ans)
	echo $ans
	ans_parsed=$(echo "$ans" | sed -e "s/^$prefix//" -e "s/$suffix$//")
	#ans_parsed=$(remove_whitespaces $ans_parsed)
	echo $ans_parsed
	ans_parsed=$(echo $ans | xxd -p)

	#ans_parsed=$(remove_whitespaces $ans_parsed)
	echo $ans_parsed
}

# Usage:
# $ passcode='a\Z0 %20-9'
# $ passcode_quality_check $passcode
function passcode_quality_check(){
	#passcode="$1"
	required_len=20
	
	echo "checking .... $passcode"
	score_lowercase=$(echo "$passcode" |  grep "[[:lower:]]" | wc -l)
	score_uppercase=$(echo "$passcode" |  grep "[[:upper:]]" | wc -l)
	#score_number=$(echo "$passcode" |  grep "[[:digits:]]" | wc -l)
	score_number=$(echo "$passcode" |  grep "[0-9 ]" |  wc -l)
	score_whitespaces=$(echo "$passcode" |  grep "[[:blank:]]" | wc -l)
	score_symbol=$(echo "$passcode" | grep "[^a-zA-Z0-9 ]" | wc -l)
	
	
	echo "score_lowercase: " $score_lowercase
	echo "score_uppercase: " $score_uppercase
	echo "score_number: " $score_number
	echo "score_symbol: " $score_symbol
	echo "score_whitespaces: " $score_whitespaces
		
	score_total=$(($score_lowercase + $score_uppercase + $score_number + $score_symbol))
	echo "score_total: " $score_total
	
	if [ ${#passcode} -ge  $required_len ]; then
		echo "Length is ok. Exceed by: " $((${#passcode} -  $required_len))
	else
		echo "Length is deficient by: " $(($required_len - ${#passcode}))
	fi
	
	echo ""
	echo "Beware of dictionary attacks."
	
	# grep -F "$(printf '\r')" application.log
}

#$ passcode=0123456789
#198     tmp.zip
# compression_ratio: 0.0212
#$ passcode=0123456788
#197     tmp.zip
# compression_ratio: 0.0211
#$ du -sb tmp.txt
#10000   tmp.txt
function estimate_passcode_redundancy_characters_with_compression(){

	passcode="$1"

	printf $passcode'%.0s' {1..1000} > tmp.txt
	zip tmp.txt.zip tmp.txt 
	size_in_bytes_compressed=$(du -sb tmp.txt.zip |  cut -f1)
	size_in_bytes_uncompressed=$(du -sb tmp.txt |  cut -f1)
	
	echo "size_in_bytes_uncompressed: " $size_in_bytes_uncompressed " bytes"
	echo "size_in_bytes_compressed: " $size_in_bytes_compressed " bytes"
	
	echo "compression_ratio: "
	echo 'print ('$size_in_bytes_compressed'/'$size_in_bytes_uncompressed')' | python3

	rm -rf tmp.txt.zip tmp.txt
	
}

function clear_passcode_cache(){
	passcode=''	# clear globals
}


#note: create_string_non_repetitive_to_keyboard_char is reference code, do in python instead
# for comparing passcode with low entropy
#function create_string_non_repetitive_to_keyboard_char (){
#	len_required="$1"
	
#	str=$(echo {a..z}  {A..Z}  {0..9} "\!\`~@#$^&*()-_=+|[]{};’:”,./<>?") #%
#	str=$(echo ${str//[[:blank:]]/}) # remove blanks
#	str=$(echo ' '$str) # add space back
	
#	# make string
#	ans=$(expr 5 % 3)
	
#	#i=0
#	#echo $len_required
#	#echo $i
#	str_len=${#str}
#	i=$str_len
#	multiplier=2
	
#	#while [ $i -le $len_required ]
#	while [ $[$i-$len_required] -qe 0 ]
#	do
#	i=$[$i-$len_required]
#	multiplier=$[$multiplier+1]
#	echo $i
#	done
	
#	echo $multiplier
	
#	str_extended=$(printf "$str"'%.0s' {1.."$multiplier"})
	
#	echo "str_extended: $str_extended"
#	len_residue=$(expr $len_required % $str_len)
#	echo "len_residue: "$len_residue

#	# str[0..$(#string)]
#	#position_start=9
#	#len=1
#	#echo ${str:$position_start:$len}
#	#echo ${str:$position_start:$(($str_len-$position_start))#}
	
#	# append rest indicated by residue len
#	# str_to_add={str:0:$(($len_residue-1))}
#	# str_extended_final=$str_extended$str_to_add
	
#}

#b0x ~ # cat pws.txt | egrep "^[a-zA-Z0-9]+$" | wc -l
#397198
#b0x ~ # cat pws.txt | egrep "^[a-z]+$" | wc -l
#241208
#b0x ~ # cat pws.txt | egrep "^[0-9]+$" | wc -l
#34703
#b0x ~ # cat pws.txt | egrep "^[A-Z]+$" | wc -l
#2868