# $ check_time_for_function_to_run 'sleep 5'
# $ check_time_for_function_to_run 'hash_file ./WTG_2D_barcode.png'

function check_time_for_function_to_run(){
	#function_to_run="$1"
	demarcator='=============================='
	set_time_start;
	$1; # eval $function_to_run
	set_time_end;
	
	echo ""
	font_display 'Done: ' 
	label="$1"
	print_label;
	
	get_time_elapsed;
}

function check_time_for_function_to_run_N_rounds (){
	#function_to_run="$1"
	number_of_rounds="$2"
	demarcator='=============================='
	set_time_start;
	
	for i in $(seq 1 1 $number_of_rounds)
	do 
     $1; # eval $function_to_run
	done	
	
	set_time_end;
	
	echo ""
	font_display 'Done: ' 
	label="$1 for $2 rounds"
	print_label;
	
	get_time_elapsed;
}


