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
    24  cipher_message_file_and_hash
    25  cipher_message_in_hex_strings
    26  cipher_then_mac_file
    27  clean_all_openssl_processes
    28  clear_passcode_cache
    29  clr
    30  clr_history
    31  compare_contents
    32  compare_hashes
    33  compute_hash_of_paragraphs
    34  convert_DER_to_PEM
    35  convert_P7B_to_PEM
    36  convert_P7B_to_PFX
    37  convert_PEM_to_CRT
    38  convert_PEM_to_DER
    39  convert_PEM_to_P7B
    40  convert_PEM_to_PKCS_12
    41  convert_PKCS_12_to_PEM
    42  count_parameters
    43  create_and_goto_folder
    44  create_ciphered_passcode
    45  create_file_with_timestamp
    46  create_folder_if_not_exist
    47  create_folders
    48  create_session_folder
    49  decimal_to_ascii
    50  decimal_to_hex
    51  decipher_file
    52  decipher_message
    53  decipher_message_file_and_check_hash
    54  decipher_message_in_hex_strings
    55  decode_case_serial
    56  delete_lines_from_to
    57  derive_key
    58  display_array_elements
    59  display_cert
    60  display_hashes_of_all_files_under_folder
    61  display_key_dsa_for_signing
    62  display_key_ecc_for_signing
    63  display_key_for_authentication
    64  display_key_for_ciphering
    65  display_key_rsa_for_signing
    66  display_partner_key
    67  display_time_elements_from_time_epoch_format
    68  encrypt_then_mac_folder
    69  estimate_file_compression
    70  estimate_passcode_redundancy_characters_with_compression
    71  exit_program_for_menu
    72  extract_even_lines
    73  extract_odd_lines
    74  extract_word_given_index
    75  file_text_profiling
    76  file_to_hex_string_file
    77  fill_data_with_another_array
    78  find_bash_function_in_list
    79  find_file_from_leaf
    80  find_file_given_size
    81  find_file_given_start_path
    82  find_file_given_type
    83  find_lines_containing_str
    84  font_display
    85  format_into_bash_comments
    86  format_into_bash_non_comments
    87  generate_N_bytes_random
    88  generate_case_serial
    89  generate_cert_from_cnf_for_signing
    90  generate_cert_from_cnf_for_signing_dsa
    91  generate_cert_from_cnf_for_signing_ecc
    92  generate_cert_from_cnf_for_signing_rsa
    93  generate_key_dsa_for_signing
    94  generate_key_ecc_for_signing
    95  generate_key_for_ciphering
    96  generate_key_for_hmac_sha256
    97  generate_key_rsa_for_ciphering
    98  generate_key_rsa_for_signing
    99  generate_random_base64
   100  generate_random_bytes
   101  generate_random_hex
   102  generate_random_text
   103  get_Nth_element_from_array
   104  get_bash_version
   105  get_cert_expiry_date
   106  get_cert_from_IP_with_port
   107  get_cert_from_dns_name_with_port
   108  get_env_vars
   109  get_file_content_lines_in_array
   110  get_file_name_and_extension
   111  get_file_sha
   112  get_filename_n_extension
   113  get_filename_without_version_tag
   114  get_functions_in_script
   115  get_key_for_authentication
   116  get_key_for_ciphering
   117  get_line_N_from_file
   118  get_line_from_file
   119  get_line_from_to
   120  get_line_with_substring_from_file
   121  get_number_of_lines_in_file
   122  get_path_nodes
   123  get_random_float
   124  get_random_integer
   125  get_time_elapsed
   126  get_time_in_epoch
   127  get_time_left
   128  get_time_parameters_from_time_epoch_format
   129  get_time_profile
   130  get_time_tag
   131  get_timestamp
   132  git_N_status_from_branch
   133  git_apply_patch
   134  git_commit_and_push_to_main
   135  git_config_review
   136  git_conflict_resolution_advisory
   137  git_create_patch
   138  git_display_commit
   139  git_get_github_url
   140  git_latest_status
   141  git_main
   142  git_main_default_action
   143  git_menu
   144  git_name
   145  git_remove_file
   146  git_resynch
   147  git_review_changes
   148  git_review_latest_N_commits
   149  git_search_by_ID
   150  git_show_line_index_by_ID
   151  git_test_connection
   152  git_view_all_bramches
   153  git_which_repo
   154  go_to_another_server
   155  grep_containing
   156  grep_containing_not
   157  grep_ending_with
   158  grep_fields_with_different_start_and_end_labels
   159  grep_fields_with_same_start_and_end_labels
   160  grep_in_file_containing
   161  grep_in_file_containing_not
   162  grep_in_file_ending_with
   163  grep_in_file_starting_with
   164  grep_starting_with
   165  hash_file
   166  hash_file_give_file_path
   167  hash_message
   168  hex_string_file_to_file
   169  hex_to_ascii
   170  hex_to_base64
   171  hex_to_decimal
   172  hmac_file
   173  hmac_file_verify
   174  hmac_message
   175  hmac_message_verify
   176  import_partner_key
   177  is_cert_expired
   178  list_bash_functions
   179  list_bash_functions_enumerated
   180  live_test_Kharon_support_kit
   181  mac_file_then_decipher
   182  make_passcode
   183  make_passcode_with_N_rounds
   184  now_profile
   185  open_dir_given_path
   186  open_new_window
   187  open_notepad
   188  pack_and_hash_file
   189  pack_n_sha
   190  passcode_change_for_agent
   191  passcode_checkpoint_for_agent
   192  passcode_quality_check
   193  print_label
   194  print_label_with_color
   195  profile_d
   196  query_system_profile
   197  read_array_from_file
   198  refresh_bashrc
   199  remove_1st_N_character_in_front_of_every_line
   200  remove_Nth_element_from_array
   201  remove_character_in_front_of_every_line
   202  remove_multiple_elements_from_array
   203  remove_prefix
   204  remove_spaces
   205  remove_specific_element_from_array
   206  remove_suffix
   207  remove_whitespaces
   208  remove_word_from_string
   209  replace_all_alphabetic
   210  replace_all_alphanumeric
   211  replace_all_control_chars
   212  replace_all_digits
   213  replace_all_lower_case
   214  replace_all_non_alphanumeric
   215  replace_all_non_digits
   216  replace_all_non_space
   217  replace_all_occurrences_case_insensitve_of_str0_with_str1
   218  replace_all_occurrences_of_str0_with_str1
   219  replace_all_space
   220  replace_all_symbols
   221  replace_all_upper_case
   222  replace_back_slash_with_forward_slash
   223  replay_command
   224  retain_lines_from_to
   225  retrieve_ciphered_passcode
   226  retrieve_key_from_key_file
   227  retrieve_passcode
   228  run_01
   229  search_function
   230  see_file_with_line_range
   231  seed_random_with_pid
   232  seek
   233  seek_further
   234  set_entity_id
   235  set_terminal_title
   236  set_time_end
   237  set_time_start
   238  show_file_with_line_numbers
   239  show_latest_command_and_argument_history
   240  show_timestamp
   241  sign_file
   242  sign_file_base64_signature
   243  sign_file_dsa
   244  sign_file_ecc
   245  sign_file_rsa
   246  sign_file_with_cert
   247  sign_file_with_cert_dsa
   248  sign_file_with_cert_ecc
   249  sign_file_with_cert_rsa
   250  sign_message
   251  sign_message_dsa
   252  sign_message_ecc
   253  sign_message_rsa
   254  sign_message_with_cert
   255  sign_message_with_cert_dsa
   256  sign_message_with_cert_ecc
   257  sign_message_with_cert_rsa
   258  sign_with_rsa_pss
   259  sort_files_to_size
   260  sort_list
   261  status_last_execution
   262  string_to_array_with_single_char_delimiters
   263  string_to_array_with_single_pre_fixed_delimiters
   264  string_to_array_with_single_substring_delimiters
   265  update_file_timestamp
   266  verify_file
   267  verify_file_dsa
   268  verify_file_ecc
   269  verify_file_rsa
   270  verify_file_with_cert
   271  verify_file_with_cert_dsa
   272  verify_file_with_cert_ecc
   273  verify_file_with_cert_rsa
   274  verify_message
   275  verify_message_dsa
   276  verify_message_ecc
   277  verify_message_rsa
   278  verify_message_with_cert
   279  verify_message_with_cert_dsa
   280  verify_message_with_cert_ecc
   281  verify_message_with_cert_rsa
   282  verify_signature_base64_signature
   283  verify_with_rsa_pss
   284  view_file_as_binary
   285  view_file_as_hex
   286  where_is_function
   287  word_count_in_str
   288  write_array_to_file
   289  write_ciphered_passcode_to_file
   290  write_passcode_plaintext_to_file
   291  zip_file
   292  zip_folder

</PRE>