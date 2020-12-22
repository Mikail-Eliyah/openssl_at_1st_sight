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
    24  cipher_file
    25  cipher_message
    26  cipher_message_file_and_hash
    27  cipher_message_in_hex_strings
    28  cipher_then_mac_file
    29  clean_all_openssl_processes
    30  clear_passcode_cache
    31  clr
    32  clr_history
    33  compare_contents
    34  compare_hashes
    35  compute_hash_of_paragraphs
    36  convert_DER_to_PEM
    37  convert_P7B_to_PEM
    38  convert_P7B_to_PFX
    39  convert_PEM_to_CRT
    40  convert_PEM_to_DER
    41  convert_PEM_to_P7B
    42  convert_PEM_to_PKCS_12
    43  convert_PKCS_12_to_PEM
    44  count_parameters
    45  create_and_goto_folder
    46  create_ciphered_passcode
    47  create_file_with_timestamp
    48  create_folder_if_not_exist
    49  create_folders
    50  create_session_folder
    51  decimal_to_ascii
    52  decimal_to_hex
    53  decipher_file
    54  decipher_message
    55  decipher_message_file_and_check_hash
    56  decipher_message_in_hex_strings
    57  decode_case_serial
    58  delete_lines_from_to
    59  derive_key
    60  display_array_elements
    61  display_cert
    62  display_certificate
    63  display_hashes_of_all_files_under_folder
    64  display_key_dsa_for_signing
    65  display_key_ecc_for_signing
    66  display_key_for_authentication
    67  display_key_for_ciphering
    68  display_key_profile
    69  display_key_rsa_for_signing
    70  display_partner_key
    71  display_time_elements_from_time_epoch_format
    72  encrypt_then_mac_folder
    73  estimate_file_compression
    74  estimate_passcode_redundancy_characters_with_compression
    75  exit_program_for_menu
    76  extract_even_lines
    77  extract_odd_lines
    78  extract_word_given_index
    79  file_text_profiling
    80  file_to_hex_string_file
    81  fill_data_with_another_array
    82  find_bash_function_in_list
    83  find_file_from_leaf
    84  find_file_given_size
    85  find_file_given_start_path
    86  find_file_given_type
    87  find_lines_containing_str
    88  font_display
    89  format_into_bash_comments
    90  format_into_bash_non_comments
    91  generate_N_bytes_random
    92  generate_case_serial
    93  generate_cert_from_cnf_for_signing
    94  generate_cert_from_cnf_for_signing_dsa
    95  generate_cert_from_cnf_for_signing_ecc
    96  generate_cert_from_cnf_for_signing_rsa
    97  generate_key_dsa_for_signing
    98  generate_key_ecc_for_signing
    99  generate_key_for_ciphering
   100  generate_key_for_hmac_sha256
   101  generate_key_rsa_for_ciphering
   102  generate_key_rsa_for_signing
   103  generate_random_base64
   104  generate_random_bytes
   105  generate_random_hex
   106  generate_random_text
   107  get_Nth_element_from_array
   108  get_bash_version
   109  get_cert_expiry_date
   110  get_cert_from_IP_with_port
   111  get_cert_from_dns_name_with_port
   112  get_env_vars
   113  get_file_content_lines_in_array
   114  get_file_name
   115  get_file_name_and_extension
   116  get_file_path
   117  get_file_sha
   118  get_file_type
   119  get_filename_n_extension
   120  get_filename_without_version_tag
   121  get_functions_in_script
   122  get_key_for_authentication
   123  get_key_for_ciphering
   124  get_line_N_from_file
   125  get_line_from_file
   126  get_line_from_to
   127  get_line_with_substring_from_file
   128  get_number_of_lines_in_file
   129  get_path_nodes
   130  get_random_float
   131  get_random_integer
   132  get_time_elapsed
   133  get_time_in_epoch
   134  get_time_left
   135  get_time_parameters_from_time_epoch_format
   136  get_time_profile
   137  get_time_tag
   138  get_timestamp
   139  git_N_status_from_branch
   140  git_apply_patch
   141  git_commit_and_push_to_main
   142  git_config_review
   143  git_conflict_resolution_advisory
   144  git_create_patch
   145  git_display_commit
   146  git_get_github_url
   147  git_latest_status
   148  git_main
   149  git_main_default_action
   150  git_menu
   151  git_name
   152  git_remove_file
   153  git_resynch
   154  git_review_changes
   155  git_review_latest_N_commits
   156  git_search_by_ID
   157  git_show_line_index_by_ID
   158  git_test_connection
   159  git_view_all_bramches
   160  git_which_repo
   161  go_to_another_server
   162  grep_containing
   163  grep_containing_not
   164  grep_ending_with
   165  grep_fields_with_different_start_and_end_labels
   166  grep_fields_with_same_start_and_end_labels
   167  grep_in_file_containing
   168  grep_in_file_containing_not
   169  grep_in_file_ending_with
   170  grep_in_file_starting_with
   171  grep_starting_with
   172  hash_file
   173  hash_file_give_file_path
   174  hash_file_with_prompt
   175  hash_message
   176  hex_string_file_to_file
   177  hex_to_ascii
   178  hex_to_base64
   179  hex_to_decimal
   180  hmac_file
   181  hmac_file_verify
   182  hmac_message
   183  hmac_message_verify
   184  import_partner_key
   185  is_cert_expired
   186  list_bash_functions
   187  list_bash_functions_enumerated
   188  live_test_Kharon_support_kit
   189  mac_file_then_decipher
   190  make_passcode
   191  make_passcode_with_N_rounds
   192  now_profile
   193  open_dir_given_path
   194  open_new_window
   195  open_notepad
   196  pack_and_hash_file
   197  pack_n_sha
   198  passcode_change_for_agent
   199  passcode_checkpoint_for_agent
   200  passcode_quality_check
   201  print_label
   202  print_label_with_color
   203  profile_d
   204  query_system_profile
   205  random_select_font
   206  read_array_from_file
   207  refresh_bashrc
   208  remove_1st_N_character_in_front_of_every_line
   209  remove_Nth_element_from_array
   210  remove_character_in_front_of_every_line
   211  remove_multiple_elements_from_array
   212  remove_prefix
   213  remove_spaces
   214  remove_specific_element_from_array
   215  remove_suffix
   216  remove_whitespaces
   217  remove_word_from_string
   218  replace_all_alphabetic
   219  replace_all_alphanumeric
   220  replace_all_control_chars
   221  replace_all_digits
   222  replace_all_lower_case
   223  replace_all_non_alphanumeric
   224  replace_all_non_digits
   225  replace_all_non_space
   226  replace_all_occurrences_case_insensitve_of_str0_with_str1
   227  replace_all_occurrences_of_str0_with_str1
   228  replace_all_space
   229  replace_all_symbols
   230  replace_all_upper_case
   231  replace_back_slash_with_forward_slash
   232  replay_command
   233  retain_lines_from_to
   234  retrieve_ciphered_passcode
   235  retrieve_key_from_key_file
   236  retrieve_passcode
   237  run_01
   238  search_function
   239  see_file_with_line_range
   240  seed_random_with_pid
   241  seek
   242  seek_further
   243  set_entity_id
   244  set_terminal_title
   245  set_time_end
   246  set_time_start
   247  show_file_with_line_numbers
   248  show_latest_command_and_argument_history
   249  show_timestamp
   250  sign_file
   251  sign_file_base64_signature
   252  sign_file_dsa
   253  sign_file_ecc
   254  sign_file_rsa
   255  sign_file_with_cert
   256  sign_file_with_cert_dsa
   257  sign_file_with_cert_ecc
   258  sign_file_with_cert_rsa
   259  sign_message
   260  sign_message_dsa
   261  sign_message_ecc
   262  sign_message_rsa
   263  sign_message_with_cert
   264  sign_message_with_cert_dsa
   265  sign_message_with_cert_ecc
   266  sign_message_with_cert_rsa
   267  sign_with_rsa_pss
   268  sort_files_to_size
   269  sort_list
   270  status_last_execution
   271  string_to_array_with_single_char_delimiters
   272  string_to_array_with_single_pre_fixed_delimiters
   273  string_to_array_with_single_substring_delimiters
   274  test_font_display
   275  update_file_timestamp
   276  verify_file
   277  verify_file_dsa
   278  verify_file_ecc
   279  verify_file_rsa
   280  verify_file_with_cert
   281  verify_file_with_cert_dsa
   282  verify_file_with_cert_ecc
   283  verify_file_with_cert_rsa
   284  verify_message
   285  verify_message_dsa
   286  verify_message_ecc
   287  verify_message_rsa
   288  verify_message_with_cert
   289  verify_message_with_cert_dsa
   290  verify_message_with_cert_ecc
   291  verify_message_with_cert_rsa
   292  verify_signature_base64_signature
   293  verify_with_rsa_pss
   294  view_file_as_binary
   295  view_file_as_hex
   296  where_is_function
   297  word_count_in_str
   298  write_array_to_file
   299  write_ciphered_passcode_to_file
   300  write_passcode_plaintext_to_file
   301  zip_file
   302  zip_folder

</PRE>