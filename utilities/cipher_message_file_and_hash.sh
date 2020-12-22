# source $HOME"/scripts/include.sh"

data_home_path=$HOME'/scripts/utilities/data'
file_name_tmp='log.txt'

BLUE_TEXT='\033[0;36m'
NC='\033[0m' # No Color


function cipher_message_file_and_hash () {
	echo "Enter comment / notes (and save, this file will NOT be removed after result output to console) : "
	
	file_renamed_with_path=$(add_timestamp_to_file_name $data_home_path'/'$file_name_tmp)
	echo "Created: " $file_renamed_with_path
	touch $file_renamed_with_path 
	echo $file_renamed_with_path 
	open_notepad 'log.txt'
	
	cp $file_name_tmp $file_renamed_with_path 
	rm -rf $file_name_tmp
	
	hash_result=$(hash_file_give_file_path $file_renamed_with_path) # >> $file_renamed_with_path 
	
	random_select_font;
	# echo ${index_color[$index_color_choice]}
	
	font_display "hash_result: << $hash_result ${NC} >>"
		
	cipher_file  $file_renamed_with_path $file_renamed_with_path'.enc' 
}

function decipher_message_file_and_check_hash () {
	ls $data_home_path
	read -p 'Choose file for deciphering : ' file_ciphered_with_path
	
	file_ciphered_with_path=$data_home_path'/'$file_ciphered_with_path
	
	filename=$file_ciphered_with_path
	check_if_file_exists; # at level_at_here
	
	# echo $status
	if [ $status == "true" ]; then
		file_path=$(get_file_path $file_ciphered_with_path)
		file_name=$(get_file_name $file_ciphered_with_path)
		#file_type=$(get_file_type $file_ciphered_with_path)
		
		file_deciphered_with_path=$file_path'/'"$file_name"_deciphered.txt
		
		decipher_file $file_ciphered_with_path $file_deciphered_with_path 
		
		echo ""
		echo "Deciphered file [" $file_deciphered_with_path "]: "
		cat $file_deciphered_with_path 
		
		echo ""
		hash_result=$(hash_file_give_file_path $file_deciphered_with_path) 

		# echo -e "file hash: ${NC} << ${BLUE_TEXT} $hash_result${NC} >>"
		random_select_font;
		
		font_display "file hash: << $hash_result >>"
		
		return;
	else
		echo $file_ciphered_with_path " does not exist."
	fi;	
	
	
}
