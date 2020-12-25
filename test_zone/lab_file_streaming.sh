source $HOME'/scripts/include.sh'

# main
path_https_to_file='https://github.com/Mikail-Eliyah/openssl_at_1st_sight/raw/master/test_zone/test_data/in.txt'
# https://github.com/Mikail-Eliyah/essential_keys_to_learning_in_any_language/raw/master/Amalgam%20Korean%202013-02.22.doc

file_stored='./test_data/in_txt_00.txt'
file_hex_converted='./test_data/in_hex.txt'
file_txt_converted='./test_data/in_txt_01.txt'

curl -s -L --insecure $path_https_to_file > $file_stored 

# 
file_to_hex_string_file $file_stored $file_hex_converted
hex_string_file_to_file $file_hex_converted $file_txt_converted
echo ""
		label="[downloaded file]"
		print_label;
cat $file_stored		
echo ""
		label="[file in hex]"
		print_label;
cat $file_hex_converted
echo ""
		label="[file in back in text]"
		print_label;
cat $file_txt_converted
echo ""
font_on_screen_typing_display "done: $(get_timestamp)" 