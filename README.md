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
   117  git_search_by_ID
   118  git_show_line_index_by_ID
   119  git_test_connection
   120  git_which_repo
   121  go_to_another_server
   122  grep_fields_with_different_start_and_end_labels
   123  grep_fields_with_same_start_and_end_labels
   124  hash_file
   125  hash_message
   126  hex_string_file_to_file
   127  hex_to_ascii
   128  hex_to_base64
   129  hex_to_decimal
   130  hmac_file
   131  hmac_file_verify
   132  hmac_message
   133  hmac_message_verify
   134  import_partner_key
   135  is_cert_expired
   136  list_bash_functions
   137  mac_file_then_decipher
   138  make_passcode
   139  make_passcode_with_N_rounds
   140  open_dir_given_path
   141  open_new_window
   142  pack_and_hash_file
   143  pack_n_sha
   144  passcode_change_for_agent
   145  passcode_checkpoint_for_agent
   146  passcode_quality_check
   147  print_label
   148  print_label_with_color
   149  profile_d
   150  read_array_from_file
   151  refresh_bashrc
   152  remove_Nth_element_from_array
   153  remove_multiple_elements_from_array
   154  remove_prefix
   155  remove_spaces
   156  remove_specific_element_from_array
   157  remove_suffix
   158  remove_whitespaces
   159  remove_word_from_string
   160  replace_all_alphabetic
   161  replace_all_alphanumeric
   162  replace_all_control_chars
   163  replace_all_digits
   164  replace_all_lower_case
   165  replace_all_non_alphanumeric
   166  replace_all_non_digits
   167  replace_all_non_space
   168  replace_all_occurrences_case_insensitve_of_str0_with_str1
   169  replace_all_occurrences_of_str0_with_str1
   170  replace_all_space
   171  replace_all_symbols
   172  replace_all_upper_case
   173  replace_back_slash_with_forward_slash
   174  replay_command
   175  retain_lines_from_to
   176  retrieve_ciphered_passcode
   177  retrieve_key_from_key_file
   178  retrieve_passcode
   179  run_01
   180  search_function
   181  see_file_with_line_range
   182  seed_random_with_pid
   183  seek
   184  seek_further
   185  set_entity_id
   186  set_terminal_title
   187  set_time_end
   188  set_time_start
   189  show_file_with_line_numbers
   190  show_latest_command_and_argument_history
   191  show_timestamp
   192  sign_file
   193  sign_file_base64_signature
   194  sign_file_dsa
   195  sign_file_ecc
   196  sign_file_rsa
   197  sign_file_with_cert
   198  sign_file_with_cert_dsa
   199  sign_file_with_cert_ecc
   200  sign_file_with_cert_rsa
   201  sign_message
   202  sign_message_dsa
   203  sign_message_ecc
   204  sign_message_rsa
   205  sign_message_with_cert
   206  sign_message_with_cert_dsa
   207  sign_message_with_cert_ecc
   208  sign_message_with_cert_rsa
   209  sign_with_rsa_pss
   210  status_last_execution
   211  string_to_array_with_single_char_delimiters
   212  string_to_array_with_single_pre_fixed_delimiters
   213  update_file_timestamp
   214  verify_file
   215  verify_file_dsa
   216  verify_file_ecc
   217  verify_file_rsa
   218  verify_file_with_cert
   219  verify_file_with_cert_dsa
   220  verify_file_with_cert_ecc
   221  verify_file_with_cert_rsa
   222  verify_message
   223  verify_message_dsa
   224  verify_message_ecc
   225  verify_message_rsa
   226  verify_message_with_cert
   227  verify_message_with_cert_dsa
   228  verify_message_with_cert_ecc
   229  verify_message_with_cert_rsa
   230  verify_signature_base64_signature
   231  verify_with_rsa_pss
   232  view_file_as_binary
   233  view_file_as_hex
   234  where_is_function
   235  write_array_to_file
   236  write_ciphered_passcode_to_file
   237  write_passcode_plaintext_to_file
   238  zip_file

</PRE>