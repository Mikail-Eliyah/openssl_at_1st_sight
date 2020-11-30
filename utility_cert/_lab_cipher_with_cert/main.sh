#!/bin/sh
# version: 2020-10-10_0612hr_21sec
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
		generate_rsa_pss_keys_for_signing;
		generate_rsa_pss_cert_for_signing;
		
		generate_rsa_oaep_keys_for_ciphering;
		generate_rsa_oaep_cert_for_ciphering;
		
    elif [ "$main_menu_input" = "2" ]; then
		create_signature_file;
    elif [ "$main_menu_input" = "3" ]; then
		create_signature_file_with_cert;
    elif [ "$main_menu_input" = "4" ]; then
		verify_signature_file;
    elif [ "$main_menu_input" = "5" ]; then
		verify_signature_with_cert;
    elif [ "$main_menu_input" = "6" ]; then		
		rsa_oaep_file_cipher;
		#create_rsa_oaep_keys_for_ciphering;
		#rsa_oaep_file_cipher_00;
		#rsa_oaep_file_decipher_00;
		
    elif [ "$main_menu_input" = "7" ]; then	
		rsa_oaep_file_decipher;		
    elif [ "$main_menu_input" = "11" ]; then
		clear_all_credentials;		
 
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
