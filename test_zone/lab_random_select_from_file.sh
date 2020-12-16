source $HOME"/scripts/include.sh"


function trial_00(){
	number_of_characters=25
	number_of_lines=10	
	
	line_number=$(get_random_integer 1 $number_of_lines)
	echo "line_number: " $line_number
	
	#file_in='./test_data/in_00.txt'
	file_out='./test_data/out_00.txt'
		
	for i in $(seq 1 1 $number_of_lines)
	do 
     # echo "$i"
	 echo "$i: " $(generate_random_text $number_of_characters) >> $file_out
	done
	
	cat $file_out
	
	echo ""
	number_of_lines=$(get_number_of_lines_in_file $file_out)
	
	echo "number_of_lines: " $number_of_lines
	echo ""
	get_line_from_file $file_out $line_number
	rm -rf $file_out
}



# dos2unix ./lab_input_arguments.sh
# main

trial_00
