#!/bin/sh
# version: 2020-10-10_0612hr_21sec
dos2unix "./include.sh"
source "./include.sh"

function print_menu() {
		# get_path_nodes;
		# set_entity_id;
		check_entity_name;

	echo $demarcator
	echo "	[CREDENTIALS GENERATION]"
	echo $demarcator
	echo "Press 1  : "
	echo "		generate_rsa_pss_certs_for_signing"
	echo "		generate_rsa_oaep_certs_for_ciphering"
	
	echo $demarcator
	echo "	[SIGNING AND VERIFICATION]"
	echo $demarcator	
	echo "Press 2  : create_signature_file"
	echo "Press 3  : create_signature_file_with_cert"
	echo "Press 4  : verify_signature_file"		
	echo "Press 5  : verify_signature_file_with_cert"	
	
	echo $demarcator
	echo "	[CIPHERING]"
	echo $demarcator
	echo "Press 6  : rsa_oaep_file_cipher"
	echo "Press 7  : rsa_oaep_file_decipher"
	
	echo $demarcator
	echo "	[_]"
	echo $demarcator	
	echo "Press 11 : clear_all_credentials"
	
	echo $demarcator
	echo "Press 'x' or 'X' to exit the script"
}

function generate_rsa_pss_keys_for_signing() {
	echo "generate_rsa_pss_keys_for_signing";
	#label="[generate_key_rsa_pss_for_signing]";
	#print_label;
	
	if [ "$key_store_cipher_option" = 'ON' ];
	then
		openssl genrsa -$key_store_cipher_key_algo -out $key_private_rsa_pss_for_signing_file $key_rsa_pss_length
	else
		openssl genrsa -out $key_private_rsa_pss_for_signing_file $key_rsa_pss_length
	fi
	
	echo "Export public key to: "$key_public_rsa_pss_for_signing_file
	openssl rsa -in $key_private_rsa_pss_for_signing_file -outform PEM -pubout -out $key_public_rsa_pss_for_signing_file
	# openssl rsa -in $key_private_rsa_pss_for_signing_file -pubout > $key_public_rsa_pss_for_signing_file	
}
		
function generate_rsa_pss_cert_for_signing() {
	echo "generate_rsa_pss_cert_for_signing";
	
	openssl genrsa -out $key_private_rsa_pss_for_signing_file $key_rsa_pss_length
	#openssl req -config $config_file_cert_signing_rsa_pss_with_path -new -key $key_private_rsa_pss_for_signing_file -x509 -days $number_of_days_validity -out $cert_signing_rsa_pss_with_path
	openssl req -config $config_file_cert_signing_rsa_pss_with_path -new -x509 -key $key_private_rsa_pss_for_signing_file -out $cert_signing_rsa_pss_with_path
	
	openssl x509 -text -noout -in $cert_signing_rsa_pss_with_path 
	
	openssl verify -verbose -CAfile $cert_signing_rsa_pss_with_path $cert_signing_rsa_pss_with_path
}

function generate_rsa_oaep_keys_for_ciphering() {
	echo "generate_rsa_oaep_keys_for_ciphering";
	
	if [ "$key_store_cipher_option" = 'ON' ];
	then
		openssl genrsa -$key_store_cipher_key_algo -out $key_private_rsa_oaep_for_ciphering_file $key_rsa_oaep_length
	else
		openssl genrsa -out $key_private_rsa_oaep_for_ciphering_file $key_rsa_oaep_length
	fi
	
	echo "Export public key to: "$key_public_rsa_oaep_for_ciphering_file
	openssl rsa -in $key_private_rsa_oaep_for_ciphering_file -outform PEM -pubout -out $key_public_rsa_oaep_for_ciphering_file
	# openssl rsa -in $key_private_rsa_oaep_for_ciphering_file -pubout > $key_public_rsa_oaep_for_ciphering_file	
	
}

function generate_rsa_oaep_cert_for_ciphering (){
	echo "generate_rsa_oaep_cert_for_ciphering";
	
	openssl genrsa -out $key_private_rsa_oaep_for_ciphering_file $key_rsa_oaep_length
	#openssl req -config $config_file_cert_ciphering_rsa_oaep_with_path -new -key $key_private_rsa_oaep_for_ciphering_file -x509 -days $number_of_days_validity -out $cert_ciphering_rsa_oaep_with_path
	openssl req -config $config_file_cert_ciphering_rsa_oaep_with_path -new -x509 -key $key_private_rsa_oaep_for_ciphering_file -out $cert_ciphering_rsa_oaep_with_path
	
	openssl x509 -text -noout -in $cert_ciphering_rsa_oaep_with_path 
	
	openssl verify -verbose -CAfile $cert_ciphering_rsa_oaep_with_path $cert_ciphering_rsa_oaep_with_path	
}
#################
# creating signatures is the same with or without the cert, it is the private key that signs
function create_hash_file(){
	openssl dgst -$hash_algo -binary $file_to_sign_with_path > $hash_file
}

function create_signature_file(){
	create_hash_file;
	
	openssl pkeyutl -sign -in $hash_file -inkey $key_private_rsa_pss_for_signing_file -out $signature_file_rsa_pss -pkeyopt digest:$hash_algo -pkeyopt rsa_padding_mode:pss -pkeyopt rsa_pss_saltlen:-1
}

function create_signature_file_with_cert(){	
	create_hash_file;
	create_signature_file;
	
	# convert from pkcs7 to PEM
	# openssl pkcs7 -print_certs -in $file_signature_pkcs7 -out $signature_file_rsa_pss
	openssl x509 -in $cert_signing_rsa_pss_with_path -text -noout
	
}
#################
function verify_signature_file(){
	openssl pkeyutl -verify -in $hash_file -sigfile $signature_file_rsa_pss -pkeyopt rsa_padding_mode:pss -pubin -inkey $key_public_rsa_pss_for_signing_file -pkeyopt rsa_pss_saltlen:-1 -pkeyopt digest:$hash_algo
}

function verify_signature_with_cert(){
	openssl x509 -pubkey -noout -in $cert_signing_rsa_pss_with_path  > $key_public_rsa_pss_for_signing_file
	
	verify_signature_file;
}
#################
function rsa_oaep_file_cipher() {
	echo "Caveat: RSA public key can encrypt a file less than the key size, hence, it is usually used to cipher symmetric keys, hence, for data > key size 'error: data too large for key size'"
	
	openssl rsautl -encrypt -pubin -inkey $key_public_rsa_oaep_for_ciphering_file -in $file_to_cipher_with_path -out $file_ciphered_with_path -oaep
	
	echo "file (plaintext in): "$file_to_cipher_with_path
	echo ""
	cat $file_to_cipher_with_path
	echo ""
	echo "file (ciphered out): "$file_ciphered_with_path
	echo ""	
	cat $file_ciphered_with_path	
}

function rsa_oaep_file_decipher() {
	openssl rsautl -decrypt -inkey $key_private_rsa_oaep_for_ciphering_file -in $file_ciphered_with_path -out $file_deciphered_with_path -oaep
	
	echo $key_private_rsa_oaep_for_ciphering_file
	
	echo "file (ciphered in): "$file_ciphered_with_path
	echo ""	
	cat $file_ciphered_with_path
	echo ""
	echo "file (deciphered out): "$file_deciphered_with_path
	echo ""	
	
	filename=$file_deciphered_with_path
	check_if_file_exists_halt_and_exit_otherwise;
	cat $file_deciphered_with_path	
}


function create_rsa_oaep_keys_for_ciphering (){	
	openssl genrsa -out $key_private_rsa_oaep_for_ciphering_file $key_rsa_oaep_length
	
	openssl rsa -in $key_private_rsa_oaep_for_ciphering_file -outform PEM -pubout -out $key_public_rsa_oaep_for_ciphering_file
}

function rsa_oaep_file_cipher_00() {
	openssl rsautl -encrypt -pubin -inkey $key_public_rsa_oaep_for_ciphering_file -in $file_to_cipher_with_path -out $file_ciphered_with_path -oaep
}

function rsa_oaep_file_decipher_00() {
	openssl rsautl -decrypt -inkey $key_private_rsa_oaep_for_ciphering_file -in $file_ciphered_with_path -out $file_message_deciphered_with -oaep
}

#################
function select_signing_algo(){
	number_of_symbols_for_inputs=3
	read -n $number_of_symbols_for_inputs -p "Input Selection (RSA/DSA/ECC):" signing_algo
	echo ""
	echo "signing_algo: "$signing_algo
}

function clear_all_credentials(){
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