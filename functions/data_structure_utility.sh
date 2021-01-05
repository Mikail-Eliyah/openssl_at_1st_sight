	# globals (as there is no return of arrays)
	declare -a array_elements=() ## declare an array variable

 
#array=("... " "string 2" "...")
 
# array=$(read_list_from_file_into_1_array_element $filename "${array[@]}")

function read_list_from_file_into_1_array_element(){
	filename="$1"
	array_to_load_to=("$@")
	
	IFS=$'\r\n' 
	GLOBIGNORE='*' 
	eval  'array_to_load_to=($(cat '$filename'))' # entire file in 1 array element

   #for i in "${array_to_load_to[@]}";
   #   do
   #       echo "$i"
   #   done	
}


function get_file_content_lines_into_array(){
	IFS=$'\r\n' GLOBIGNORE='*' command eval  'line_contents=($(cat $path_to_file))'

	# echo "${line_contents[5]}"
	echo "${line_contents[@]}"

	for i in "${line_contents[@]}"  ## loop through the above array
	do
	   echo "$i" # or do whatever with individual element of the array
	   
	   # Add new element at the end of the array
	   array_elements[${#array_elements[@]}]=$(echo "$i")	   
	done
}

function display_array_elements(){
	echo "display : display_array_elements"
	for value in "${array_elements[@]}"
	do
		 echo $value
	done
}

function fill_data_with_another_array(){
	unset array_elements
	for value in "${array_from[@]}"
	do
		 array_elements[${#array_elements[@]}]=$value
	done
}

function write_array_to_file(){
	for value in "${array_elements[@]}"
	do
		 echo $value >> $path_to_file
	done
}

function read_array_from_file(){
	get_file_content_lines_into_array;
}

function remove_multiple_elements_from_array(){
	number_of_elements=${#array_elements[@]}
	#echo "number_of_elements: " $number_of_elements
	
	#element_to_remove="$1"
	echo "element_to_remove: " $element_to_remove

	#delete=($1 $2) # e.g.
	for del in ${delete[@]}
	do
	   array_elements=("${array_elements[@]/$del}") #Quotes when working with strings
	done

	# remove gap in array after removal of element
	for i in "${!array_elements[@]}"; do
		if [ "${array_elements[i]}" != '' ]; then
			new_array+=( "${array_elements[i]}" )
		fi
	done
	array_elements=("${new_array[@]}")
	unset new_array	
}

function remove_specific_element_from_array(){
	number_of_elements=${#array_elements[@]}
	#echo "number_of_elements: " $number_of_elements
	
	#element_to_remove="$1"
	echo "element_to_remove: " $element_to_remove
	delete=$element_to_remove
	#echo ${array_elements[@]/$delete}
	# echo ${array_elements[@]/$delete}
	array_elements=( "${array_elements[@]/$delete}" )
	# remove gap in array after removal of element
	for i in "${!array_elements[@]}"; do
		if [ "${array_elements[i]}" != '' ]; then
			new_array+=( "${array_elements[i]}" )
		fi
	done
	array_elements=("${new_array[@]}")
	unset new_array	
}

function get_Nth_element_from_array(){
	#index=''
	Nth_element=${array_elements[$index]}
}

function remove_Nth_element_from_array(){
	get_Nth_element_from_array;
	element_to_remove=$Nth_element
	remove_specific_element_from_array;
}