#!/bin/bash

alias now="date '+%Y-%m(%b).%d(%A)_%Hhr:%Mmin:%Ssec:%Nns'"

function get_timestamp {
	# now=$(date '+%Y-%m(%b).%d(%A)_%Hhr:%Mmin:%Ssec:%Nns')
	#echo $now
	
	time_stamp=$(date +"%Y-%m-%d_%H%Mhr_%S"sec); 
	echo $time_stamp; 
}

# e.g. $ get_time_in_epoch 'Tue, Apr 10, 2020 2:10:31 AM'
function get_time_in_epoch () {
	date_formatted=''
	# date_formatted=$(date) # e.g. Tue, Apr 21, 2020 2:10:31 AM
	if [ "$1" == '' ]
		then
			read -p "date_formatted (e.g. Tue, Apr 21, 2020 2:10:31 AM):" date_formatted
		else
			date_formatted="$1"
			set '' # clear input variable "$1", set "" "", clears or sets "$1" and "$2"
	fi
	
	# echo $date_formatted
	date_in_epoch_format=$(date -d "$date_formatted" +"%s") # date -d "$date_formatted" +"%s"
	echo $date_in_epoch_format
	ANS=$(echo $date_in_epoch_format)
	return $ANS
}

function check_date_expiry_via_input_prompt () {
	# date_formatted=$(date) # e.g. Tue, Apr 21, 2020 2:10:31 AM
	date_formatted=''
	read -p "date_formatted (e.g. Tue, Apr 21, 2020 2:10:31 AM or 06/12/2012 07:21:22):" date_formatted
	date_in_epoch_format=$(date -d "$date_formatted" +"%s") # date -d "$date_formatted" +"%s"
	date_in_epoch_format_00="$(get_time_in_epoch)"
	#get_time_in_epoch;
	#date_in_epoch_format_00=$?
	date_formatted='' 
	
	read -p "date_formatted (e.g. Tue, Apr 22, 2020 2:10:31 AM or 06/31/2012 07:21:22):" date_formatted	# if this date is later, it should be valid, else, expired
	date_in_epoch_format=$(date -d "$date_formatted" +"%s") # date -d "$date_formatted" +"%s"
	date_in_epoch_format_01="$(get_time_in_epoch)"
	#get_time_in_epoch;
	#date_in_epoch_format_01=$?
	
	if [ "$date_in_epoch_format_01" -ge "$date_in_epoch_format_00" ];
	then
		echo "VALID"
	else
		echo "EXPIRED"
	fi

}

function check_date_expiry () {
	# date_formatted=$(date) # e.g. Tue, Apr 21, 2020 2:10:31 AM
	# date_formatted_00=''
	# date_formatted_01=''
	
	date_in_epoch_format=$(date -d "$date_formatted_00" +"%s") # date -d "$date_formatted" +"%s"
	
	date_in_epoch_format_00="$(get_time_in_epoch "$date_formatted_00")"
	#get_time_in_epoch;
	#date_in_epoch_format_00=$?
	date_formatted='' 
	
	date_in_epoch_format=$(date -d "$date_formatted_01" +"%s") # date -d "$date_formatted" +"%s"
	date_in_epoch_format_01="$(get_time_in_epoch "$date_formatted_01")"
	#get_time_in_epoch;
	#date_in_epoch_format_01=$?
	
	if [ "$date_in_epoch_format_01" -ge "$date_in_epoch_format_00" ];
	then
		echo "VALID"
		echo "$(($date_in_epoch_format_01 - $date_in_epoch_format_00)) secs available."
	else
		echo "EXPIRED"
		echo "$(($date_in_epoch_format_01 - $date_in_epoch_format_00)) secs over."
	fi

}

# date --date='06/12/2012 07:21:22' +"%s"
# date -d '06/12/2012 07:21:22' +"%s"
# $ date -d 'Mon, Apr 20, 2020 11:59:31 AM' +"%s"
# 1587409171
# convert number of seconds back to a more readable form

#date_string="22-Sep-2014 10:32:35.012"
#time_int_decimal=$(date -d "$date_string" +'%s.%3N')
#time_formatted=$(date -d @"$time_int_decimal" +'%Y-%m.%d_%H%Mhr%Ss:%3Nms_%A___%p__%X')
#echo “time_formatted: ”’ $time_formatted

function get_time_parameters_from_time_epoch_format() {
	#$ time_in_epoch_format=1268727836
	#$ echo $time_in_epoch_format	
	#$ date -d @"$time_in_epoch_format" +"%d-%m-%Y %T %z" # 16-03-2010 01:23:56 -0700
	time_in_epoch_format=''
	
	if [ "$1" == '' ]
		then
			read -p "time_in_epoch_format (e.g. 1268727836 or 1349361711.169942):" time_in_epoch_format
		else
			time_in_epoch_format=$1
			set '' # clear input variable "$1", set "" "", clears or sets "$1" and "$2"
	fi
	
	# date -d @1349361711.169942 
	date -d @"$time_in_epoch_format" +"%d-%m-%Y %T %z"
	date_in_time_formatted=$(date -d @"$time_in_epoch_format" +"%d-%m-%Y %T %z")
	ANS=$(echo $date_in_time_formatted)
	# return $ANS
}

function display_time_elements_from_time_epoch_format() {
	time_in_epoch_format=''
	
	if [ "$1" == '' ]
		then
			read -p "time_in_epoch_format (e.g. 1268727836 or 1349361711.169942):" time_in_epoch_format
		else
			time_in_epoch_format=$1
			set '' # clear input variable "$1", set "" "", clears or sets "$1" and "$2"
	fi
	
	
	date +"Week number: %V Year: %y"
	# Week number: 33 Year: 10
	date +"Weekday: %a %A"
	# Weekday: Mon Monday
	date +"Month: %b %B"
	# Month: Apr April
	date +"%c"
	# Mon Apr 20 11:30:29 2020
	
	date -d @"$time_in_epoch_format" +"%d-%m-%Y %T %z"
	date_in_time_formatted=$(date -d @"$time_in_epoch_format" +"%d-%m-%Y %T %z")
	ANS=$(echo $date_in_time_formatted)
	echo "$ANS"
}

function set_time_start(){
	time_start_secs=$(date +%s) #e.g. 1602457361
	time_start_milisecs=$(echo $(($(date +%s%N)/1000000)))
	#e.g. 1602457410321
	echo 'time_start_milisecs: ' $time_start_milisecs
	echo 'time_start_secs: ' $time_start_secs
}

function set_time_end(){
	time_end_secs=$(date +%s) #e.g. 1602457361
	time_end_milisecs=$(echo $(($(date +%s%N)/1000000)))
	#e.g. 1602457410321
	echo 'time_end_milisecs: ' $time_end_milisecs
	echo 'time_end_secs: ' $time_end_secs
}

# time elapsed can also be checked by time()
# e.g.
# time openssl enc -aes256 -e -pbkdf2 -iter $number_of_iterations -pass pass:$passcode -in $file_message_unciphered -out $file_message_ciphered
# time echo "$1"  | xxd -r | openssl enc -aes-128-ecb -nopad -k "$2" | xxd -p;
function get_time_elapsed(){
	time_elapsed_secs=$((time_end_secs - time_start_secs))
	time_elapsed_milisecs=$((time_end_milisecs - time_start_milisecs))
	echo 'time_elapsed_milisecs: ' $time_elapsed_milisecs
	echo 'time_elapsed_secs: ' $time_elapsed_secs
	echo 'or'
	time_elapsed_secs_float=$(echo "$time_elapsed_milisecs 1000" | awk '{printf "%.3f \n", $1/$2}')
	echo 'time_elapsed_secs: ' $time_elapsed_secs_float
	
}

function check_time_diff_example() {
	now=$(date +%s)
	echo $now
	read -p "Input time_to_check:" time_to_check
	
	echo "? >="
	if [ $now -ge $time_to_check ];
	then
		echo "VALID"
	else
		echo "EXPIRED"
	fi
 
	echo "? =="
	if [ $now -eq $time_to_check ];
	then
		echo "VALID and EXPIRING"
	else
		echo "UNDETERMINED"
	fi
 
	echo "? <"
	if [ $now -lt $time_to_check ];
	then
		echo "EXPIRED"
	else
		echo "VALID"
	fi
 
	echo "? >"
	if [ $now -gt $time_to_check ];
	then
		echo "VALID"
	else
		echo "EXPIRED"
	fi
	
	echo "? <="
	if [ $now -le $time_to_check ];
	then
		echo "UNDETERMINED"
	else
		echo "EXPIRED"
	fi	
}

function now_profile {
	now;
	date +20"%y"-"%m"."%d"_"%T"hr
	date +"%Y"-"%m"."%d"_"%H%M"hr
	date +"%Y"-"%m"."%d"_"%H%M_%S_%N"hr
	echo ""
	echo "Year: " $(date '+%Y')
	echo "Month: " $(date '+%m     (%b)')
	echo "Day: " $(date	'+%d     (%A)')
	echo "Hour: " $(date	'+%H')
	echo "Minute: " $(date	'+%M')
	echo "Second: " $(date	'+%S')
	echo "Nano-second: " $(date	'+%N')
}

function get_time_tag(){
	grep -o "Day[ ]*[0-9]*[ ]*:[ ]*[\[][0-9]\{4\}-[0-9]\{2\}[.]\{1\}[0-9]\{2\}[]][ ]*[(][ ]*[A-Za-z]\{1,5\}day[ ]*[)]"
# e.g.
#$ echo 'Day   39:      [12.06] (Sunday)    ursa sees the world' | grep -o "Day[ ]*[0-9]\{2\}[ ]*:[ ]*[\[][0-9]\{2\}[.]\{1\}[0-9]\{2\}[]][ ]*[(][ ]*[A-Za-z]\{1,5\}day[ ]*[)]"
#$ echo 'Day   1139:      [1911-01.11] (Sunday)   ursa sees the world' | grep -o "Day[ ]*[0-9]\{1,5\}[ ]*:[ ]*[\[][0-9]\{4\}-[0-9]\{2\}[.]\{1\}[0-9]\{2\}[]][ ]*[(][ ]*[A-Za-z]\{1,5\}day[ ]*[)]"
#$ echo 'Day   1139:      [1911-01.11] (Sunday)   ursa sees the world' | grep -o "Day[ ]*[0-9]*[ ]*:[ ]*[\[][0-9]\{4\}-[0-9]\{2\}[.]\{1\}[0-9]\{2\}[]][ ]*[(][ ]*[A-Za-z]\{1,5\}day[ ]*[)]"

}

: '
$ date -d "Jan  01, 1970  12:00:00 AM GMT" +%s
0
$ date -d @"0" "+%Y-%m-%d_%H%Mhr:%S sec"
1969-12-31_1612hr:00 sec
'
# date -d @Epoch
# date -d @1268727836
# date -d "1970-01-01 1268727836 sec GMT"
# date -d "1974-01-04"
# > Fri Jan  4 00:00:00 EST 1974

# $ date +%s # 1587407433
# $ date -d "1974-01-04" +"%s" # 126507600
# Convert epoch to a date
# $ date -d "UTC 1970-01-01 126507600 secs" # Fri Jan  4 00:00:00 EST 1974
# $ date -d @126507600 # Fri Jan  4 00:00:00 EST 1974
# $ date -d "1974-01-04" +"%A" # Friday

# $ STARTTIME=`date`
# $ echo $STARTTIME # Fri Aug 20 11:46:48 EDT 2010
# $ sleep 5
# $ echo $STARTTIME # Fri Aug 20 11:46:48 EDT 2010

#/*
#%F	full date; same as %Y-%m-%d 
#%s	seconds since 1970-01-01 00:00:00 UTC
#*/

#$ date -d now # Wed Aug 18 16:47:31 EDT 2010
#$ date -d today # Wed Aug 18 16:47:32 EDT 2010
#$ date -d yesterday # Tue Aug 17 16:47:33 EDT 2010
#$ date -d tomorrow # Thu Aug 19 16:46:34 EDT 2010
#$ date -d sunday # Sun Aug 22 00:00:00 EDT 2010
#$ date -d last-sunday # Sun Aug 15 00:00:00 EDT 2010