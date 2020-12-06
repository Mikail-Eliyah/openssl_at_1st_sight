#!/bin/bash
source $HOME"/scripts/parameters.sh" 
# function pack_n_sha { get_timestamp ; tar -cvzf "$1"_$time_stamp.tar .; sha256_result=$(openssl dgst -$hash_algo "$1"_$time_stamp.tar); echo $sha256_result; }

function hash_message(){
	if [ "$message_input" == "" ] 
		then
			message_input=$1
	fi
	
	echo $message_input | openssl $hash_algo | awk '{print $2}'
	ANS=$(echo $message_input | openssl $hash_algo | awk '{print $2}')
}

function hash_file(){
	read -p '[file_to_hash]: ' file_to_hash
	filename=$message_store_path$file_to_hash
	check_if_file_exists;
	
	if [ $status == "false" ]; then 
		label="[ "$file_to_hash" does not exist. ]";
		print_label;	
	else
		label="[ "$file_to_hash" exists. ]";
		print_label;
	fi
	
	ANS=$(openssl dgst -$hash_algo $filename | awk '{print $2}')
}

function pack_and_hash_file(){
	read -p '[foldier_to_pack_and_hash, e.g. current folder: '.' or "./messages/"]: ' foldier_to_pack_and_hash
	
	if [ "$foldier_to_pack_and_hash" == "" ] || [ "$foldier_to_pack_and_hash" == "." ] # not specified 
	then	# use current_folder as name
		foldier_to_pack_and_hash='.';
		zip_file_name=${PWD##*/};
	else
		# zip_file_name='';
		read -p '[zip_file_name]: ' zip_file_name
	fi;
	
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ;
	output_file="$message_store_path$zip_file_name"_$time_stamp.zip
	zip -r $output_file $foldier_to_pack_and_hash; 
	
	filename=$output_file
	check_if_file_exists;
	
	if [ $status == "false" ]; then 
		label="[ "$output_file" does not exist. ]";
		print_label;	
	else
		label="[ "$output_file" exists. ]";
		print_label;
	fi
	
	ANS=$(openssl dgst -$hash_algo $output_file | awk '{print $2}');
}

function pack_n_sha { 
	if [ "$1" == "" ] # not specified 
	then	# use current_folder as name
		current_folder_name=${PWD##*/};
	else
		current_folder_name=$1;	
	fi;
	 
	echo $current_folder_name;
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	zip -r "$current_folder_name"_$time_stamp.zip .; 
	# tar -cvzf $(current_folder_name)_$time_stamp.tar .; 
	sha256_result=$(openssl dgst -$hash_algo "$current_folder_name"_$time_stamp.zip); 
	echo $sha256_result; 
}

function get_file_sha { sha256_result=$(openssl dgst -$hash_algo "$1"); echo $sha256_result; }

function display_hashes_of_all_files_under_folder(){
	number_of_inputs=0
	if [ $# -eq $number_of_inputs ]
	then
		read -r -p "path_to_folder_to_sha [e.g. c:/path_to_folder_to_sha/] : "  path_to_folder_to_sha
		find $path_to_folder_to_sha -type f -exec openssl dgst -$hash_algo {} \;
	else
		# hash all files in folder and sub-directories
		find . -type f -exec openssl dgst -$hash_algo {} \; # cd /path/to/working/directory sha256sum <(find . type f -exec sha256sum \; | sort).		
	fi
}

function compute_hash_of_paragraphs () {
	echo "Enter contents into notepad (this will be removed after compute):" 

	tmp_file_for_hash=./scripts/data/tmp.txt
	touch $tmp_file_for_hash
	notepad $tmp_file_for_hash
	
	echo "Displaying profiles: "
	echo "---------------------"
	
	cat $tmp_file_for_hash
	echo ""
	echo "---------------------"
	openssl dgst -sha256 $tmp_file_for_hash

	rm -rf $tmp_file_for_hash
}

function compare_hashes () {
	tmp_file_for_hash_00=./scripts/data/tmp_00.txt
	tmp_file_for_hash_01=./scripts/data/tmp_01.txt
	touch $tmp_file_for_hash_00
	touch $tmp_file_for_hash_01
	
	read -p "Enter hash 00: " hash_00
	read -p "Enter hash 01: " hash_01
	
	echo "$hash_00" > $tmp_file_for_hash_00
	echo "$hash_01" > $tmp_file_for_hash_01
	
	diff $tmp_file_for_hash_00 $tmp_file_for_hash_01 --color=always
	
	echo ""
	rm -rf $tmp_file_for_hash_00 $tmp_file_for_hash_01
}

function compare_contents () {
	tmp_file_for_contents_00=./scripts/data/tmp_file_for_contents_00.txt
	tmp_file_for_contents_01=./scripts/data/tmp_file_for_contents_01.txt
	touch $tmp_file_for_contents_00
	touch $tmp_file_for_contents_01
	
	echo "[Enter contents into notepad (this will be removed after compute)]" 
	echo "Enter contents for content 00:" 
	notepad $tmp_file_for_contents_00
	echo "Enter contents for content 01:" 
	notepad $tmp_file_for_contents_01
	
	diff $tmp_file_for_contents_00 $tmp_file_for_contents_01 --color=always
	
	echo ""
	rm -rf $tmp_file_for_contents_00 $tmp_file_for_contents_01
}
