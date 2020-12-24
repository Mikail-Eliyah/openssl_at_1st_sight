# source $HOME'/scripts/include.sh'

# ========================================
# entity {ID, state, functions / services, membership (access)}
# ========================================
declare -a states_of_service=(
'NON_EXISTENT' # UNPRECEDENTED
'GENERATION' 
'INITIATION' # Configuration
'READY' # ready but un-Activated
'OPERATIONAL' # Activated and deployed
'SUSPENSION' 
'DESTRUCTION'
'TERMINATION'
)
number_of_states=${#states_of_service[@]}

declare -a functions_of_service=(
'model_entity_fingerprint_get'
'get_all_available_states'
'discover_all_apis'
'verified_registered_apis'
'introspect_all_apis'

'state_check_valid'
'state_get'
'state_set'
'ID_get'
'ID_set'

'register_for_domain'
'unregister_for_domain'
'is_member_of_domain'
)
number_of_functions=${#functions_of_service[@]}


state_with_path='./test_data/state_ursa.txt'
ID_with_path='./test_data/ID_ursa.txt'

domain_00_CA='./test_data/domain_00_CA.txt' # is member
domain_01_CA='./test_data/domain_01_CA.txt' # is NOT member

##############################
function model_entity_fingerprint_get () {
	introspect_statement="model_entity_fingerprint_get"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	if [ -z "$1" ]; then
		hash_file_given_file_path "$0"
	fi
}

function get_all_available_states(){
	introspect_statement="get_all_available_states"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	if [ -z "$1" ]; then
		echo "number_of_states: " $number_of_states
		label="[all_available_states]"
		print_label;

		for index in $(seq 0 1 $(($number_of_states-1)))
		do 
		 echo "$index:   ${states_of_service[$index]}"
		done	
		
		echo ""
	fi	
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

	unset $1
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

function register_for_domain(){
	introspect_statement="register_for_domain"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	target_domain="$1" # $domain_00_CA or $domain_01_CA
	echo $(model_entity_fingerprint_get) > $target_domain
}

function unregister_for_domain(){
	introspect_statement="unregister_for_domain"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	target_domain="$1" # $domain_00_CA or $domain_01_CA
	> $target_domain # clear file
}

function is_member_of_domain(){
	target_domain="$1" # $domain_00_CA or $domain_01_CA
	
	introspect_statement="is_member_of_domain"
	if [ ! -z "$1" ]; then
		if [ "$1" == '--introspect' ]; then
			echo 'Usage: ' $introspect_statement
			echo $demarcator
			return
		fi			
	fi	
	
	# check membership access 
	membership_of_target_domain=$(cat $target_domain)
	entity_id=$(model_entity_fingerprint_get) 
	
	if [ "$entity_id" == "$membership_of_target_domain" ]; then
		echo "is a member of : " $target_domain
	else
		echo "is not a member of : " $target_domain
	fi	
}

# ====================================================
source $HOME'/scripts/include.sh'
# main
#get_all_available_states;
#discover_all_apis;
model_entity_fingerprint_get;
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

echo ""
echo "Before any registering of membership"
is_member_of_domain $domain_00_CA
is_member_of_domain $domain_01_CA

echo ""
echo "registering membership"
register_for_domain $domain_00_CA
number_of_bytes=20
echo $(generate_random_hex $number_of_bytes) > $domain_01_CA

is_member_of_domain $domain_00_CA
is_member_of_domain $domain_01_CA
echo ""
echo "un-registering membership"
unregister_for_domain $domain_00_CA
is_member_of_domain $domain_00_CA
is_member_of_domain $domain_01_CA
echo ""
echo "re-registering membership"
register_for_domain $domain_00_CA
number_of_bytes=20
echo $(generate_random_hex $number_of_bytes) > $domain_01_CA

is_member_of_domain $domain_00_CA
is_member_of_domain $domain_01_CA
echo ""
# is_valid_****
# exist_****

