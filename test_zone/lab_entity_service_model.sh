# source $HOME'/scripts/include.sh'
source './supports/entity_service_model.sh'

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
}

function introspect_test () {
	get_all_available_states;
	discover_all_apis;
	
	verified_registered_apis;
	introspect_all_apis;
}

function ID_test () {
	model_entity_fingerprint_get;
}

declare -a states_of_tests=(
'ON'
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

