#!/bin/sh
# version: 2020-10-31_1300hr_44sec

number_of_levels_up="./"

# include configuration file (containing variables)
#dos2unix "./parameters.sh"
source $HOME"/parameters.sh"

source $HOME"/scripts/functions/cipher_utility.sh"
source $HOME"/scripts/functions/hash_utility.sh"
source $HOME"/scripts/functions/mac_utility.sh"  
source $HOME"/scripts/functions/signing_utility.sh"
source $HOME"/scripts/functions/keys.sh"
source $HOME"/scripts/functions/identity.sh"
source $HOME"/scripts/functions/passcode_utility.sh"
#dos2unix $number_of_levels_up"scripts/functions/passcode_utility.sh"

source $HOME"/scripts/functions/cert_utility.sh"

source $HOME"/scripts/functions/status_codes.sh"
source $HOME"/scripts/functions/text.sh"
source $HOME"/scripts/functions/text_batch.sh"
source $HOME"/scripts/functions/grep_utility.sh"
source $HOME"/scripts/functions/regex_utility.sh"

source $HOME"/scripts/functions/time.sh"

source $HOME"/scripts/functions/serial.sh"
source $HOME"/scripts/functions/view.sh"

source $HOME"/scripts/functions/system.sh"
source $HOME"/scripts/functions/display.sh"

source $HOME"/scripts/functions/terminal_setting.sh"

#dos2unix $number_of_levels_up"scripts/functions/data_convert.sh"
source $HOME"/scripts/functions/data_convert.sh"
source $HOME"/scripts/functions/data_structure_utility.sh"
source $HOME"/scripts/functions/random_naive.sh"

source $HOME"/scripts/functions/files_n_folders.sh"
source $HOME"/scripts/functions/folders_and_files.sh"

#dos2unix $number_of_levels_up"miscellany_tests/test_cases.sh"
#source $number_of_levels_up"miscellany_tests/test_cases.sh"
source $HOME"/scripts/functions/git_utility.sh"
