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
     1  add_line_index_to_file
     2  ascii_to_base64
     3  ascii_to_decimal
     4  ascii_to_hex
     5  base64_to_ascii
     6  base64_to_hex
     7  binary_file_to_hex
     8  change_case_to_lower
     9  change_case_to_upper
    10  change_lower_to_upper_case
    11  change_upper_to_lower_case
    12  check_date_expiry
    13  check_date_expiry_via_input_prompt
    14  check_entity_name
    15  check_if_file_exists
    16  check_if_file_exists_halt_and_exit_otherwise
    17  check_if_folder_exists
    18  check_status_codes_net
    19  check_time_diff
    20  check_time_diff_example
    21  cipher_file
    22  cipher_message
    23  cipher_message_in_hex_strings
    24  cipher_then_mac_file
    25  clean_all_openssl_processes
    26  clear_passcode_cache
    27  clr
    28  clr_history
    29  compare_contents
    30  compare_hashes
    31  compute_hash_of_paragraphs
    32  convert_DER_to_PEM
    33  convert_P7B_to_PEM
    34  convert_P7B_to_PFX
    35  convert_PEM_to_CRT
    36  convert_PEM_to_DER
    37  convert_PEM_to_P7B
    38  convert_PEM_to_PKCS_12
    39  convert_PKCS_12_to_PEM
    40  count_parameters
    41  create_and_goto_folder
    42  create_ciphered_passcode
    43  create_file_with_timestamp
    44  create_folder_if_not_exist
    45  create_folders
    46  create_session_folder
    47  decimal_to_ascii
    48  decimal_to_hex
    49  decipher_file
    50  decipher_message
    51  decipher_message_in_hex_strings
    52  decode_case_serial
    53  delete_lines_from_to
    54  derive_key
    55  display_array_elements
    56  display_cert
    57  display_hashes_of_all_files_under_folder
    58  display_key_dsa_for_signing
    59  display_key_ecc_for_signing
    60  display_key_for_authentication
    61  display_key_for_ciphering
    62  display_key_rsa_for_signing
    63  display_partner_key
    64  display_time_elements_from_time_epoch_format
    65  encrypt_then_mac_folder
    66  estimate_file_compression
    67  estimate_passcode_redundancy_characters_with_compression
    68  exit_program_for_menu
    69  extract_even_lines
    70  extract_odd_lines
    71  extract_word_given_index
    72  file_text_profiling
    73  file_to_hex_string_file
    74  fill_data_with_another_array
    75  find_bash_function_in_list
    76  find_file_from_leaf
    77  find_file_given_size
    78  find_file_given_start_path
    79  find_file_given_type
    80  find_lines_containing_str
    81  font_display
    82  generate_N_bytes_random
    83  generate_case_serial
    84  generate_cert_from_cnf_for_signing
    85  generate_cert_from_cnf_for_signing_dsa
    86  generate_cert_from_cnf_for_signing_ecc
    87  generate_cert_from_cnf_for_signing_rsa
    88  generate_key_dsa_for_signing
    89  generate_key_ecc_for_signing
    90  generate_key_for_ciphering
    91  generate_key_for_hmac_sha256
    92  generate_key_rsa_for_ciphering
    93  generate_key_rsa_for_signing
    94  generate_random_base64
    95  generate_random_bytes
    96  generate_random_hex
    97  generate_random_text
    98  get_Nth_element_from_array
    99  get_bash_version
   100  get_cert_expiry_date
   101  get_cert_from_IP_with_port
   102  get_cert_from_dns_name_with_port
   103  get_env_vars
   104  get_file_content_lines_in_array
   105  get_file_name_and_extension
   106  get_file_sha
   107  get_filename_n_extension
   108  get_filename_without_version_tag
   109  get_functions_in_script
   110  get_key_for_authentication
   111  get_key_for_ciphering
   112  get_line_N_from_file
   113  get_line_from_file
   114  get_line_from_to
   115  get_line_with_substring_from_file
   116  get_number_of_lines_in_file
   117  get_path_nodes
   118  get_random_float
   119  get_random_integer
   120  get_time_elapsed
   121  get_time_in_epoch
   122  get_time_left
   123  get_time_parameters_from_time_epoch_format
   124  get_time_profile
   125  get_time_tag
   126  get_timestamp
   127  git_N_status_from_branch
   128  git_apply_patch
   129  git_commit_and_push_to_main
   130  git_config_review
   131  git_conflict_resolution_advisory
   132  git_create_patch
   133  git_display_commit
   134  git_get_github_url
   135  git_latest_status
   136  git_main
   137  git_main_default_action
   138  git_menu
   139  git_name
   140  git_remove_file
   141  git_resynch
   142  git_review_changes
   143  git_review_latest_N_commits
   144  git_search_by_ID
   145  git_show_line_index_by_ID
   146  git_test_connection
   147  git_view_all_bramches
   148  git_which_repo
   149  go_to_another_server
   150  grep_containing
   151  grep_ending_with
   152  grep_fields_with_different_start_and_end_labels
   153  grep_fields_with_same_start_and_end_labels
   154  grep_in_file_containing
   155  grep_in_file_ending_with
   156  grep_in_file_starting_with
   157  grep_starting_with
   158  hash_file
   159  hash_message
   160  hex_string_file_to_file
   161  hex_to_ascii
   162  hex_to_base64
   163  hex_to_decimal
   164  hmac_file
   165  hmac_file_verify
   166  hmac_message
   167  hmac_message_verify
   168  import_partner_key
   169  is_cert_expired
   170  list_bash_functions
   171  list_bash_functions_enumerated
   172  live_test_Kharon_support_kit
   173  mac_file_then_decipher
   174  make_passcode
   175  make_passcode_with_N_rounds
   176  now_profile
   177  open_dir_given_path
   178  open_new_window
   179  pack_and_hash_file
   180  pack_n_sha
   181  passcode_change_for_agent
   182  passcode_checkpoint_for_agent
   183  passcode_quality_check
   184  print_label
   185  print_label_with_color
   186  profile_d
   187  query_system_profile
   188  read_array_from_file
   189  refresh_bashrc
   190  remove_Nth_element_from_array
   191  remove_multiple_elements_from_array
   192  remove_prefix
   193  remove_spaces
   194  remove_specific_element_from_array
   195  remove_suffix
   196  remove_whitespaces
   197  remove_word_from_string
   198  replace_all_alphabetic
   199  replace_all_alphanumeric
   200  replace_all_control_chars
   201  replace_all_digits
   202  replace_all_lower_case
   203  replace_all_non_alphanumeric
   204  replace_all_non_digits
   205  replace_all_non_space
   206  replace_all_occurrences_case_insensitve_of_str0_with_str1
   207  replace_all_occurrences_of_str0_with_str1
   208  replace_all_space
   209  replace_all_symbols
   210  replace_all_upper_case
   211  replace_back_slash_with_forward_slash
   212  replay_command
   213  retain_lines_from_to
   214  retrieve_ciphered_passcode
   215  retrieve_key_from_key_file
   216  retrieve_passcode
   217  run_01
   218  search_function
   219  see_file_with_line_range
   220  seed_random_with_pid
   221  seek
   222  seek_further
   223  set_entity_id
   224  set_terminal_title
   225  set_time_end
   226  set_time_start
   227  show_file_with_line_numbers
   228  show_latest_command_and_argument_history
   229  show_timestamp
   230  sign_file
   231  sign_file_base64_signature
   232  sign_file_dsa
   233  sign_file_ecc
   234  sign_file_rsa
   235  sign_file_with_cert
   236  sign_file_with_cert_dsa
   237  sign_file_with_cert_ecc
   238  sign_file_with_cert_rsa
   239  sign_message
   240  sign_message_dsa
   241  sign_message_ecc
   242  sign_message_rsa
   243  sign_message_with_cert
   244  sign_message_with_cert_dsa
   245  sign_message_with_cert_ecc
   246  sign_message_with_cert_rsa
   247  sign_with_rsa_pss
   248  sort_files_to_size
   249  sort_list
   250  status_last_execution
   251  string_to_array_with_single_char_delimiters
   252  string_to_array_with_single_pre_fixed_delimiters
   253  string_to_array_with_single_substring_delimiters
   254  update_file_timestamp
   255  verify_file
   256  verify_file_dsa
   257  verify_file_ecc
   258  verify_file_rsa
   259  verify_file_with_cert
   260  verify_file_with_cert_dsa
   261  verify_file_with_cert_ecc
   262  verify_file_with_cert_rsa
   263  verify_message
   264  verify_message_dsa
   265  verify_message_ecc
   266  verify_message_rsa
   267  verify_message_with_cert
   268  verify_message_with_cert_dsa
   269  verify_message_with_cert_ecc
   270  verify_message_with_cert_rsa
   271  verify_signature_base64_signature
   272  verify_with_rsa_pss
   273  view_file_as_binary
   274  view_file_as_hex
   275  where_is_function
   276  word_count_in_str
   277  write_array_to_file
   278  write_ciphered_passcode_to_file
   279  write_passcode_plaintext_to_file
   280  zip_file
   281  zip_folder

</PRE>