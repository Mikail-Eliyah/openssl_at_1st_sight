# source $HOME'/scripts/include.sh'

# ========================================
# entity {ID, state, functions / services}
# ========================================
declare -a states_of_service=(
'NON_EXISTENT' # UNPRECEDENTED
'GENERATION' 
'INITIATION' # Configuration
'READY' # Activated
'OPERATIONAL' # deployed
'SUSPENSION' 
'DESTRUCTION'
'TERMINATION'
)
number_of_states=${#states_of_service[@]}

declare -a functions_of_service=(
'get_all_available_states'
'discover_all_apis'
'verified_registered_apis'
'introspect_all_apis'
'state_check_valid'
'state_get'
'state_set'
'ID_get'
'ID_set'
)
number_of_functions=${#functions_of_service[@]}


state_with_path='./test_data/state_ursa.txt'
ID_with_path='./test_data/ID_ursa.txt'

function get_all_available_states(){
	introspect_statement="get_all_available_states"
	introspect_function;	
	
	echo "number_of_states: " $number_of_states
	label="[all_available_states]"
	print_label;

	for index in $(seq 0 1 $(($number_of_states-1)))
	do 
     echo "$index:   ${states_of_service[$index]}"
	done	
	
	echo ""
}

# query_all_apis
function discover_all_apis(){
	introspect_statement="discover_all_apis"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		

	label="[discover_all_apis]"
	print_label;	
	get_functions_in_script "$0" # ./lab_service_model.sh
	
}

function verified_registered_apis(){
	introspect_statement="verified_registered_apis"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi			
	
	label="[verified_registered_apis]"
	print_label;		
	discover_all_apis;
	introspect_all_apis;
	
	echo ""	
}

function introspect_all_apis(){
	introspect_statement="introspect_all_apis"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		

	label="[introspect_all_apis]"
	print_label;

	for index in $(seq 0 1 $(($number_of_functions-1)))
	do 
     echo "$index:   ${functions_of_service[$index]}"
	 eval "${functions_of_service[$index]}" '--introspect'
	done	
	
	echo ""
	
}

function state_check_valid(){
	introspect_statement="state_check_valid"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi			
	
	state_current=$(echo $(state_get))
	
	if [[ " ${states_of_service[@]} " =~ " ${state_current} " ]]; then
		echo "state [$state_current] valid"
	else
		echo "state [$state_current] invalid"
	fi
}

function state_get(){
	introspect_statement="state_get"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi			
	
	label="[state_get]"
	print_label;	
	cat $state_with_path 
}

function state_set(){
	introspect_statement="state_set"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	echo "$1" > $state_with_path 
}

function ID_get(){
	introspect_statement="ID_get"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	label="[ID_get]"
	print_label;	
	cat $ID_with_path 
}

function ID_set(){
	introspect_statement="ID_set"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi		
	
	number_of_bytes=22
	echo $(generate_random_hex $number_of_bytes) > $ID_with_path 
}

# ====================================================
source $HOME'/scripts/include.sh'
# main
#get_all_available_states;
#discover_all_apis;
verified_registered_apis;
#introspect_all_apis;

ID_set;
ID_get;
ID_set;
ID_get;
#state_set 'NON_EXISTENT'
#state_get
#state_set 'READY'
#state_get
#state_check_valid
#state_set 'invalid ...'
#state_get
#state_check_valid

# is_valid_****
# exist_****

