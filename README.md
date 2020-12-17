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
    83  format_into_bash_comments
    84  format_into_bash_non_comments
    85  generate_N_bytes_random
    86  generate_case_serial
    87  generate_cert_from_cnf_for_signing
    88  generate_cert_from_cnf_for_signing_dsa
    89  generate_cert_from_cnf_for_signing_ecc
    90  generate_cert_from_cnf_for_signing_rsa
    91  generate_key_dsa_for_signing
    92  generate_key_ecc_for_signing
    93  generate_key_for_ciphering
    94  generate_key_for_hmac_sha256
    95  generate_key_rsa_for_ciphering
    96  generate_key_rsa_for_signing
    97  generate_random_base64
    98  generate_random_bytes
    99  generate_random_hex
   100  generate_random_text
   101  get_Nth_element_from_array
   102  get_bash_version
   103  get_cert_expiry_date
   104  get_cert_from_IP_with_port
   105  get_cert_from_dns_name_with_port
   106  get_env_vars
   107  get_file_content_lines_in_array
   108  get_file_name_and_extension
   109  get_file_sha
   110  get_filename_n_extension
   111  get_filename_without_version_tag
   112  get_functions_in_script
   113  get_key_for_authentication
   114  get_key_for_ciphering
   115  get_line_N_from_file
   116  get_line_from_file
   117  get_line_from_to
   118  get_line_with_substring_from_file
   119  get_number_of_lines_in_file
   120  get_path_nodes
   121  get_random_float
   122  get_random_integer
   123  get_time_elapsed
   124  get_time_in_epoch
   125  get_time_left
   126  get_time_parameters_from_time_epoch_format
   127  get_time_profile
   128  get_time_tag
   129  get_timestamp
   130  git_N_status_from_branch
   131  git_apply_patch
   132  git_commit_and_push_to_main
   133  git_config_review
   134  git_conflict_resolution_advisory
   135  git_create_patch
   136  git_display_commit
   137  git_get_github_url
   138  git_latest_status
   139  git_main
   140  git_main_default_action
   141  git_menu
   142  git_name
   143  git_remove_file
   144  git_resynch
   145  git_review_changes
   146  git_review_latest_N_commits
   147  git_search_by_ID
   148  git_show_line_index_by_ID
   149  git_test_connection
   150  git_view_all_bramches
   151  git_which_repo
   152  go_to_another_server
   153  grep_containing
   154  grep_containing_not
   155  grep_ending_with
   156  grep_fields_with_different_start_and_end_labels
   157  grep_fields_with_same_start_and_end_labels
   158  grep_in_file_containing
   159  grep_in_file_containing_not
   160  grep_in_file_ending_with
   161  grep_in_file_starting_with
   162  grep_starting_with
   163  hash_file
   164  hash_message
   165  hex_string_file_to_file
   166  hex_to_ascii
   167  hex_to_base64
   168  hex_to_decimal
   169  hmac_file
   170  hmac_file_verify
   171  hmac_message
   172  hmac_message_verify
   173  import_partner_key
   174  is_cert_expired
   175  list_bash_functions
   176  list_bash_functions_enumerated
   177  live_test_Kharon_support_kit
   178  mac_file_then_decipher
   179  make_passcode
   180  make_passcode_with_N_rounds
   181  now_profile
   182  open_dir_given_path
   183  open_new_window
   184  open_notepad
   185  pack_and_hash_file
   186  pack_n_sha
   187  passcode_change_for_agent
   188  passcode_checkpoint_for_agent
   189  passcode_quality_check
   190  print_label
   191  print_label_with_color
   192  profile_d
   193  query_system_profile
   194  read_array_from_file
   195  refresh_bashrc
   196  remove_1st_N_character_in_front_of_every_line
   197  remove_Nth_element_from_array
   198  remove_character_in_front_of_every_line
   199  remove_multiple_elements_from_array
   200  remove_prefix
   201  remove_spaces
   202  remove_specific_element_from_array
   203  remove_suffix
   204  remove_whitespaces
   205  remove_word_from_string
   206  replace_all_alphabetic
   207  replace_all_alphanumeric
   208  replace_all_control_chars
   209  replace_all_digits
   210  replace_all_lower_case
   211  replace_all_non_alphanumeric
   212  replace_all_non_digits
   213  replace_all_non_space
   214  replace_all_occurrences_case_insensitve_of_str0_with_str1
   215  replace_all_occurrences_of_str0_with_str1
   216  replace_all_space
   217  replace_all_symbols
   218  replace_all_upper_case
   219  replace_back_slash_with_forward_slash
   220  replay_command
   221  retain_lines_from_to
   222  retrieve_ciphered_passcode
   223  retrieve_key_from_key_file
   224  retrieve_passcode
   225  run_01
   226  search_function
   227  see_file_with_line_range
   228  seed_random_with_pid
   229  seek
   230  seek_further
   231  set_entity_id
   232  set_terminal_title
   233  set_time_end
   234  set_time_start
   235  show_file_with_line_numbers
   236  show_latest_command_and_argument_history
   237  show_timestamp
   238  sign_file
   239  sign_file_base64_signature
   240  sign_file_dsa
   241  sign_file_ecc
   242  sign_file_rsa
   243  sign_file_with_cert
   244  sign_file_with_cert_dsa
   245  sign_file_with_cert_ecc
   246  sign_file_with_cert_rsa
   247  sign_message
   248  sign_message_dsa
   249  sign_message_ecc
   250  sign_message_rsa
   251  sign_message_with_cert
   252  sign_message_with_cert_dsa
   253  sign_message_with_cert_ecc
   254  sign_message_with_cert_rsa
   255  sign_with_rsa_pss
   256  sort_files_to_size
   257  sort_list
   258  status_last_execution
   259  string_to_array_with_single_char_delimiters
   260  string_to_array_with_single_pre_fixed_delimiters
   261  string_to_array_with_single_substring_delimiters
   262  update_file_timestamp
   263  verify_file
   264  verify_file_dsa
   265  verify_file_ecc
   266  verify_file_rsa
   267  verify_file_with_cert
   268  verify_file_with_cert_dsa
   269  verify_file_with_cert_ecc
   270  verify_file_with_cert_rsa
   271  verify_message
   272  verify_message_dsa
   273  verify_message_ecc
   274  verify_message_rsa
   275  verify_message_with_cert
   276  verify_message_with_cert_dsa
   277  verify_message_with_cert_ecc
   278  verify_message_with_cert_rsa
   279  verify_signature_base64_signature
   280  verify_with_rsa_pss
   281  view_file_as_binary
   282  view_file_as_hex
   283  where_is_function
   284  word_count_in_str
   285  write_array_to_file
   286  write_ciphered_passcode_to_file
   287  write_passcode_plaintext_to_file
   288  zip_file
   289  zip_folder

</PRE>