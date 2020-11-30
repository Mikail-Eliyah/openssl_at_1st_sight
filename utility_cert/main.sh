#!/bin/sh
# version: 2019-07-02_2207hr_53sec
dos2unix "./main_functions.sh"
source "./main_functions.sh"

# MAIN
main () {
	echo -en '\033c'; # clear;
	print_menu;
	number_of_digits_for_inputs=2
	# read  -n 1 -p "Input Selection:" main_menu_input
	read  -n $number_of_digits_for_inputs -p "Input Selection:" main_menu_input
	echo ""
	
	if [ "$main_menu_input" = "1" ]; then
		passcode_checkpoint_for_agent;
		generate_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing_and_certs_for_signing;
		
    elif [ "$main_menu_input" = "2" ]; then
		# block_function_from_proceding;
		display_key_for_ciphering_and_hmac_key_and_keys_rsa_dsa_ecc_for_signing;
    elif [ "$main_menu_input" = "3" ]; then
		archive_all_credentials;		
    elif [ "$main_menu_input" = "3a" ]; then
		# block_function_from_proceding;
		clear_all_credentials;
    elif [ "$main_menu_input" = "4" ]; then
		 passcode_change_for_agent;
    elif [ "$main_menu_input" = "5" ]; then
		create_ciphered_passcode;
		# block_function_from_proceding;
    elif [ "$main_menu_input" = "6" ]; then
		retrieve_ciphered_passcode;
		#reason='certs are generated'
		#block_function_from_proceding;
		
    elif [ "$main_menu_input" = "6a" ]; then
		import_partner_key;
    elif [ "$main_menu_input" = "6b" ]; then
		display_partner_key;		
			
    elif [ "$main_menu_input" = "7" ];then
		read -p '[Message in text]: ' message_input
		echo $message_input
		# message_input=$(ascii_to_hex "$message_input") # as $?
		message_input=$(tohex "$message_input")
		
		cipher_message;	

		message_input=$ANS
		echo $demarcator
		label="ciphered text: "$message_input
		print_label_with_color;
		label="IV: "$IV
		print_label_with_color;
		echo $demarcator
		
		echo "deciphering ... "
		
		decipher_message;	
		message_input=$ANS
		echo "Deciphered Message in hex: "$message_input
		echo "deciphered text: "
		# hex_to_ascii "$message_input"
		message_input=$(fromhex "$message_input")
		echo $message_input
		
    elif [ "$main_menu_input" = "8" ];then
		read -p '[Ciphered Message in hex]: ' message_input
		read -p '[IV]: ' IV
		echo "deciphering ... "
		
		decipher_message;	
		message_input=$ANS
		echo $demarcator
		echo $demarcator
		echo "Deciphered Message in hex: "$message_input
		echo "Deciphered Message in text: "
		hex_to_ascii "$message_input"
		echo $demarcator
		echo $demarcator
		
    elif [ "$main_menu_input" = "7a" ];then	
		cipher_messaging;
		echo $demarcator
    elif [ "$main_menu_input" = "8a" ];then	
		decipher_messaging;
		echo $demarcator
    elif [ "$main_menu_input" = "9" ];then	
		tree $message_store_path
		echo $demarcator
		read -p '[file_input, e.g. view.txt]: ' file_input
		read -p '[file_ouput, e.g. view.txt.enc]: ' file_output
		cipher_file;
		
		echo "file at "$message_store_path$file_output
		
		# cat $message_store_path$file_output
		echo $demarcator
		label="IV: "$IV
		print_label_with_color;
		echo $demarcator
		
    elif [ "$main_menu_input" = "10" ];then
		tree $message_store_path
		echo $demarcator
		read -p '[file_input, e.g. view.txt.enc]: ' file_input
		read -p '[file_output, e.g. view.txt]: ' file_output
		
		read -p '[IV]: ' IV
		
		decipher_file;
		
		echo "file at "$message_store_path$file_output
		
		cat $message_store_path$file_output
		echo ""
		echo $demarcator	
			
    elif [ "$main_menu_input" = "11" ];then	
		read -p '[Message in text]: ' message_input
		echo $message_input
		message_input=$(ascii_to_hex "$message_input")
		
		hmac_message;
		
		echo "HMAC_SHA256: "$ANS
		echo ""
		echo $demarcator	
			
    elif [ "$main_menu_input" = "12" ];then	
		read -p '[Message in text]: ' message_input
		echo $message_input
		message_input=$(ascii_to_hex "$message_input")
		read -p '[hmac_to_verify, e.g. e.g. e82b971196327b11c5278daef17fdbb44bae14c3cde2a40fe214bc5b23ccdb2d]: ' hmac_to_verify
		
		hmac_message_verify;
		
		echo "HMAC_SHA256: "$ANS
		echo ""
		echo $demarcator
		
    elif [ "$main_menu_input" = "13" ];then	
		read -p '[File, e.g. view.txt]: ' TARGET_FILE

		hmac_file;
		
		echo "HMAC_SHA256: "$ANS
		echo ""
		echo $demarcator
		
    elif [ "$main_menu_input" = "14" ];then	
		read -p '[File, e.g. view.txt]: ' TARGET_FILE
		read -p '[hmac_to_verify, e.g. e.g. 1bea96fc65385939e5794d94efcd98555b194d8e3bb282137f3970a2026be795]: ' hmac_to_verify
		hmac_file_verify;
		
		echo "HMAC_SHA256: "$ANS
		echo ""
		echo $demarcator		
			
    elif [ "$main_menu_input" = "15" ];then	
		sign_message_with_rsa_or_dsa_or_ecc;	
    elif [ "$main_menu_input" = "16" ];then	
		verify_message_with_rsa_or_dsa_or_ecc;		
    elif [ "$main_menu_input" = "17" ];then	
		sign_file_with_rsa_or_dsa_or_ecc;
    elif [ "$main_menu_input" = "18" ];then	
		verify_file_with_rsa_or_dsa_or_ecc;	
    elif [ "$main_menu_input" = "19" ];then		
		read -p '[Message in text]: ' message_input
		echo $message_input
		sign_message_with_cert_rsa_or_dsa_or_ecc;
		
    elif [ "$main_menu_input" = "20" ];then	
		read -p '[Message in text]: ' message_input
		echo $message_input
		verify_message_with_cert_rsa_or_dsa_or_ecc;
		
    elif [ "$main_menu_input" = "21" ];then	
		sign_file_with_rsa_or_dsa_or_ecc_with_cert;	
    elif [ "$main_menu_input" = "22" ];then	
		verify_file_with_rsa_or_dsa_or_ecc_with_cert;
		
    elif [ "$main_menu_input" = "23" ];then	
		read -p '[Message in text]: ' message_input
		# echo $message_input
		hash_message;
		echo "hash ("$hash_algo"): "$ANS
    elif [ "$main_menu_input" = "24" ];then	
		hash_file;		
		echo "hash ("$hash_algo"): "$ANS
    elif [ "$main_menu_input" = "25" ];then	
		pack_and_hash_file;	
		echo "hash ("$hash_algo") of "$output_file": "$ANS
		
		echo "to confirm: shasum -a 256 <zip_filename>"
	# UTER-CONSTRUCT ..		
    elif [ "$main_menu_input" = "26" ];then	
		reason="UTER-CONSTRUCT ..."
		block_function_from_proceding;
		built_in_self_test;
		
    elif [ "$main_menu_input" = "27" ];then				
		# word_test;
		# eval cd ./_ciphering/
		# main_cipher;
		# cipher_text_test;
		# hmac_test;
		# test_hex_to_bin;
		# block_function_from_proceding;
		set_folder_structure;
		
	elif [ "$main_menu_input" = "28" ];then
		protection_agent_confimation_mechanism;
    elif [ "$main_menu_input" = "x" -o "$main_menu_input" = "X" ];then # -o := `or` and `||`
		exit_program;
    else
		default_action;
    fi
}

# This builds the main menu and routs the user to the function selected.
main # This executes the main menu function.

echo ""
: <<'COMMENT_GENERATE_PASS'


COMMENT_GENERATE_PASS
echo ""
