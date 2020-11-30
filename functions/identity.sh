

function check_entity_name(){
	echo "please update $ ${!entity_node_name@} at ./cnf/ursa.cnf"
	echo ""
		
	if [ -z "$entity_name" ]; then
		echo "please update $ ${!entity_name@} at ./scripts/parameters.sh"
		exit
	else
		echo $entity_name" is defined at ./scripts/parameters.sh"
	fi
}

function get_path_nodes() {
	current_dir=`pwd`
	node_current=`basename "$current_dir"`
	echo 'node_current= '$node_current
	parentdir="$(dirname "$current_dir")"
	node_1_level_up=`basename "$parentdir"`
	echo 'node_1_level_up= '$node_1_level_up
	parentdir="$(dirname "$parentdir")"
	node_2_levels_up=`basename "$parentdir"`
	echo 'node_2_levels_up= '$node_2_levels_up
	parentdir="$(dirname "$parentdir")"
	zone=`basename "$parentdir"`
	echo 'zone= '$zone

	#entity_node_name=$zone'_'$node_2_levels_up'_'$node_1_level_up'_'$node_current
	#entity_node_name=$zone'.'$node_2_levels_up'.'$node_1_level_up'.'$node_current
	entity_node_name=$node_current'.'$node_1_level_up'.'$node_2_levels_up'.'$zone
	echo 'entity_node_name= '$entity_node_name
}

# result=${PWD##*/} # to assign to a variable 
# printf '%s\n' "${PWD##*/}" # to print to stdout # (consider a directory named -e or -n) 
# printf '%q\n' "${PWD##*/}" # to print to stdout, quoted for use as shell input # ...useful to make hidden characters readable.

function set_entity_id() {
	current_dir=`pwd`
	node_current=`basename "$current_dir"`
	#echo 'node_current= '$node_current
	parentdir="$(dirname "$current_dir")"
	node_1_level_up=`basename "$parentdir"`
	#echo 'node_1_level_up= '$node_1_level_up
	parentdir="$(dirname "$parentdir")"
	node_2_levels_up=`basename "$parentdir"`
	#echo 'node_2_levels_up= '$node_2_levels_up
	parentdir="$(dirname "$parentdir")"
	zone=`basename "$parentdir"`
	#echo 'zone= '$zone

	#entity_node_name=$zone'_'$node_2_levels_up'_'$node_1_level_up'_'$node_current
	#entity_node_name=$zone'.'$node_2_levels_up'.'$node_1_level_up'.'$node_current
	
	# echo 'entity_node_name= '$entity_node_name

	if [ $number_of_levels_up == "../../../../" ]; 
	then
		entity_node_name=$node_current'.'$node_1_level_up'.'$node_2_levels_up'.'$zone
	elif [ $number_of_levels_up == "../../../" ]; 
		then
		entity_node_name=$node_current'.'$node_1_level_up'.'$node_2_levels_up

	elif [ $number_of_levels_up == "../../" ];  
		then
		entity_node_name=$node_current'.'$node_1_level_up
		
	elif [ $number_of_levels_up == "../" ];
		then
		entity_node_name=$node_current
		
	else
		echo 'Options Unavailable.'
	fi

}


