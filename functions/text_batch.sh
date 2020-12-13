
function delete_lines_from_to() {
	from="$1"
	to="$2"
	# delete lines of file
	sed ''$from','$to'd' # file_in > file_out
}

function retain_lines_from_to() {
	from="$1"
	to="$2"
	# retain lines of file
	#statement=sed "''$from','$to'!d'"
	#echo $statement
	#statement="sed ''$from','$to'd' "
	#echo $statement
	#sed ''$from','$to'\!d' # file_in > file_out
	sed "$from,$to!d"
}

function file_text_profiling (){
	file_with_path="$1"
	
	number_of_lines=$(wc -l $file_with_path) #-l, --lines 
	number_of_words=$(wc -w $file_with_path) #-w, --words
	number_of_characters=$(wc -m $file_with_path) #-m, --chars 
	number_of_bytes=$(wc -c $file_with_path) #-c, --bytes 
	
	max_line_length_of_file=$(wc -L $file_with_path)  #-L, --max-line-length 
	
	echo "number_of_lines: " ${number_of_lines%"$file_with_path"}
	echo "number_of_words: " ${number_of_words%"$file_with_path"}
	echo "number_of_characters: " ${number_of_characters%"$file_with_path"}
	echo "max_line_length_of_file: " ${max_line_length_of_file%"$file_with_path"}
}


