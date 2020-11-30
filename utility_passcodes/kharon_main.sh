#!/bin/sh
# version: 2018-04-18_0702hr_35sec
dos2unix "./kharon_main_functions.sh"
source "./kharon_main_functions.sh"
dos2unix "../functions/folders_and_files.sh"
source "../functions/folders_and_files.sh"
dos2unix "../functions/cipher_utility.sh"
source "../functions/cipher_utility.sh"
dos2unix "../functions/hash_utility.sh"
source "../functions/hash_utility.sh"


# MAIN
main () {
	print_menu;
	number_of_digits_for_inputs=2
	# read  -n 1 -p "Input Selection:" main_menu_input
	read  -n $number_of_digits_for_inputs -p "Input Selection:" main_menu_input
	echo ""
	
	if [ "$main_menu_input" = "1" ]; then
		show_passcode_profiles;
    elif [ "$main_menu_input" = "2" ]; then
		rotate_passcode_profiles;
    elif [ "$main_menu_input" = "3" ]; then
		NOP;
		
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
