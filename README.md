# OpenSSL At 1st Sight
<PRE>
1. Check your $HOME path by:
$ echo $HOME

2. Download or add the lib at the path, and include the package there. 

3. Add in .bashrc
source $HOME"/scripts/include.sh"  

4. Live test test-drive, open new terminal and type : live_test_Kharon_support_kit

# source 
# $ ~/.bashrc
# $ chmod +x main.sh

# recommended to have this in .bashrc
source $HOME"/scripts/include.sh"    

alias main="date; now; echo 'Activating [ MAIN ]'; ./main.sh;"
alias py="echo "============================="; date; now; echo "============================="; python"
alias py3="echo "============================="; date; now; echo "============================="; python3"

alias reload_bashrc="dos2unix $HOME/scripts/*.sh; . ~/.bashrc"
# alias reload_bashrc=". ~/.bash_profile" # mac

</PRE>

<b>
$ list_bash_functions_enumerated
</b>
# $ list_bash_functions | grep -v gawk | cat -n

<PRE>
     1  add_character_in_front_of_every_line
     2  add_line_index_to_file
     3  ascii_to_base64
     4  ascii_to_decimal
     5  ascii_to_hex
     6  base64_to_ascii
     7  base64_to_hex
     8  binary_file_to_hex
     9  change_case_to_lower
    10  change_case_to_upper
    11  change_lower_to_upper_case
    12  change_upper_to_lower_case
    13  check_date_expiry
    14  check_date_expiry_via_input_prompt
    15  check_entity_name
    16  check_if_file_exists
    17  check_if_file_exists_halt_and_exit_otherwise
    18  check_if_folder_exists
    19  check_status_codes_net
    20  check_time_diff
    21  check_time_diff_example
    22  cipher_file
    23  cipher_message
    24  cipher_message_in_hex_strings
    25  cipher_then_mac_file
    26  clean_all_openssl_processes
    27  clear_passcode_cache
    28  clr
    29  clr_history
    30  compare_contents
    31  compare_hashes
    32  compute_hash_of_paragraphs
    33  convert_DER_to_PEM
    34  convert_P7B_to_PEM
    35  convert_P7B_to_PFX
    36  convert_PEM_to_CRT
    37  convert_PEM_to_DER
    38  convert_PEM_to_P7B
    39  convert_PEM_to_PKCS_12
    40  convert_PKCS_12_to_PEM
    41  count_parameters
    42  create_and_goto_folder
    43  create_ciphered_passcode
    44  create_file_with_timestamp
    45  create_folder_if_not_exist
    46  create_folders
    47  create_session_folder
    48  decimal_to_ascii
    49  decimal_to_hex
    50  decipher_file
    51  decipher_message
    52  decipher_message_in_hex_strings
    53  decode_case_serial
    54  delete_lines_from_to
    55  derive_key
    56  display_array_elements
    57  display_cert
    58  display_hashes_of_all_files_under_folder
    59  display_key_dsa_for_signing
    60  display_key_ecc_for_signing
    61  display_key_for_authentication
    62  display_key_for_ciphering
    63  display_key_rsa_for_signing
    64  display_partner_key
    65  display_time_elements_from_time_epoch_format
    66  encrypt_then_mac_folder
    67  estimate_file_compression
    68  estimate_passcode_redundancy_characters_with_compression
    69  exit_program_for_menu
    70  extract_even_lines
    71  extract_odd_lines
    72  extract_word_given_index
    73  file_text_profiling
    74  file_to_hex_string_file
    75  fill_data_with_another_array
    76  find_bash_function_in_list
    77  find_file_from_leaf
    78  find_file_given_size
    79  find_file_given_start_path
    80  find_file_given_type
    81  find_lines_containing_str
    82  font_display
    83  generate_N_bytes_random
    84  generate_case_serial
    85  generate_cert_from_cnf_for_signing
    86  generate_cert_from_cnf_for_signing_dsa
    87  generate_cert_from_cnf_for_signing_ecc
    88  generate_cert_from_cnf_for_signing_rsa
    89  generate_key_dsa_for_signing
    90  generate_key_ecc_for_signing
    91  generate_key_for_ciphering
    92  generate_key_for_hmac_sha256
    93  generate_key_rsa_for_ciphering
    94  generate_key_rsa_for_signing
    95  generate_random_base64
    96  generate_random_bytes
    97  generate_random_hex
    98  generate_random_text
    99  get_Nth_element_from_array
   100  get_bash_version
   101  get_cert_expiry_date
   102  get_cert_from_IP_with_port
   103  get_cert_from_dns_name_with_port
   104  get_env_vars
   105  get_file_content_lines_in_array
   106  get_file_name_and_extension
   107  get_file_sha
   108  get_filename_n_extension
   109  get_filename_without_version_tag
   110  get_functions_in_script
   111  get_key_for_authentication
   112  get_key_for_ciphering
   113  get_line_N_from_file
   114  get_line_from_file
   115  get_line_from_to
   116  get_line_with_substring_from_file
   117  get_number_of_lines_in_file
   118  get_path_nodes
   119  get_random_float
   120  get_random_integer
   121  get_time_elapsed
   122  get_time_in_epoch
   123  get_time_left
   124  get_time_parameters_from_time_epoch_format
   125  get_time_profile
   126  get_time_tag
   127  get_timestamp
   128  git_N_status_from_branch
   129  git_apply_patch
   130  git_commit_and_push_to_main
   131  git_config_review
   132  git_conflict_resolution_advisory
   133  git_create_patch
   134  git_display_commit
   135  git_get_github_url
   136  git_latest_status
   137  git_main
   138  git_main_default_action
   139  git_menu
   140  git_name
   141  git_remove_file
   142  git_resynch
   143  git_review_changes
   144  git_review_latest_N_commits
   145  git_search_by_ID
   146  git_show_line_index_by_ID
   147  git_test_connection
   148  git_view_all_bramches
   149  git_which_repo
   150  go_to_another_server
   151  grep_containing
   152  grep_containing_not
   153  grep_ending_with
   154  grep_fields_with_different_start_and_end_labels
   155  grep_fields_with_same_start_and_end_labels
   156  grep_in_file_containing
   157  grep_in_file_containing_not
   158  grep_in_file_ending_with
   159  grep_in_file_starting_with
   160  grep_starting_with
   161  hash_file
   162  hash_message
   163  hex_string_file_to_file
   164  hex_to_ascii
   165  hex_to_base64
   166  hex_to_decimal
   167  hmac_file
   168  hmac_file_verify
   169  hmac_message
   170  hmac_message_verify
   171  import_partner_key
   172  is_cert_expired
   173  list_bash_functions
   174  list_bash_functions_enumerated
   175  live_test_Kharon_support_kit
   176  mac_file_then_decipher
   177  make_passcode
   178  make_passcode_with_N_rounds
   179  now_profile
   180  open_dir_given_path
   181  open_new_window
   182  pack_and_hash_file
   183  pack_n_sha
   184  passcode_change_for_agent
   185  passcode_checkpoint_for_agent
   186  passcode_quality_check
   187  print_label
   188  print_label_with_color
   189  profile_d
   190  query_system_profile
   191  read_array_from_file
   192  refresh_bashrc
   193  remove_1st_N_character_in_front_of_every_line
   194  remove_Nth_element_from_array
   195  remove_character_in_front_of_every_line
   196  remove_multiple_elements_from_array
   197  remove_prefix
   198  remove_spaces
   199  remove_specific_element_from_array
   200  remove_suffix
   201  remove_whitespaces
   202  remove_word_from_string
   203  replace_all_alphabetic
   204  replace_all_alphanumeric
   205  replace_all_control_chars
   206  replace_all_digits
   207  replace_all_lower_case
   208  replace_all_non_alphanumeric
   209  replace_all_non_digits
   210  replace_all_non_space
   211  replace_all_occurrences_case_insensitve_of_str0_with_str1
   212  replace_all_occurrences_of_str0_with_str1
   213  replace_all_space
   214  replace_all_symbols
   215  replace_all_upper_case
   216  replace_back_slash_with_forward_slash
   217  replay_command
   218  retain_lines_from_to
   219  retrieve_ciphered_passcode
   220  retrieve_key_from_key_file
   221  retrieve_passcode
   222  run_01
   223  search_function
   224  see_file_with_line_range
   225  seed_random_with_pid
   226  seek
   227  seek_further
   228  set_entity_id
   229  set_terminal_title
   230  set_time_end
   231  set_time_start
   232  show_file_with_line_numbers
   233  show_latest_command_and_argument_history
   234  show_timestamp
   235  sign_file
   236  sign_file_base64_signature
   237  sign_file_dsa
   238  sign_file_ecc
   239  sign_file_rsa
   240  sign_file_with_cert
   241  sign_file_with_cert_dsa
   242  sign_file_with_cert_ecc
   243  sign_file_with_cert_rsa
   244  sign_message
   245  sign_message_dsa
   246  sign_message_ecc
   247  sign_message_rsa
   248  sign_message_with_cert
   249  sign_message_with_cert_dsa
   250  sign_message_with_cert_ecc
   251  sign_message_with_cert_rsa
   252  sign_with_rsa_pss
   253  sort_files_to_size
   254  sort_list
   255  status_last_execution
   256  string_to_array_with_single_char_delimiters
   257  string_to_array_with_single_pre_fixed_delimiters
   258  string_to_array_with_single_substring_delimiters
   259  update_file_timestamp
   260  verify_file
   261  verify_file_dsa
   262  verify_file_ecc
   263  verify_file_rsa
   264  verify_file_with_cert
   265  verify_file_with_cert_dsa
   266  verify_file_with_cert_ecc
   267  verify_file_with_cert_rsa
   268  verify_message
   269  verify_message_dsa
   270  verify_message_ecc
   271  verify_message_rsa
   272  verify_message_with_cert
   273  verify_message_with_cert_dsa
   274  verify_message_with_cert_ecc
   275  verify_message_with_cert_rsa
   276  verify_signature_base64_signature
   277  verify_with_rsa_pss
   278  view_file_as_binary
   279  view_file_as_hex
   280  where_is_function
   281  word_count_in_str
   282  write_array_to_file
   283  write_ciphered_passcode_to_file
   284  write_passcode_plaintext_to_file
   285  zip_file
   286  zip_folder

</PRE>