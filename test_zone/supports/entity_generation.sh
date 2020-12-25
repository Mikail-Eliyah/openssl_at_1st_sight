#'NON_EXISTENT' # UNPRECEDENTED
#'GENERATION' 
#'INITIATION' # Configuration
#'READY' # ready but un-Activated
#'OPERATIONAL' # Activated and deployed
#'SUSPENSION' 
#'DESTRUCTION'
#'TERMINATION'

declare -a functions_of_service_generation=(
'birth_cert_generation'
'birth_cert_ID_get'
'birth_cert_ID_set'
'birth_cert_display'
)
number_of_functions_for_generation=${#functions_of_service_generation[@]}

path_main=$HOME'/scripts/test_zone/test_data'
birth_cert_ID_with_path=$path_main'/birth_cert_ursa.txt'
tag_ID='ID:'

function birth_cert_generation () {
	introspect_statement="birth_cert_generation"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	if [ -z "$1" ]; then	
		touch $birth_cert_ID_with_path
		update_file_timestamp $birth_cert_ID_with_path
			
		birth_cert_ID_with_path=$path_main'/'$file_renamed
		# update birth_cert_ID_with_path (file_renamed_with_path)
		cp $file_renamed $birth_cert_ID_with_path
		echo "timestamp: " $(get_timestamp) >> $birth_cert_ID_with_path 		
		rm -rf $file_renamed
	fi
}

function birth_cert_ID_get(){
	introspect_statement="birth_cert_ID_get"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	label="[birth_cert_ID_get]"
	print_label;	
	cat $birth_cert_ID_with_path | grep -i $tag_ID --color
}

function birth_cert_ID_set(){
	introspect_statement="birth_cert_ID_set"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	label="[birth_cert_ID_set]"
	print_label;		
	number_of_bytes=22
	
	echo "ID: " $(generate_random_hex $number_of_bytes) >> $birth_cert_ID_with_path 
}

function birth_cert_display(){
	introspect_statement="birth_cert_display"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	label="[birth_cert_display]: $birth_cert_ID_with_path"
	print_label;	
	font_display $(cat $birth_cert_ID_with_path)
}