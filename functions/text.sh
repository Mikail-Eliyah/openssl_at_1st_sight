#!/bin/bash

function remove_whitespaces { 
	var="$1"
	#var="$(echo -e "${var}" | tr -d '[:space:]')" # remove whitespace
	var=$(echo ${var//[[:blank:]]/})
	
	#echo "string length: " ${#var}
	echo $var
}

function remove_spaces { 
	var="$1"
	var="$(echo -e "${var}" | xargs)" # remove remove_spaces
	
	#echo "string length: " ${#var}
	echo $var
}

function seek { 
	if [ "$1" == "" ] # not specified 
	then
		echo 'Search key word required'
		echo "Usage : $0 seek $1"
	else
		GREP_COLORS='ms=01;32' egrep -inr --color=always $1;
	fi;

	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	
	echo $time_stamp; 
}

# $ seek $key_word_00 | seek_further $key_word_01 | seek_further $key_word_02 ...
function seek_further { 
	if [ "$1" == "" ] # not specified 
	then
		echo 'Search key word required'
		echo "Usage : $0 seek $1"
	else
		GREP_COLORS='ms=01;36' egrep -i --color=always $1;
	fi;

	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	
	echo $time_stamp; 
}

function remove_prefix { 
	if [ "$target_str" == "" ] # not specified 
	then
		echo "Usage : remove_prefix $target_str $prefix_to_remove"
		echo "Usage : remove_prefix 'notAfter=Oct  7, 2020  3:32:11 PM GMT' 'notAfter=' ---> 'Oct  7, 2020  3:32:11 PM GMT'"		
	else
		target_str=${target_str#"$prefix_to_remove"} # remove prefix
	fi;
	
	#prefix_to_remove="notAfter="
	#suffix_to_remove="GMT"
	# e.g. target_str='notAfter=Oct  7, 2020  3:32:11 PM GMT'
	
	echo "$target_str" # return string
}

function remove_suffix { 
	if [ "$target_str" == "" ] # not specified 
	then
		echo "Usage : remove_suffix $target_str $prefix_to_remove"
		echo "Usage : remove_suffix 'notAfter=Oct  7, 2020  3:32:11 PM GMT' 'GMT' ---> notAfter=Oct  7, 2020  3:32:11 PM"		
	else
		target_str=${target_str%"$suffix_to_remove"}	# remove suffix
	fi;	
	
	#prefix_to_remove="notAfter="
	#suffix_to_remove="GMT"
	# e.g. target_str='notAfter=Oct  7, 2020  3:32:11 PM GMT'
	
	echo "$target_str" # return string
}

: '
prefix_to_remove="notAfter="
suffix_to_remove="GMT"
target_str="notAfter=Oct  7, 2020  3:32:11 PM GMT"
result=$(remove_prefix)
echo $result
'

function get_line_N_from_file(){
	number_of_inputs=2
	line_number_to_view="$1"
	
	if [ $# -lt $number_of_inputs ]
	then
		echo "Usage: get_line_N_from_file line_number_to_view target_file"
		
		#return 0
	fi
	
	if [ $# -lt $number_of_inputs ]
	then
		read -r -p "target_file [e.g. c:/path_to_folder_to_file/file_name] : "  target_file
		read -r -p "line_number_to_view : "  line_number_to_view		
	else
		target_file="$1"
		line_number_to_view="$2"
	fi
	
	number_of_lines=$(wc -l $target_file | awk '{ print $1 }')
	#echo $number_of_lines
	
	if [ $number_of_lines -lt $line_number_to_view ]
	then
		echo "line_number_to_view > number_of_lines of the file"
	else
		cat $target_file | head -$line_number_to_view | tail -1
	fi
}

function remove_word_from_string (){
	#part_to_remove='FISH'
	# printf '%s\n' "${$target_string//$part_to_remove/}" # 
	target_string=${target_string//$part_to_remove/}
}

# $ echo "asdefwefwgfvw" | change_case_to_upper
function change_case_to_upper (){
	tr '[:lower:]' '[:upper:]'
}

function change_case_to_lower (){
	tr '[:upper:]' '[:lower:]'
}

function string_to_array_with_single_pre_fixed_delimiters (){
	string="$1"
	delimiters=', '
	IFS=$delimiters read -r -a array <<< "$string"
	
	for index in "${!array[@]}"
	do
		echo "$index ${array[index]}"
	done	
	
	# delete and define array elements
	#unset "array[1]"
	#array[42]=Earth	
}

function string_to_array_with_single_char_delimiters (){
	string="$1"
	#delimiters=', '
	delimiters="$2"
	IFS=$delimiters read -r -a array <<< "$string"
	
	for index in "${!array[@]}"
	do
		echo "$index ${array[index]}"
	done	
	
	# delete and define array elements
	#unset "array[1]"
	#array[42]=Earth	
}
