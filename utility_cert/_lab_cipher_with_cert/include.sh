#!/bin/sh
# version: 2019-06-27_0914hr_23sec

# include configuration file (containing variables)
dos2unix "./parameters.sh"
source "./parameters.sh"

# dos2unix "../scripts/functions/cipher_utility.sh"
# source "../scripts/functions/cipher_utility.sh" # 

#number_of_levels_up="./"
number_of_levels_up="../"
#dos2unix $number_of_levels_up"functions/*.sh"
#source $number_of_levels_up"functions/*.sh" # 
dos2unix $number_of_levels_up"scripts/functions/folders_and_files.sh"
source $number_of_levels_up"scripts/functions/folders_and_files.sh" # 
dos2unix $number_of_levels_up"scripts/functions/keys.sh"
source $number_of_levels_up"scripts/functions/keys.sh"
dos2unix $number_of_levels_up"scripts/functions/identity.sh"
source $number_of_levels_up"scripts/functions/identity.sh" #
dos2unix $number_of_levels_up"scripts/functions/display.sh"
source $number_of_levels_up"scripts/functions/display.sh"
dos2unix $number_of_levels_up"scripts/functions/cipher_utility.sh"
source $number_of_levels_up"scripts/functions/cipher_utility.sh"
dos2unix $number_of_levels_up"scripts/functions/mac_utility.sh"
source $number_of_levels_up"scripts/functions/mac_utility.sh"
dos2unix $number_of_levels_up"scripts/functions/hash_utility.sh"
source $number_of_levels_up"scripts/functions/hash_utility.sh"

dos2unix $number_of_levels_up"scripts/functions/signing_utility.sh"
source $number_of_levels_up"scripts/functions/signing_utility.sh"

dos2unix $number_of_levels_up"scripts/functions/passcode_utility.sh"
source $number_of_levels_up"scripts/functions/passcode_utility.sh"


dos2unix $number_of_levels_up"scripts/functions/data_convert.sh"
source $number_of_levels_up"scripts/functions/data_convert.sh"

#dos2unix $number_of_levels_up"_ciphering/main.sh"
#source $number_of_levels_up"_ciphering/main_functions.sh"

#dos2unix $number_of_levels_up"miscellany_tests/test_cases.sh"
#source $number_of_levels_up"miscellany_tests/test_cases.sh"

