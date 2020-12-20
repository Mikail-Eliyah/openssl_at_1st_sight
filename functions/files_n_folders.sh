#!/bin/bash

# goto folder, e.g. goto "C:\Users\x\Felt", double quotes ("") required
alias goto="dir=%1; cd "${dir//\\//}""

## a quick way to get out of current directory ## 
alias ..="cd .." 
alias .2="cd ../../"
alias .3="cd ../../../" 
alias .4="cd ../../../../" 
alias .5="cd ../../../../.."
alias opendir="echo 'Opening current directory...'; explorer ."

function extract_even_lines (){
	file_in="$1"
	file_out="$2"	
	# get even lines
	awk '!(NR%2)' $file_in > $file_out
}

function extract_odd_lines (){
	file_in="$1"
	file_out="$2"	
	# get even lines
	awk '(NR%2)' $file_in > $file_out
}

function find_file_given_start_path(){ 
	read -p "start_path (e.g. ~/utility_git/):" start_path
	read -p "file_name (e.g. *_rsa):" file_name
	start_path=$(eval echo $start_path) # remove quotes
	# find ~/utility_git/ -name $file_name -print
	find $start_path -name $file_name -print
}

function get_file_name_and_extension(){
	# fullfile='C:\Users\x\Desktop\fs.cfg'
	
	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"
	filename="${filename%.*}"

	eval $filename="'$filename'"
	eval $extension="'$extension'"
	echo "$filename|$extension"
}

function create_session_folder { # archive or delete after use (manual for now)
	number_of_inputs=1
	if [ $# -lt $number_of_inputs ]
	then
		session_folder_name=session_$(get_timestamp); 
	else		
		session_folder_name="$1"_$(get_timestamp)
	fi;
	
	echo $session_folder_name" created."
	mkdir $session_folder_name
	cd $session_folder_name	
}

function get_file_type() {  
	# fullfile='C:\Users\x\Desktop\fs.cfg'
	fullfile="$1"
	
	filename=$(basename -- "$fullfile")
	extension="${filename##*.}"

	eval $extension="'$extension'"
	echo $extension
}

function get_file_name() {  
	fullfile="$1"
	
	filename=$(basename -- "$fullfile")
	filename="${filename%.*}"

	eval $filename="'$filename'"
	echo $filename
}

function get_file_path() {  
	fullfile="$1"
	
	filename=$(basename -- "$fullfile")
	file_path=$(remove_suffix $fullfile $filename)
	echo $file_path
}

function add_timestamp_to_file_name {     
	if [ "$1" == "-h" ] # help 
	then
		echo "add_timestamp_to_file_name <file_path>/<file_name>.<file_type>"
	else				# execute
		file_with_path="$1"
		file_path=$(get_file_path $file_with_path)
		file_name=$(get_file_name $file_with_path)
		file_type=$(get_file_type $file_with_path)
	
		file_renamed="$file_path$file_name"_$(get_timestamp)."$file_type"
		echo $file_with_path "is updated as"
		echo $file_renamed
	fi;	
}

function change_file_type {     
	if [ "$1" == "-h" ] # help 
	then
		echo "change_file_type <file_path>/<file_name>.<file_type> <file_type_new>"
	else				# execute
		file_with_path="$1"
		file_path=$(get_file_path $file_with_path)
		file_name=$(get_file_name $file_with_path)
		#file_type=$(get_file_type $file_with_path)
		file_type_new="$2"
	
		file_renamed="$file_path$file_name"."$file_type_new"
		echo $file_with_path "is updated as"
		echo $file_renamed
	fi;	
}


# update_file_timestamp <file> <file_main_name> <file_type>; `remove rm -rf "$1";` for backups (if the time_stamp is the same, the file will be deleted inadvertently just because of the `cp`, hence, the names are checked 1st)
# Usage: to update logs version
# Sample use: update_file_timestamp notes_2017-06-03_1159hr.txt notes txt
function update_file_timestamp {     
	if [ "$1" == "-h" ] # help 
	then
		echo "update_file_timestamp <file_target> <file_name> <file_type>"
	else				# execute
		fullfile=$1
		echo $fullfile
		ret="$(get_file_name_and_extension)"
		IFS="|"
		set -- $ret
		echo "filename : $1"
		echo "extension : $2"
	
		cp $fullfile "$1"_$(get_timestamp)."$2"; 
		rm -rf $fullfile
		file_renamed=$("$1"_$(get_timestamp)."$2")
		echo $fullfile "is updated as"
		echo $file_renamed
	fi;	
}
echo ""
: <<'comment_00'
		if [ "$1" == "$2"_$(get_timestamp)."$3" ]
		then
			echo "The file name remains unchanged.\n"
		else
			cp "$1" "$2"_$(get_timestamp)."$3"; rm -rf "$1";
			echo "$1" "is updated as" "$2"_$(get_timestamp)."$3"
		fi;
comment_00
echo ""	
		
function create_file_with_timestamp { touch "$1"_$(get_timestamp)."$2"; }

function show_file_with_line_numbers () {
	nl -b a "$1";
}

function get_line_from_file () {
	file_with_path="$1"
	line_number="$2"
	
	get_line_from_to $line_number $line_number "$file_with_path";
}

function get_line_with_substring_from_file () {
	#random_number_from_30_to_39=$(shuf -i 30-39 -n 1);
	#echo $random_number_from_30_to_39;
	file_with_path="$1"
	line_number="$2"
	high_light_method=$(shuf -i 1-10 -n 1);
	
	show_file_with_line_numbers "$file_with_path" | GREP_COLOR='01;'$line_number grep -i --color -E "$high_light_method" ;
}

function get_line_from_to () {
	number_of_inputs=3
	if [ $# -lt $number_of_inputs ]
	then
		clr;
        echo "Usage : $0 get_line_from_to $1: (line_start) $2: (line_end) $3: (file) "
		return;
	fi

	filename=$3
	#sed -n "$1, $2p;$2q" $filename | cat --number
	sed -n "$1, $2p;$2q" $filename 
}

function find_file_given_type(){ 
		read -p "file_type (e.g. txt):" file_type

		find . -name "*."$file_type -print
}

function find_file_given_size(){ 
		read -p "file_size_minimal (e.g. 1M for >= 1Mb):" file_size

		find . -size +$file_size -ls
}

function sort_files_to_size(){ 
		
		if [ -z "$1" ]; then
			path_to="."
		else
			path_to="$1"
		fi
		
		du -hsb $path_to/* | sort -h
}

function get_filename_n_extension () {
	# "/home/git_home/walnuss/test_area/trial.zip.enc"
	fullfilename="$1"
	filename=$(basename "$fullfilename")
	extension="${filename##*.}"
	filename="${filename%.*}"

	#if [ -z "$4" ]; then # if the 4th param is not set
	#	echo $0 "$1" "$2" "$3" "$3"
	#fi
	
	echo $filename $extension
}

function get_filename_without_version_tag() {
	if [ "$1" == "-h" ] # help
	then
        echo "get_filename_without_version_tag <filename> <tag>"
	else     	
		# get file name
		filename="$1"
		
		filename_without_tag=$filename
        
		
		# while a '.' exists
		while [[ "$filename_without_tag" == *"."* ]]
		do
		   filename_without_tag=$(get_filename_n_extension $filename_without_tag)
		   
		   # cut character after space
		   filename_without_tag=$(echo $filename_without_tag | cut -f1 -d" ")
		   
		   #echo $filename_without_tag;
		done		
		
		
		echo $filename_without_tag;
	fi;   		
}

function get_functions_in_script(){
	filename_script="$1"
	#function_list=$(cat $filename_script | grep "^function" | sed -e 's/function\(.*\){/\1/')

	#function_list="${function_list//()}"

	# echo $function_list
	# remove()
	# echo $(cat $filename_script | grep "^function" | sed -e 's/function\(.*\){/\1/' |  tr -d '()')
	cat $filename_script | grep "^function" | sed -e 's/function\(.*\){/\1/' |  tr -d '()'
	
	echo ""
	echo "number of functions: "
	cat $filename_script | grep "^function" | sed -e 's/function\(.*\){/\1/' |  wc -l
	
}

function add_line_index_to_file(){
	cat -n $file_in > $file_out
}

function get_number_of_lines_in_file() {
	file_with_path="$1"
	number_of_lines=$(wc -l $file_with_path | cut -d ' ' -f1)
	echo $number_of_lines
}

# ================================================
# recursive delete of .o files
#find . -type f -name '*.o' -delete
#find . -type f -name '*.o' -exec rm {} +
#find . -type f -name '*.sh' -exec file {} +


