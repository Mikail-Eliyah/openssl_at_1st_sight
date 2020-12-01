# OpenSSL At 1st Sight

<PRE>
# source 
# $ ~/.bashrc
# $ chmod +x main.sh

# recommended to have this in .bashrc
source $HOME"/include.sh"

alias main="date; now; echo 'Activating [ MAIN ]'; ./main.sh;"
alias py="echo "============================="; date; now; echo "============================="; python"
alias py3="echo "============================="; date; now; echo "============================="; python3"

alias reload_bashrc="dos2unix ./scripts/*.sh; . ~/.bashrc"
# alias reload_bashrc=". ~/.bash_profile" # mac

alias list_bash_functions="compgen -A function" 


</PRE>

<b>
$ list_bash_functions | delete_lines_from_to 74 79 | cat -n # --number
</b>

<PRE>
     1  ascii_to_base64
     2  ascii_to_decimal
     3  ascii_to_hex
     4  base64_to_ascii
     5  base64_to_hex
     6  change_case_to_lower
     7  change_case_to_upper
     8  check_date_expiry
     9  check_date_expiry_via_input_prompt
    10  check_entity_name
    11  check_if_file_exists
    12  check_if_file_exists_halt_and_exit_otherwise
    13  check_if_folder_exists
    14  check_status_codes_net
    15  check_time_diff_example
    16  cipher_file
    17  cipher_message
    18  cipher_message_in_hex_strings
    19  cipher_then_mac_file
    20  clean_all_openssl_processes
    21  clear_passcode_cache
    22  clr
    23  clr_history
    24  compare_contents
    25  compare_hashes
    26  compute_hash_of_paragraphs
    27  convert_DER_to_PEM
    28  convert_P7B_to_PEM
    29  convert_P7B_to_PFX
    30  convert_PEM_to_CRT
    31  convert_PEM_to_DER
    32  convert_PEM_to_P7B
    33  convert_PEM_to_PKCS_12
    34  convert_PKCS_12_to_PEM
    35  count_parameters
    36  create_and_goto_folder
    37  create_ciphered_passcode
    38  create_file_with_timestamp
    39  create_folder_if_not_exist
    40  create_folders
    41  create_session_folder
    42  decimal_to_ascii
    43  decimal_to_hex
    44  decipher_file
    45  decipher_message
    46  decipher_message_in_hex_strings
    47  decode_case_serial
    48  delete_lines_from_to
    49  derive_key
    50  display_array_elements
    51  display_cert
    52  display_hashes_of_all_files_under_folder
    53  display_key_dsa_for_signing
    54  display_key_ecc_for_signing
    55  display_key_for_authentication
    56  display_key_for_ciphering
    57  display_key_rsa_for_signing
    58  display_partner_key
    59  display_time_elements_from_time_epoch_format
    60  encrypt_then_mac_folder
    61  estimate_file_compression
    62  estimate_passcode_redundancy_characters_with_compression
    63  extract_even_lines
    64  extract_odd_lines
    65  file_to_hex_string_file
    66  fill_data_with_another_array
    67  find_bash_function_in_list
    68  find_file_from_leaf
    69  find_file_given_size
    70  find_file_given_start_path
    71  find_file_given_type
    72  find_lines_containing_str
    73  font_display
    74  generate_N_bytes_random
    75  generate_case_serial
    76  generate_cert_from_cnf_for_signing
    77  generate_cert_from_cnf_for_signing_dsa
    78  generate_cert_from_cnf_for_signing_ecc
    79  generate_cert_from_cnf_for_signing_rsa
    80  generate_key_dsa_for_signing
    81  generate_key_ecc_for_signing
    82  generate_key_for_ciphering
    83  generate_key_for_hmac_sha256
    84  generate_key_rsa_for_ciphering
    85  generate_key_rsa_for_signing
    86  generate_random_base64
    87  generate_random_bytes
    88  generate_random_hex
    89  generate_random_text
    90  get_Nth_element_from_array
    91  get_bash_version
    92  get_cert_expiry_date
    93  get_env_vars
    94  get_file_content_lines_in_array
    95  get_file_name_and_extension
    96  get_file_sha
    97  get_filename_n_extension
    98  get_filename_without_version_tag
    99  get_functions_in_script
   100  get_key_for_authentication
   101  get_key_for_ciphering
   102  get_line_N_from_file
   103  get_line_from_file
   104  get_line_from_to
   105  get_path_nodes
   106  get_random_float
   107  get_random_integer
   108  get_time_elapsed
   109  get_time_in_epoch
   110  get_time_parameters_from_time_epoch_format
   111  get_timestamp
   112  git_apply_patch
   113  git_commit_and_push_to_main
   114  git_create_patch
   115  git_latest_status
   116  git_remove_file
   117  git_resynch
   118  git_search_by_ID
   119  git_show_line_index_by_ID
   120  git_test_connection
   121  git_which_repo
   122  go_to_another_server
   123  grep_fields_with_different_start_and_end_labels
   124  grep_fields_with_same_start_and_end_labels
   125  hash_file
   126  hash_message
   127  hex_string_file_to_file
   128  hex_to_ascii
   129  hex_to_base64
   130  hex_to_decimal
   131  hmac_file
   132  hmac_file_verify
   133  hmac_message
   134  hmac_message_verify
   135  import_partner_key
   136  is_cert_expired
   137  list_bash_functions
   138  mac_file_then_decipher
   139  make_passcode
   140  make_passcode_with_N_rounds
   141  open_dir_given_path
   142  open_new_window
   143  pack_and_hash_file
   144  pack_n_sha
   145  passcode_change_for_agent
   146  passcode_checkpoint_for_agent
   147  passcode_quality_check
   148  print_label
   149  print_label_with_color
   150  profile_d
   151  read_array_from_file
   152  refresh_bashrc
   153  remove_Nth_element_from_array
   154  remove_multiple_elements_from_array
   155  remove_prefix
   156  remove_spaces
   157  remove_specific_element_from_array
   158  remove_suffix
   159  remove_whitespaces
   160  remove_word_from_string
   161  replace_all_alphabetic
   162  replace_all_alphanumeric
   163  replace_all_control_chars
   164  replace_all_digits
   165  replace_all_lower_case
   166  replace_all_non_alphanumeric
   167  replace_all_non_digits
   168  replace_all_non_space
   169  replace_all_occurrences_case_insensitve_of_str0_with_str1
   170  replace_all_occurrences_of_str0_with_str1
   171  replace_all_space
   172  replace_all_symbols
   173  replace_all_upper_case
   174  replace_back_slash_with_forward_slash
   175  replay_command
   176  retain_lines_from_to
   177  retrieve_ciphered_passcode
   178  retrieve_key_from_key_file
   179  retrieve_passcode
   180  run_01
   181  search_function
   182  see_file_with_line_range
   183  seed_random_with_pid
   184  seek
   185  seek_further
   186  set_entity_id
   187  set_terminal_title
   188  set_time_end
   189  set_time_start
   190  show_file_with_line_numbers
   191  show_latest_command_and_argument_history
   192  show_timestamp
   193  sign_file
   194  sign_file_base64_signature
   195  sign_file_dsa
   196  sign_file_ecc
   197  sign_file_rsa
   198  sign_file_with_cert
   199  sign_file_with_cert_dsa
   200  sign_file_with_cert_ecc
   201  sign_file_with_cert_rsa
   202  sign_message
   203  sign_message_dsa
   204  sign_message_ecc
   205  sign_message_rsa
   206  sign_message_with_cert
   207  sign_message_with_cert_dsa
   208  sign_message_with_cert_ecc
   209  sign_message_with_cert_rsa
   210  sign_with_rsa_pss
   211  status_last_execution
   212  string_to_array_with_single_char_delimiters
   213  string_to_array_with_single_pre_fixed_delimiters
   214  string_to_array_with_single_substring_delimiters
   215  update_file_timestamp
   216  verify_file
   217  verify_file_dsa
   218  verify_file_ecc
   219  verify_file_rsa
   220  verify_file_with_cert
   221  verify_file_with_cert_dsa
   222  verify_file_with_cert_ecc
   223  verify_file_with_cert_rsa
   224  verify_message
   225  verify_message_dsa
   226  verify_message_ecc
   227  verify_message_rsa
   228  verify_message_with_cert
   229  verify_message_with_cert_dsa
   230  verify_message_with_cert_ecc
   231  verify_message_with_cert_rsa
   232  verify_signature_base64_signature
   233  verify_with_rsa_pss
   234  view_file_as_binary
   235  view_file_as_hex
   236  where_is_function
   237  write_array_to_file
   238  write_ciphered_passcode_to_file
   239  write_passcode_plaintext_to_file
   240  zip_file
   241  zip_folder

</PRE>