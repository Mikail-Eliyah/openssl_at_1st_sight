# source $HOME'/scripts/include.sh'
source './supports/entity_service_model.sh'
source './supports/entity_generation.sh'

source $HOME'/scripts/include.sh'


function membership_access_test () {
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
	
	domain_0X_CA=$path_main'/domain_0X_CA.txt' 
	
	label="[examining exist_domain_relevant_to_entity]"
	print_label;
	exist_domain_relevant_to_entity $domain_00_CA
	exist_domain_relevant_to_entity $domain_01_CA
	exist_domain_relevant_to_entity $domain_0X_CA
	echo ""
	
	label="[examining is_valid_domain_to_entity]"
	print_label;
	is_valid_domain_to_entity $domain_00_CA
	is_valid_domain_to_entity $domain_01_CA
	is_valid_domain_to_entity $domain_0X_CA
	echo ""	
}

function introspect_test () {
	get_all_available_states;
	discover_all_apis;
	
	verified_registered_apis;
	introspect_all_apis;
}

function ID_test () {
	model_entity_fingerprint_get;
	birth_cert_generation;
	birth_cert_ID_set;
	birth_cert_ID_get;
	birth_cert_display;
}

declare -a states_of_tests=(
'OFF'
'OFF'
'ON'
)

# main
if [ ${states_of_tests[0]} == 'ON' ]; then
	membership_access_test;
fi
# 
if [ ${states_of_tests[1]} == 'ON' ]; then
	introspect_test;
fi
# 
if [ ${states_of_tests[2]} == 'ON' ]; then
	ID_test;
fi


# is_valid_****
# exist_****

