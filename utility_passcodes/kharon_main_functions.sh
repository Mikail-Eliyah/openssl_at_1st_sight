#!/bin/sh
# version: 2018-04-18_0702hr_35sec

function show_passcode_profiles () {
	hash_algo=sha256;
	number_of_symbols_for_inputs=2;
	status=''
	
	echo "Passcode files: "
	echo "---------------------"	
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec); 
	echo $time_stamp;
	echo '=========== [start] ==========='
	ls -l "../data/"
	echo '============ [end] ============'
	
	read -p "Check passcode of file: [input just file name] " file_passcode
	
	filename="../data/$file_passcode.txt.enc"
	check_if_file_exists_halt_and_exit_otherwise;
	
	if [ "$status" = "true" ]; then 
		#echo "Deciphering ... "
		#echo $status
		decipher_file "../data/$file_passcode.txt.enc" "../data/$file_passcode.txt"
		
		echo ""
		echo "If ciphering fails, please DO NOT press [y]for next option." 
	 
		echo "" 
	
		cat "../data/$file_passcode.txt"
		# rm -rf "../data/$file_passcode.txt"
		
		update_passcode_profiles;
	else 
		read -r -p "Create $file_passcode.txt.enc ? [y/N] " response
		case "$response" in
			[yY][eE][sS]|[yY]) 
			echo "Input new passcode :" 
			
			echo "" > "../data/$file_passcode.txt"
			notepad "../data/$file_passcode.txt"
			echo "" >> "../data/$file_passcode.txt"
			echo "Updated: " $time_stamp >> "../data/$file_passcode.txt"
			
			ANS=$(openssl dgst -$hash_algo "../data/$file_passcode.txt" | awk '{print $2}')
			echo $ANS > "../data/$file_passcode.$hash_algo"
			
			cipher_file "../data/$file_passcode.txt" "../data/$file_passcode.txt.enc"
	
			rm -rf "../data/$file_passcode.txt"
	
			echo "$file_passcode.txt.enc created."
			;;
		*)
			echo "$file_passcode.txt.enc creation aborted."
			;;
		esac
	fi;	
	
	#
	
	echo "Displaying profiles: "
	echo "---------------------"
	
	#cat ../data/data.txt	
	rm -rf ../data/*.txt # no txt file allow
}

function rotate_passcode_profiles(){
	number_of_symbols_for_inputs=2;
	status=''
	
	echo "Passcode files: "
	echo "---------------------"	
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec); 
	echo $time_stamp;
	echo '=========== [start] ==========='
	ls -l "../data/"
	echo '============ [end] ============'
	
	read -p "Check passcode of file: [input just file name] " file_passcode
	
	filename="../data/$file_passcode.txt.enc"
	check_if_file_exists_halt_and_exit_otherwise;
	
	if [ "$status" = "true" ]; then 
		echo "Input old passcode :" 
		decipher_file "../data/$file_passcode.txt.enc" "../data/$file_passcode.txt"
		
		echo "Displaying profiles: "
		echo "---------------------"
		
		echo ""
		echo "If ciphering fails, please DO NOT press [y]for next option." 
	 
		echo "" 
	
		cat "../data/$file_passcode.txt"
		echo "---------------------"
		
		# update_passcode_profiles;
		cipher_file "../data/$file_passcode.txt" "../data/$file_passcode.txt.enc" 
		
		rm -rf "../data/$file_passcode.txt"
	else
		echo ""
    fi	
	
	echo "---------------------"

	rm -rf ../data/*.txt # no txt file allow	
}

function update_passcode_profiles () {
	hash_algo=sha256
	number_of_symbols_for_inputs=1
	read -n $number_of_symbols_for_inputs -p "Update passcode to cipher passcode profiles: [y/n] " change_pass_code
	echo ""
	
	if [ $change_pass_code == 'Y' ] || [ $change_pass_code == 'y' ];then
		cipher_file "../data/$file_passcode.txt" "../data/$file_passcode.txt.enc"
	else
		echo ""
    fi
	
	read -n $number_of_symbols_for_inputs -p "Update passcode data: [y/n] " change_pass_code
	echo ""
	
	if [ $change_pass_code == 'Y' ] || [ $change_pass_code == 'y' ];then
		notepad "../data/$file_passcode.txt"
		echo "" >> "../data/$file_passcode.txt"
		echo "Updated: " $time_stamp >> "../data/$file_passcode.txt"
		
		ANS=$(openssl dgst -$hash_algo "../data/$file_passcode.txt" | awk '{print $2}')
		echo $ANS > "../data/$file_passcode.$hash_algo"
			
		cipher_file "../data/$file_passcode.txt" "../data/$file_passcode.txt.enc"
	else
		echo ""
    fi	
	
	echo "---------------------"
	rm -rf "../data/$file_passcode.txt"
}

function print_menu() {
  echo "1 : show_passcode_profiles"
  echo "2 : rotate_passcode_profiles"
  
  echo "'x' or 'X' to exit the script"
}

function generate_random_bytes (){
	printf "\n"
    # openssl rand -base64 5
	openssl rand -hex 5
}


function exit_program() {
	printf "\n quit.\n"
	echo 'X' : quitprogram
}

function default_action() {
    echo "You have entered an invallid selection!"
    echo "Please try again!"
    echo ""
    echo "Press any key to continue..."
    read -n 1
    clear
	set -u # force it to treat unset variables as an error 
	unset mainmenuinput
	#echo $mainmenuinput 
    main
}