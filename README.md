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

<PRE>
     1  add_character_in_front_of_every_line
     2  add_line_index_to_file
     3  add_timestamp_to_file_name
     4  ascii_to_base64
     5  ascii_to_decimal
     6  ascii_to_hex
     7  base64_to_ascii
     8  base64_to_hex
     9  binary_file_to_hex
    10  change_case_to_lower
    11  change_case_to_upper
    12  change_file_type
    13  change_lower_to_upper_case
    14  change_upper_to_lower_case
    15  check_date_expiry
    16  check_date_expiry_via_input_prompt
    17  check_entity_name
    18  check_if_file_exists
    19  check_if_file_exists_halt_and_exit_otherwise
    20  check_if_folder_exists
    21  check_status_codes_net
    22  check_time_diff
    23  check_time_diff_example
    24  check_time_for_function_to_run
    25  check_time_for_function_to_run_N_rounds
    26  cipher_file
    27  cipher_message
    28  cipher_message_file_and_hash
    29  cipher_message_in_hex_strings
    30  cipher_then_mac_file
    31  clean_all_openssl_processes
    32  clear_passcode_cache
    33  clr
    34  clr_history
    35  compare_contents
    36  compare_hashes
    37  compute_hash_of_paragraphs
    38  convert_DER_to_PEM
    39  convert_P7B_to_PEM
    40  convert_P7B_to_PFX
    41  convert_PEM_to_CRT
    42  convert_PEM_to_DER
    43  convert_PEM_to_P7B
    44  convert_PEM_to_PKCS_12
    45  convert_PKCS_12_to_PEM
    46  count_parameters
    47  create_and_goto_folder
    48  create_ciphered_passcode
    49  create_file_with_timestamp
    50  create_folder_if_not_exist
    51  create_folders
    52  create_session_folder
    53  decimal_to_ascii
    54  decimal_to_hex
    55  decipher_file
    56  decipher_message
    57  decipher_message_file_and_check_hash
    58  decipher_message_in_hex_strings
    59  decode_case_serial
    60  delete_lines_from_to
    61  derive_key
    62  display_array_elements
    63  display_cert
    64  display_certificate
    65  display_hashes_of_all_files_under_folder
    66  display_key_dsa_for_signing
    67  display_key_ecc_for_signing
    68  display_key_for_authentication
    69  display_key_for_ciphering
    70  display_key_profile
    71  display_key_rsa_for_signing
    72  display_partner_key
    73  display_time_elements_from_time_epoch_format
    74  encrypt_then_mac_folder
    75  estimate_file_compression
    76  estimate_passcode_redundancy_characters_with_compression
    77  exit_program_for_menu
    78  extract_even_lines
    79  extract_odd_lines
    80  extract_word_given_index
    81  file_text_profiling
    82  file_to_hex_string_file
    83  file_to_hex_string_file_with_prompt
    84  fill_data_with_another_array
    85  find_bash_function_in_list
    86  find_file_from_leaf
    87  find_file_given_size
    88  find_file_given_start_path
    89  find_file_given_type
    90  find_line_containing_str
    91  find_line_containing_str_in_file
    92  find_lines_containing_str
    93  font_display
    94  font_on_screen_typing_display
    95  format_into_bash_comments
    96  format_into_bash_non_comments
    97  generate_N_bytes_random
    98  generate_case_serial
    99  generate_cert_from_cnf_for_signing
   100  generate_cert_from_cnf_for_signing_dsa
   101  generate_cert_from_cnf_for_signing_ecc
   102  generate_cert_from_cnf_for_signing_rsa
   103  generate_key_dsa_for_signing
   104  generate_key_ecc_for_signing
   105  generate_key_for_ciphering
   106  generate_key_for_hmac_sha256
   107  generate_key_rsa_for_ciphering
   108  generate_key_rsa_for_signing
   109  generate_random_base64
   110  generate_random_bytes
   111  generate_random_hex
   112  generate_random_text
   113  get_Nth_element_from_array
   114  get_bash_version
   115  get_cert_expiry_date
   116  get_cert_from_IP_with_port
   117  get_cert_from_dns_name_with_port
   118  get_env_vars
   119  get_file_content_lines_into_array
   120  get_file_name
   121  get_file_name_and_extension
   122  get_file_path
   123  get_file_sha
   124  get_file_type
   125  get_filename_n_extension
   126  get_filename_without_version_tag
   127  get_functions_in_script
   128  get_key_for_authentication
   129  get_key_for_ciphering
   130  get_line_N_from_file
   131  get_line_from_file
   132  get_line_from_to
   133  get_line_with_substring_from_file
   134  get_number_of_lines_in_file
   135  get_path_nodes
   136  get_random_float
   137  get_random_integer
   138  get_time_elapsed
   139  get_time_in_epoch
   140  get_time_left
   141  get_time_parameters_from_time_epoch_format
   142  get_time_profile
   143  get_time_tag
   144  get_timestamp
   145  git_N_status_from_branch
   146  git_apply_patch
   147  git_commit_and_push_to_main
   148  git_config_review
   149  git_conflict_resolution_advisory
   150  git_create_patch
   151  git_display_commit
   152  git_get_github_url
   153  git_latest_status
   154  git_main
   155  git_main_default_action
   156  git_menu
   157  git_name
   158  git_remove_file
   159  git_resynch
   160  git_review_changes
   161  git_review_latest_N_commits
   162  git_search_by_ID
   163  git_show_line_index_by_ID
   164  git_test_connection
   165  git_view_all_bramches
   166  git_which_repo
   167  go_to_another_server
   168  grep_containing
   169  grep_containing_not
   170  grep_ending_with
   171  grep_fields_with_different_start_and_end_labels
   172  grep_fields_with_different_start_and_end_labels_in_file_retaining_labels
   173  grep_fields_with_different_start_and_end_labels_in_line_and_remove_labels
   174  grep_fields_with_different_start_and_end_labels_in_line_retaining_labels
   175  grep_fields_with_same_start_and_end_labels
   176  grep_in_file_containing
   177  grep_in_file_containing_not
   178  grep_in_file_ending_with
   179  grep_in_file_starting_with
   180  grep_starting_with
   181  hash_file
   182  hash_file_given_file_path
   183  hash_file_with_prompt
   184  hash_message
   185  hex_string_file_to_file
   186  hex_string_file_to_file_with_prompt
   187  hex_to_ascii
   188  hex_to_base64
   189  hex_to_decimal
   190  hmac_file
   191  hmac_file_verify
   192  hmac_message
   193  hmac_message_verify
   194  import_partner_key
   195  introspect_function
   196  is_cert_expired
   197  list_bash_functions
   198  list_bash_functions_enumerated
   199  live_test_Kharon_support_kit
   200  locate_bash_function_in_list
   201  mac_file_then_decipher
   202  make_passcode
   203  make_passcode_with_N_rounds
   204  now_profile
   205  open_dir_given_path
   206  open_new_window
   207  open_notepad
   208  open_notepad_plus
   209  pack_and_hash_file
   210  pack_n_sha
   211  passcode_change_for_agent
   212  passcode_checkpoint_for_agent
   213  passcode_quality_check
   214  print_label
   215  print_label_with_color
   216  profile_d
   217  query_system_profile
   218  random_select_font
   219  read_array_from_file
   220  read_list_from_file_into_1_array_element
   221  refresh_bashrc
   222  remove_1st_N_character_in_front_of_every_line
   223  remove_Nth_element_from_array
   224  remove_after
   225  remove_before
   226  remove_character_in_front_of_every_line
   227  remove_multiple_elements_from_array
   228  remove_prefix
   229  remove_spaces
   230  remove_specific_element_from_array
   231  remove_suffix
   232  remove_whitespaces
   233  remove_word_from_string
   234  replace_all_alphabetic
   235  replace_all_alphanumeric
   236  replace_all_control_chars
   237  replace_all_digits
   238  replace_all_lower_case
   239  replace_all_non_alphanumeric
   240  replace_all_non_digits
   241  replace_all_non_space
   242  replace_all_occurrences_case_insensitve_of_str0_with_str1
   243  replace_all_occurrences_of_str0_with_str1
   244  replace_all_occurrences_of_str0_with_str1_in_file
   245  replace_all_space
   246  replace_all_symbols
   247  replace_all_upper_case
   248  replace_back_slash_with_forward_slash
   249  replay_command
   250  retain_lines_from_to
   251  retrieve_ciphered_passcode
   252  retrieve_key_from_key_file
   253  retrieve_passcode
   254  run_01
   255  search_function
   256  see_file_with_line_range
   257  seed_random_with_pid
   258  seek
   259  seek_further
   260  set_entity_id
   261  set_terminal_title
   262  set_time_end
   263  set_time_start
   264  show_file_with_line_numbers
   265  show_latest_command_and_argument_history
   266  show_timestamp
   267  sign_file
   268  sign_file_base64_signature
   269  sign_file_dsa
   270  sign_file_ecc
   271  sign_file_rsa
   272  sign_file_with_cert
   273  sign_file_with_cert_dsa
   274  sign_file_with_cert_ecc
   275  sign_file_with_cert_rsa
   276  sign_message
   277  sign_message_dsa
   278  sign_message_ecc
   279  sign_message_rsa
   280  sign_message_with_cert
   281  sign_message_with_cert_dsa
   282  sign_message_with_cert_ecc
   283  sign_message_with_cert_rsa
   284  sign_with_rsa_pss
   285  sort_files_to_size
   286  sort_list
   287  status_last_execution
   288  string_to_array_with_single_char_delimiters
   289  string_to_array_with_single_pre_fixed_delimiters
   290  string_to_array_with_single_substring_delimiters
   291  test_font_display
   292  update_file_timestamp
   293  verify_file
   294  verify_file_dsa
   295  verify_file_ecc
   296  verify_file_rsa
   297  verify_file_with_cert
   298  verify_file_with_cert_dsa
   299  verify_file_with_cert_ecc
   300  verify_file_with_cert_rsa
   301  verify_message
   302  verify_message_dsa
   303  verify_message_ecc
   304  verify_message_rsa
   305  verify_message_with_cert
   306  verify_message_with_cert_dsa
   307  verify_message_with_cert_ecc
   308  verify_message_with_cert_rsa
   309  verify_signature_base64_signature
   310  verify_with_rsa_pss
   311  view_file_as_binary
   312  view_file_as_hex
   313  where_is_function
   314  word_count_in_str
   315  write_array_to_file
   316  write_ciphered_passcode_to_file
   317  write_passcode_plaintext_to_file
   318  zip_file
   319  zip_folder

</PRE>