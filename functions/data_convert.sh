#!/bin/bash

function hex_string_file_to_file(){
	read -p "file in (e.g. 00.txt): " file_in_name
	read -p "file out (e.g. 01.txt): " file_out_name
	cat $file_in_name | xxd -r -p > $file_out_name
}

function file_to_hex_string_file(){ 
	read -p "file in (e.g. data.txt): " file_in_name
	read -p "file out (e.g. 00.txt): " file_out_name
	# file to hex string 
	xxd -p $file_in_name | tr -d '\n' > $file_out_name
}

# hex-dump-of-file-containing-only-the-hex-characters
# xxd -p file
# in a single line:
# xxd -p data.txt | tr -d '\n'
# xxd -p data.txt | xxd -r -p > 00.txt

# $ echo "ab AB i m 010 i" | xxd -pu 
# 61622041422069206d2030313020690a

# $ echo "ab AB i m 010 i" | xxd -u | xxd -r
# ab AB i m 010 i

function ascii_to_hex () {
	#echo "arg1 is: '$1'"
	ANS=$(echo -n "$1" | xxd -p) ; # -n
	echo $ANS;
	return $?;
}

function hex_to_ascii () {
	# echo "arg1 is: '$1'"
	ans=$(echo "$1" | xxd -p -r) ; # -n
	echo $ans;
	#return $?;	# return $ANS as string
}

function ascii_to_base64 () {
	ans=$(openssl enc -base64 <<< "$1");
	echo $ans
	#return $?;
}

function base64_to_ascii () {
	ans=$(openssl enc -base64 -d <<< "$1");
	echo $ans	
	#return $?;
}

function hex_to_base64 () {
	# echo "arg1 is: '$1'"
	ans_00=$(hex_to_ascii "$1") ;
	ans_01=$(ascii_to_base64 "$ans_00") ;
	#return $ans_01;	# return $ANS as string
}

function base64_to_hex () {
	# echo "arg1 is: '$1'"
	#ans_00=$(base64_to_ascii "$1") ;
	#ans_01=$(ascii_to_hex "$ans_00") ;
	#return $ans_01;	# return $ANS as string
	
	if [ "$1" == "" ] # not specified 
	then
		echo 'example: $ base64_to_hex "QWxhZGRpbjpvcGVuIHNlc2FtZQo="'
	else
		base64_str="$1"
		#ans_01=$(echo -n $base64_str | openssl enc -base64 -d | hexdump -v -e '/1 "%02x" ')
		ans_01=$(echo -n $base64_str | base64 -d | od -t x8 -An | tr -d ' ')
	fi;
	
	echo $ans_01
	
	# return $ans_01;
}

function decimal_to_hex(){
	if [ "$1" == "" ] # not specified 
	then
		echo 'example: $ decimal_to_hex "999999"'
	else
		dec_str="$1"
		hex_str=$(printf "%x\n" $dec_str)
	fi;
	
	echo $hex_str	
}

function hex_to_decimal(){
	if [ "$1" == "" ] # not specified 
	then
		echo 'example: $ hex_to_decimal "999999"'
	else
		hex_str="$1"
		dec_str=$(printf "%ld\n" '0x'$hex_str)
	fi;
	
	echo $dec_str	
}

function ascii_to_decimal(){
	if [ "$1" == "" ] # not specified 
	then
		echo 'example: $ ascii_to_decimal "abdY20"'
	else
		ascii_str="$1"
		hex_str=$(ascii_to_hex $ascii_str)
		dec_str=$(hex_to_decimal $hex_str)
	fi;
	
	echo $dec_str	
}

function decimal_to_ascii(){
	if [ "$1" == "" ] # not specified 
	then
		echo 'example: $ decimal_to_ascii "91694388364660"'
	else
		dec_str="$1"
		hex_str=$(decimal_to_hex $dec_str)		
		ascii_str=$(hex_to_ascii $hex_str)
	fi;
	
	echo $ascii_str	
}

echo ""
: <<'NOTE_BLOCK'
#
cat file.dat | xxd -r -p | base64
echo "6F0AD0BFEE7D4B478AFED096E03CD80A" | xxd -r -p | base64


$ openssl rand -hex 2 | xxd -r -p | base64

openssl enc -base64 <<< 'Hello, World!'
openssl enc -base64 -d <<< SGVsbG8sIFdvcmxkIQo=

echo "QWxhZGRpbjpvcGVuIHNlc2FtZQ==" | base64 -D  | od -t x8 -An
41 6c 61 64 64 69 6e 3a 6f 70 65 6e 20 73 65 73 61 6d 65
Aladdin:open sesame
base64_str=’QWxhZGRpbjpvcGVuIHNlc2FtZQo=’
base64_str=’QWxhZGRpbjpvcGVuIHNlc2FtZQ==’
# base64 to hex
echo $base64_str | base64 -D | hexdump -v -e '/1 "%02x" ' 
ANS: 416c616464696e3a6f70656e20736573616d65
# base64 to ascii
echo "QWxhZGRpbjpvcGVuIHNlc2FtZQo=" | base64 -D  # base64 --decod
echo "QWxhZGRpbjpvcGVuIHNlc2FtZQ==" | base64 -D 
ANS: Aladdin:open sesame

# ascii to base64
openssl enc -base64 <<< 'Aladdin:open sesame'
echo "Aladdin:open sesame" | base64
ANS: QWxhZGRpbjpvcGVuIHNlc2FtZQo=
# ascii to hex
echo "Aladdin:open sesame" | base64 | base64 -D | hexdump -v -e '/1 "%02x" '  
ANS: 416c616464696e3a6f70656e20736573616d650a

hex_str=”416c616464696e3a6f70656e20736573616d650a”
echo $hex_str | xxd -r -p | base64

NOTE_BLOCK
echo ""	