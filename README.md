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
$ list_bash_functions | delete_lines_from_to 75 80 | cat -n # --number
</b>
# $ list_bash_functions | grep -v gawk | cat -n

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
    65  extract_word_given_index
    66  file_to_hex_string_file
    67  fill_data_with_another_array
    68  find_bash_function_in_list
    69  find_file_from_leaf
    70  find_file_given_size
    71  find_file_given_start_path
    72  find_file_given_type
    73  find_lines_containing_str
    74  font_display
    75  generate_N_bytes_random
    76  generate_case_serial
    77  generate_cert_from_cnf_for_signing
    78  generate_cert_from_cnf_for_signing_dsa
    79  generate_cert_from_cnf_for_signing_ecc
    80  generate_cert_from_cnf_for_signing_rsa
    81  generate_key_dsa_for_signing
    82  generate_key_ecc_for_signing
    83  generate_key_for_ciphering
    84  generate_key_for_hmac_sha256
    85  generate_key_rsa_for_ciphering
    86  generate_key_rsa_for_signing
    87  generate_random_base64
    88  generate_random_bytes
    89  generate_random_hex
    90  generate_random_text
    91  get_Nth_element_from_array
    92  get_bash_version
    93  get_cert_expiry_date
    94  get_cert_from_IP_with_port
    95  get_cert_from_dns_name_with_port
    96  get_env_vars
    97  get_file_content_lines_in_array
    98  get_file_name_and_extension
    99  get_file_sha
   100  get_filename_n_extension
   101  get_filename_without_version_tag
   102  get_functions_in_script
   103  get_key_for_authentication
   104  get_key_for_ciphering
   105  get_line_N_from_file
   106  get_line_from_file
   107  get_line_from_to
   108  get_path_nodes
   109  get_random_float
   110  get_random_integer
   111  get_time_elapsed
   112  get_time_in_epoch
   113  get_time_parameters_from_time_epoch_format
   114  get_timestamp
   115  git_apply_patch
   116  git_commit_and_push_to_main
   117  git_create_patch
   118  git_display_commit
   119  git_get_github_url
   120  git_latest_status
   121  git_name
   122  git_remove_file
   123  git_resynch
   124  git_search_by_ID
   125  git_show_line_index_by_ID
   126  git_test_connection
   127  git_which_repo
   128  go_to_another_server
   129  grep_fields_with_different_start_and_end_labels
   130  grep_fields_with_same_start_and_end_labels
   131  hash_file
   132  hash_message
   133  hex_string_file_to_file
   134  hex_to_ascii
   135  hex_to_base64
   136  hex_to_decimal
   137  hmac_file
   138  hmac_file_verify
   139  hmac_message
   140  hmac_message_verify
   141  import_partner_key
   142  is_cert_expired
   143  list_bash_functions
   144  mac_file_then_decipher
   145  make_passcode
   146  make_passcode_with_N_rounds
   147  open_dir_given_path
   148  open_new_window
   149  pack_and_hash_file
   150  pack_n_sha
   151  passcode_change_for_agent
   152  passcode_checkpoint_for_agent
   153  passcode_quality_check
   154  print_label
   155  print_label_with_color
   156  profile_d
   157  read_array_from_file
   158  refresh_bashrc
   159  remove_Nth_element_from_array
   160  remove_multiple_elements_from_array
   161  remove_prefix
   162  remove_spaces
   163  remove_specific_element_from_array
   164  remove_suffix
   165  remove_whitespaces
   166  remove_word_from_string
   167  replace_all_alphabetic
   168  replace_all_alphanumeric
   169  replace_all_control_chars
   170  replace_all_digits
   171  replace_all_lower_case
   172  replace_all_non_alphanumeric
   173  replace_all_non_digits
   174  replace_all_non_space
   175  replace_all_occurrences_case_insensitve_of_str0_with_str1
   176  replace_all_occurrences_of_str0_with_str1
   177  replace_all_space
   178  replace_all_symbols
   179  replace_all_upper_case
   180  replace_back_slash_with_forward_slash
   181  replay_command
   182  retain_lines_from_to
   183  retrieve_ciphered_passcode
   184  retrieve_key_from_key_file
   185  retrieve_passcode
   186  run_01
   187  search_function
   188  see_file_with_line_range
   189  seed_random_with_pid
   190  seek
   191  seek_further
   192  set_entity_id
   193  set_terminal_title
   194  set_time_end
   195  set_time_start
   196  show_file_with_line_numbers
   197  show_latest_command_and_argument_history
   198  show_timestamp
   199  sign_file
   200  sign_file_base64_signature
   201  sign_file_dsa
   202  sign_file_ecc
   203  sign_file_rsa
   204  sign_file_with_cert
   205  sign_file_with_cert_dsa
   206  sign_file_with_cert_ecc
   207  sign_file_with_cert_rsa
   208  sign_message
   209  sign_message_dsa
   210  sign_message_ecc
   211  sign_message_rsa
   212  sign_message_with_cert
   213  sign_message_with_cert_dsa
   214  sign_message_with_cert_ecc
   215  sign_message_with_cert_rsa
   216  sign_with_rsa_pss
   217  sort_files_to_size
   218  status_last_execution
   219  string_to_array_with_single_char_delimiters
   220  string_to_array_with_single_pre_fixed_delimiters
   221  string_to_array_with_single_substring_delimiters
   222  update_file_timestamp
   223  verify_file
   224  verify_file_dsa
   225  verify_file_ecc
   226  verify_file_rsa
   227  verify_file_with_cert
   228  verify_file_with_cert_dsa
   229  verify_file_with_cert_ecc
   230  verify_file_with_cert_rsa
   231  verify_message
   232  verify_message_dsa
   233  verify_message_ecc
   234  verify_message_rsa
   235  verify_message_with_cert
   236  verify_message_with_cert_dsa
   237  verify_message_with_cert_ecc
   238  verify_message_with_cert_rsa
   239  verify_signature_base64_signature
   240  verify_with_rsa_pss
   241  view_file_as_binary
   242  view_file_as_hex
   243  where_is_function
   244  word_count_in_str
   245  write_array_to_file
   246  write_ciphered_passcode_to_file
   247  write_passcode_plaintext_to_file
   248  zip_file
   249  zip_folder

</PRE>