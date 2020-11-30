#!/bin/sh
level_at_here='./'
level_1_above='../'
level_2_above='../../'
level_3_above='../../../'
level_4_above='../../../../'
level_5_above='../../../../../'


#$ target_folder='dev'
#$folder_name=$(pwd)/$level_2_above$target_folder
#$ check_if_folder_exists

function find_file_from_leaf() {
	number_of_inputs=1
	if [ $# -lt $number_of_inputs ]
	then
		clr;
        		echo "Usage : $0 find_file_from_root $1: (file) "
		return;
	fi

	filename=$1
	
	check_if_file_exists; # at level_at_here
	
	# echo $status
	if [ $status == "true" ]; then
		echo 'at ' $PWD
		return;
	fi;	
	
	cd $level_1_above
	echo 'searching ' $PWD
	echo ' '
	
	check_if_file_exists; # at level_1_above	
	
	if [ $status == "true" ]; then
		echo 'at ' $PWD
		return;
	fi;		
	
	cd $level_1_above
	echo 'searching ' $PWD
	echo ' '
	
	check_if_file_exists; # at level_2_above	
	
	if [ $status == "true" ]; then
		echo 'at ' $PWD
		return;
	fi;		
	
	cd $level_1_above
	echo 'searching ' $PWD
	echo ' '
	
	check_if_file_exists; # at level_3_above	
	
	if [ $status == "true" ]; then
		echo 'at ' $PWD
		return;
	fi;			
	
	cd ~
		
	echo 'Not found.'
}
 
function check_if_folder_exists() {
	if [ -d $folder_name ]; then 
		echo " "$folder_name" exists"; 
		status="true"
	else 
		echo " "$folder_name" does NOT exists";
		status="false"
		#exit;
	fi;
}
 
#$ folder_name=$(pwd)/$level_1_above$target_foler
# 
#$ cd $folder_name
#-bash: cd: /home/user_x/../dev: No such file or directory
#$ check_if_folder_exists
# /home/user_x/../dev does NOT exists



function check_if_file_exists_halt_and_exit_otherwise() {
	if [ -f $filename ]; then 
		echo " "$filename" exists"; 
		status="true"
	else 
		echo " "$filename" does NOT exists";
		status="false"
		#exit;
	fi;
}

function check_if_file_exists() {
	if [ -f $filename ]; then 
		echo " "$filename" exists"; 
		status="true"
	else 
		echo " "$filename" does NOT exists";
		status="false"
		#exit;
	fi;
}

function create_folder_if_not_exist() {
	folder=$folder_name
	
	if [ -d $folder ]; then 
		echo " "$folder" exists"; 
	else 
		echo "Create "$folder_description": "$folder_name
		mkdir $folder
	fi;
}

function create_folders() {
	folder=$key_store_path
	create_folder_if_not_exist;
	
	folder=$key_store_path
	create_folder_if_not_exist;
	folder=$csr_path
	create_folder_if_not_exist;
	folder=$cnf_path
	create_folder_if_not_exist;
	folder=$certs_path
	create_folder_if_not_exist;
	folder=$message_store_path
	create_folder_if_not_exist;
	
}

function go_to_another_server(){
	echo "Press 1 : RCA"
  	echo "Press 2 : ICA"
  	echo "Press 3 : service_server"

  	number_of_digits_for_inputs=2
	# read  -n 1 -p "Input Selection:" main_menu_input
	read  -n $number_of_digits_for_inputs -p "Input Selection:" _input
	echo ""
	
	if [ "$_input" = "1" ]; then
    	echo 'switching to RCA'
		cd '../0. RCA/'
		pwd
		exec bash
    elif [ "$_input" = "2" ]; then
    	echo 'switching to ICA'
		cd '../1. ICA/'
		pwd
		exec bash
    elif [ "$_input" = "3" ]; then
    	echo 'switching to service_server ...'
		cd ../'2. service_server'/
		pwd
		exec bash
    elif [ "$_input" = "x" -o "$_input" = "X" ];then # -o := `or` and `||`
		exit_program;
    else
		default_action;
    fi

}

function create_and_goto_folder(){
	folder_name=$1
	create_folder_if_not_exist;
	
	cd $folder_name
} 

function zip_folder(){
	if [ "$1" == "" ] # not specified 
	then	# use current_folder as name
		current_folder_name=${PWD##*/};
	else
		current_folder_name=$1;	
	fi;
	
	echo $current_folder_name;
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	zip -r "$current_folder_name"_$time_stamp.zip .; 
}

function zip_file(){
	if [ "$1" == "" ] # not specified 
	then	# use current_folder as name
		echo "Usage: zip_file \$file_name"
		return
	else
		file_name=$1;	
	fi;
	
	echo $current_folder_name;
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec) ; 
	zip "$file_name"_$time_stamp.zip $file_name; 
}

time_stamp=''

function estimate_file_compression(){
	zip_file $file_name
	size_in_bytes_compressed=$(du -sb "$file_name"_$time_stamp.zip |  cut -f1)
	size_in_bytes_uncompressed=$(du -sb $file_name |  cut -f1)
	
	echo "size_in_bytes_uncompressed: " $size_in_bytes_uncompressed " bytes"
	echo "size_in_bytes_compressed: " $size_in_bytes_compressed " bytes"
	
}

