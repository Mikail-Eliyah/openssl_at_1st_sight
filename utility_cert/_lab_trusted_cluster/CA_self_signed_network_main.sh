#!/bin/sh
# version: 2020-10-13_0745hr_39sec

# dos2unix "../scripts/terminal_setting.sh"
# source "../scripts/terminal_setting.sh" # 

# supporting (reference to ./main.sh as the root of start)
#dos2unix "./scripts/usage_CA/CA_self_signed_network_functions.sh"
source "./CA_self_signed_network_functions.sh"

# MAIN
start_CA_self_signed_services () {
	clr;
	echo "=== menu_CA_self_signed_services ==="
	print_menu_CA_self_signed_services;
	number_of_digits_for_inputs=2
	# read  -n 1 -p "Input Selection:" main_menu_input
	read  -n $number_of_digits_for_inputs -p "Input Selection:" main_menu_input
	echo ""
	
	if [ "$main_menu_input" = "1" ]; then
		generate_CA_self_signed_cert;
    elif [ "$main_menu_input" = "2" ]; then
		generate_client_certs;
    elif [ "$main_menu_input" = "3" ]; then
		clean_all_certs_CSR_and_keys;			
    elif [ "$main_menu_input" = "x" -o "$main_menu_input" = "X" ];then # -o := `or` and `||`
		exit_program;
    else
		default_action;
    fi
}

# This builds the main menu and routs the user to the function selected.
# start_CA_self_signed_services # This executes the main menu function.

echo ""
: <<'COMMENT_GENERATE_PASS'


COMMENT_GENERATE_PASS
echo ""

# main
start_CA_self_signed_services;