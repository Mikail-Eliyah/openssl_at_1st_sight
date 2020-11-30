#!/bin/bash

function status_last_execution () {
	# example:
	# 	$ echo "hello"; status_last_execution -> "SUCCESS"
	#	$ chmod fff; status_last_execution -> "FAILED"
	if [ "$?" == 0 ]  
	then
		history | tail -n 2	; 
		echo "SUCCESS" ;
	else	
		history | tail -n 2	; 
		echo "FAILED" ;
	fi;	
}

function see_file_with_line_range {
	number_of_inputs=2
	if [ $# -lt $number_of_inputs ]
	then
		clr;
        echo "Usage : $0 see_file_with_line_range $1: (file_name) $2: (line_start) $3: (line_end (optional))"
		return;
	fi
	
	number_of_inputs=3
	if [ $# -lt $number_of_inputs ]
	then
		line_end="$2"
	else
		line_end="$3"
		
		if [ $3 -lt $2 ]
		then
			echo "Line numbers not specified properly."
			echo "$3 must be > $2"
			return
		fi
	fi	
	
	START=$2
	END=$line_end
	for (( i=$START; i<=$END; i++ ))
		do
			printf "$i : " 
			sed $i'!d' $1
		done	
		
	# -- extract lines $START through $END	(no line number printed)
	# sed -n $START","$END" p" $1	
}

function show_file_with_line_numbers () {
	nl -b a "$1";
}

function get_line_from_file () {
	random_number_from_30_to_39=$(shuf -i 30-39 -n 1);
	#echo $random_number_from_30_to_39;
	show_file_with_line_numbers "$1" | GREP_COLOR='01;'$random_number_from_30_to_39 grep -i --color -E "$2" ;
}

function get_env_vars () {
	echo "OSTYPE: " + $OSTYPE ;
	echo "USER: " + $USER ; # login name
	echo "HOME: " + $HOME ; # path name of home dir
	echo "HOST: " + $HOST ; # name of computer 
	echo "Architecture: " + $ARCH ; # architecture of computers processor
	echo "Display: " + $DISPLAY ; # name of computer screen to display X windows
	echo "PRINTER: " + $PRINTER ; # default printer to send print jobs
	echo "PATH: " + $PATH ; # directories shell should search to find a command
	echo "Current dir : " + $CWD ;
	echo "prompt : " + $prompt ; # text string used to prompt for interactive commands shell login shell)
	echo "SHELL: " + $SHELL ;
	echo "Terminal: " + $TERM ;
	echo "displayed more details : use printenv, env or set" # putting commands in `` will execute the commands
}

demarcator='======================================================='
function view_file_as_hex () {
	filename=$1
	xxd $filename
	echo $demarcator
	echo "single hex"
	echo $demarcator
	
	hexdump -C $filename
	echo $demarcator	
}

function view_file_as_binary () {
	filename=$1
	xxd -b $filename
	echo $demarcator
}
