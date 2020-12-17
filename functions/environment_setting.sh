#!/bin/sh

function query_system_profile () {
	uname -a
	whoami
	echo ""
	# check path
	echo "$PATH" # printf "%s\n" "$PATH"
	
	# add line to .bashrc : set path = ($path ~/.../bin)

	# ENVIRONMENT variables are set using setenv, and unset using unsetenv. 
	printenv | less
	# current values of these variables. # SHELL variables are both set and displayed using set . They can be unset by using the unset command.
	set | less
	
}

function live_test_Kharon_support_kit (){
	echo "Kharon_support_kit is live at: "
	get_timestamp;
}

function open_notepad (){
	file_name="$1"
	notepad "$file_name"
	# open -a 'Sublime Text' $HOME/scripts/data/data.txt # for Mac
}


# set path ## please note 'PATH' is CASE sensitivity and must be in UPPERCASE ##
#export PATH=$PATH:/path/to/dir1
#export PATH=$PATH:/path/to/dir1:/path/to/dir2
#export PATH=$PATH:/usr/local/bin
#OR
#PATH=$PATH:/usr/local/bin; export PATH

## please note 'PATH' is CASE sensitivity and must be in UPPERCASE ##
#PATH=$PATH:/path/to/dir1; export PATH

#To make changes permanent, add commands described above to the end of ~/.profile file for sh and ksh shell, or ~/.bash_profile file for bash shell:
## BASH SHELL ##
#echo 'export PATH=$PATH:/usr/local/bin'  >> ~/.bash_profile

