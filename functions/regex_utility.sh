function replace_back_slash_with_forward_slash (){
	str="$1"
	# # '\\\\' ----> '//'
	echo $str | sed -E 's/\\/\//g'
}

function replace_all_symbols (){
	str="$1"
	replace_with="$2"
	# Punctuation
	echo $str | sed -E 's|[[:punct:]]|'$replace_with'|g'
}

function replace_all_control_chars (){
	str="$1"
	replace_with="$2"
	# opposite: [:print:]	Printable character
	echo $str | sed -E 's|[[:cntrl:]]|'$replace_with'|g'
}

function replace_all_upper_case (){
	str="$1"
	replace_with="$2"
	
	echo $str | sed -E 's|[[:upper:]]|'$replace_with'|g'
}

function replace_all_lower_case (){
	str="$1"
	replace_with="$2"
	
	echo $str | sed -E 's|[[:lower:]]|'$replace_with'|g'
}

function replace_all_alphabetic (){
	str="$1"
	replace_with="$2"
	
	echo $str | sed -E 's|[[:alpha:]]|'$replace_with'|g'
}


function replace_all_digits (){
	str="$1"
	replace_with="$2"
	#Match any character in the range 0 - 9 (equivalent of POSIX [:digit:])

	echo $str | sed -E 's|[[:digit:]]|'$replace_with'|g'
}

function replace_all_non_digits (){
	str="$1"
	replace_with="$2"

	echo $str | sed -E 's|[^[:digit:]]|'$replace_with'|g'
}

function replace_all_space (){
	str="$1"
	replace_with="$2"
	# space
	echo $str | sed -E 's|[[:blank:]]|'$replace_with'|g'
}

function replace_all_non_space (){
	str="$1"
	replace_with="$2"

	echo $str | sed -E 's|[^[:blank:]]|'$replace_with'|g'
}

# Match any character in the range 0 - 9, A - Z and a - z (equivalent of POSIX [:alnum:])

function replace_all_alphanumeric (){
	str="$1"
	replace_with="$2"

	echo $str | sed -E 's|[[:alnum:]]|'$replace_with'|g'
}

function replace_all_non_alphanumeric (){
	str="$1"
	replace_with="$2"

	echo $str | sed -E 's|[^[:alnum:]]|'$replace_with'|g'
}

function replace_all_occurrences_of_str0_with_str1 (){
	str="$1"
	str_target="$2" #  
	replace_with="$3" # 

	echo $str | sed 's:'$str_target':'$replace_with':g'
}

function replace_all_occurrences_of_str0_with_str1_in_file (){
	tag_to_be_replaced="$1" #  
	tag_to_replace_with="$2" # 
	file_target="$3"
	file_out="$4"	

	sed -e "s/"$tag_to_be_replaced"/"$tag_to_replace_with"/" $file_target > $file_out
}


function replace_all_occurrences_case_insensitve_of_str0_with_str1 (){
	str="$1"
	str_target="$2" # '\/var\/www\/'
	replace_with="$3" # '\/var\/local\/www\/'

	# # replaces all occurrences of /var/www/ with /var/local/www/
	# echo $str | sed 's/\/var\/www\//\/var\/local\/www\//g'
	# or
	# sed 's:/var/www/:/var/local/www/:g'
	# echo $str | sed 's/'$str_target'/'$replace_with'/g'
	echo $str | sed 's:'$str_target':'$replace_with':Ig'
	
	# I := case insensitve
}

# pipe
# echo $contents | ...
# ... < $file_name
function find_lines_containing_str () {
	file_name="$1"
	str_target="$2"
	
	sed -n '/'$str_target'/p' $file_name 
	number_of_lines_found=$(sed -n 's/'$str_target'/&/p' $file_name | wc -l)
	
	echo ""
	echo "number_of_lines_found: " $number_of_lines_found
}

function find_line_containing_str_in_file(){
	file_name="$1"
	key_word_to_search="$2"
	
	statement_found=$(cat $file_name | grep -i "$key_word_to_search")
	
		if [ ! -z "$statement_found" ]; then
			font_display "$statement_found"
			echo ""
		else
			echo "[No hits] Nothing found."
		fi
}

function find_line_containing_str(){
	line="$1"
	key_word_to_search="$2"
	
	statement_found=$(echo "$line" | grep -i "$key_word_to_search")
	
		if [ ! -z "$statement_found" ]; then
			font_display "$statement_found"
			echo ""
		else
			echo "[No hits] Nothing found."
		fi
}

function change_upper_to_lower_case (){
	str="$1"
	echo $str | tr '[:upper:]' '[:lower:]'
}

function change_lower_to_upper_case (){
	str="$1"
	echo $str | tr '[:lower:]' '[:upper:]'
}

