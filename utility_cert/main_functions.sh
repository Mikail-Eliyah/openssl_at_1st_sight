#!/bin/sh
# version: 2019-07-02_2207hr_53sec
dos2unix "./include.sh"
source "./include.sh"

function print_menu() {
		# get_path_nodes;
		# set_entity_id;
		check_entity_name;

	echo $demarcator
	echo "	[CREDENTIALS GENERATION]"
	echo $demarcator
	echo "Press 1  : generate_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing_and_certs_for_signing"
	echo "Press 2  : display_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing"
	echo "Press 3  : archive_all_credentials"
	echo "Press 3a : clear_all_credentials"	
	echo $demarcator
	echo "	[PASSCODES CRYPT]"
	echo $demarcator	
	echo "Press 4  : passcode_change_for_agent"
	echo "Press 5  : create_ciphered_passcode"	
	echo "Press 6  : retrieve_ciphered_passcode"
	echo ""
	echo "Press 6a  : import_partner_key"
	echo "Press 6b  : display_partner_key"
	echo $demarcator
	echo "	[CIPHERING]"
	echo $demarcator
	echo "Press 7  : cipher_message"
	echo "Press 8  : decipher_message"
	echo "Press 7a : cipher_messaging"
	echo "Press 8a : decipher_messaging"	
	echo ""
	echo "Press 9  : cipher_file"
	echo "Press 10 : decipher_file"
	echo $demarcator
	echo "	[MAC]"
	echo $demarcator
	echo "Press 11 : hmac_message"
	echo "Press 12 : hmac_message_verify"	
	echo ""
	echo "Press 13 : hmac_file"
	echo "Press 14 : hmac_file_verify"	
	echo $demarcator
	echo "	[SIGNING AND VERIFICATION]"
	echo $demarcator	
	echo "Press 15 : sign_message"
	echo "Press 16 : verify_signature_message"
	echo "Press 17 : sign_file"
	echo "Press 18 : verify_signature_file"
	echo ""
	echo "Press 19 : sign_message_with_certificate"
	echo "Press 20 : verify_signature_message_with_certificate"
	echo "Press 21 : sign_file_with_certificate"
	echo "Press 22 : verify_signature_file_with_certificate"	
	echo $demarcator
	echo "	[HASH]"
	echo $demarcator	
	echo "Press 23 : hash_message"	
	echo "Press 24 : hash_file"	
	echo "Press 25 : pack_and_hash_file"		
	echo $demarcator
	echo "	[Miscellany]"
	echo $demarcator	
	echo "Press 26 : BIST (built_in_self_test)"	
	echo "Press 27 : set_folder_structure"
	echo "Press 28 : trial_build_test"
	echo "Press 'x' or 'X' to exit the script"
}

function backup_contents_of_folder (){
	echo 'Archiving '$folder_description' to '$folder_destination_name
		
	folder_description='[$folder_destination_name]'
	create_folder_if_not_exist;
	cp -r $folder_name $folder_destination_name
}

function archive_all_credentials(){
	passcode_checkpoint_for_agent;
	
	target_archive='./archival/'
	folder_name=$target_archive
	folder_description='[archival]'
	create_folder_if_not_exist;	
	
	folder_name=$target_archive$time_stamp
	folder_description='[archival]'
	create_folder_if_not_exist;	

	if [ $status == "true" ]; then
		time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec);
		folder_name=$target_archive$time_stamp
		folder_description='[archival]'
		create_folder_if_not_exist;	
		
		folder_name=$key_store_path
		folder_description='key_store'
		folder_destination_name=$target_archive$time_stamp'/key_store'
		backup_contents_of_folder;
	
		folder_name=$csr_path
		folder_description='csr_folder'
		folder_destination_name=$target_archive$time_stamp'/csr'
		backup_contents_of_folder;

		folder_name=$certs_path
		folder_description='cert_folder'
		folder_destination_name=$target_archive$time_stamp'/certs'
		backup_contents_of_folder;
	
		folder_name=$signature_store_path
		folder_description='signatures'
		folder_destination_name=$target_archive$time_stamp'/signatures'
		backup_contents_of_folder;
		
		folder_name=$passcodes_store_path
		folder_description='passcodes'
		folder_destination_name=$target_archive$time_stamp'/passcodes'
		backup_contents_of_folder;	
	fi
	
	tree .	# display current dir structure
}

function generate_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing_and_certs_for_signing(){
	label="[generate_key_for_ciphering]";
	print_label;
	generate_key_for_ciphering;
	
	label="[generate_key_for_hmac_sha256]";
	print_label;
	generate_key_for_hmac_sha256;	
	
	label="[generate_key_rsa_for_signing]";
	print_label;
	generate_key_rsa_for_signing;
	
	label="[generate_key_dsa_for_signing]";
	print_label;
	generate_key_dsa_for_signing;
	
	label="[generate_key_ecc_for_signing]";
	print_label;
	generate_key_ecc_for_signing;
	
	label="[generate_cert_from_cnf_for_signing_rsa_dsa_and_ecc]";
	print_label;
	label="[generate_cert_from_cnf_for_signing_rsa]";
	print_label;
	generate_cert_from_cnf_for_signing_rsa;
	label="[generate_cert_from_cnf_for_signing_dsa]";
	print_label;
	generate_cert_from_cnf_for_signing_dsa;
	label="[generate_cert_from_cnf_for_signing_ecc]";
	print_label;
	generate_cert_from_cnf_for_signing_ecc;
}

function display_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing(){
	label="[display_key_for_ciphering]";
	print_label;
	display_key_for_ciphering;
	
	label="[display_key_for_authentication]";
	print_label;
	display_key_for_authentication;
	
	label="[display_key_rsa_for_signing]";
	print_label;
	display_key_rsa_for_signing;
	
	label="[display_key_dsa_for_signing]";
	print_label;
	display_key_dsa_for_signing;
	
	label="[display_key_ecc_for_signing]";
	print_label;
	display_key_ecc_for_signing;	
}


function sign_message_with_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		sign_message_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		sign_message_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		sign_message_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function verify_message_with_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		verify_message_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		verify_message_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		verify_message_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function sign_file_with_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		sign_file_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		sign_file_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		sign_file_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function verify_file_with_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		verify_file_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		verify_file_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		verify_file_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function sign_file_with_rsa_or_dsa_or_ecc_with_cert(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		sign_file_with_cert_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		sign_file_with_cert_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		sign_file_with_cert_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function verify_file_with_rsa_or_dsa_or_ecc_with_cert(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		verify_file_with_cert_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		verify_file_with_cert_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		verify_file_with_cert_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function sign_message_with_cert_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		sign_message_with_cert_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		sign_message_with_cert_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		sign_message_with_cert_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function verify_message_with_cert_rsa_or_dsa_or_ecc(){
	select_signing_algo;
	
	if [ $signing_algo == 'RSA' ] || [ $signing_algo == 'rsa' ];then
		verify_message_with_cert_rsa;
	elif [ $signing_algo == 'DSA' ] || [ $signing_algo == 'dsa' ];then	
		verify_message_with_cert_dsa;
	elif [ $signing_algo == 'ECC' ] || [ $signing_algo == 'ecc' ];then	
		verify_message_with_cert_ecc;
    else
		echo "signing_algo INVALID"
    fi
}

function select_signing_algo(){
	number_of_symbols_for_inputs=3
	read -n $number_of_symbols_for_inputs -p "Input Selection (RSA/DSA/ECC):" signing_algo
	echo ""
	echo "signing_algo: "$signing_algo
}

function set_folder_structure(){
	folder_name=$key_store_path
	folder_description='key_store'
	create_folder_if_not_exist;
	
	folder_name=$csr_path
	folder_description='csr_folder'
	create_folder_if_not_exist;

	folder_name=$cnf_path
	folder_description='cnf_folder'
	create_folder_if_not_exist;

	folder_name=$certs_path
	folder_description='cert_folder'
	create_folder_if_not_exist;
	
	folder_name=$message_store_path
	folder_description='messages_folder'
	create_folder_if_not_exist;	
	
	folder_name=$signature_store_path
	folder_description='signatures'
	create_folder_if_not_exist;	
	
	folder_name=$passcodes_store_path
	folder_description='passcodes'
	create_folder_if_not_exist;
	
	folder_name='./archival/'
	folder_description='archival'
	create_folder_if_not_exist;	
	
	tree .	# display current dir structure
}

function clear_all_credentials(){

	passcode_checkpoint_for_agent;

	if [ $status == "true" ]; then
		folder_name=$key_store_path
		folder_description='key_store'
		echo 'Clearing '$folder_description
		rm -rf $key_store_path/*.*
	
		folder_name=$csr_path
		folder_description='csr_folder'
		echo 'Clearing '$folder_description
		rm -rf $csr_path/*.*

		folder_name=$certs_path
		folder_description='cert_folder'
		echo 'Clearing '$folder_description
		rm -rf $certs_path/*.*
	
		folder_name=$signature_store_path
		folder_description='signatures'
		echo 'Clearing '$folder_description
		rm -rf $signature_store_path/*.*	
		
		folder_name=$passcodes_store_path
		folder_description='passcodes'
		echo 'Clearing '$folder_description
		rm -rf $passcodes_store_path/*.*	
	fi
	
	tree .	# display current dir structure
}

function built_in_self_test(){
	echo "BIST (built_in_self_test)"
	block_function_from_proceding;
}

function block_function_from_proceding(){
	echo "This function is prohibited for now."
	
	if [ -z "$reason" ]; then
		reason="[ unstated ]"
	fi
	
	echo "Reason: "$reason
	exit;
	echo 'If you are seeing this line. The exit() is not working.'
}

function exit_program() {
	printf "\n quit.\n"
	echo 'X' : quitprogram
}

function default_action() {
    echo "You have entered an invallid selection!"
    echo "Please try again!"
    echo ""
    echo "Press any key to continue..."
    read -n 1
    clear
	set -u # force it to treat unset variables as an error 
	unset mainmenuinput
	#echo $mainmenuinput 
    main
}