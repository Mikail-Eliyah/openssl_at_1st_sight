

# Introspection tag and track
function grep_fields_with_same_start_and_end_labels (){
	label_start=$label
	label_end=$label	
	
	grep_fields_with_different_start_and_end_labels;
}

function grep_fields_with_different_start_and_end_labels (){
	find $path_start -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'
}

# extract lines
function grep_fields_with_different_start_and_end_labels_in_file_retaining_labels (){
	file_name="$1"
	find -regex $file_name -exec awk '/'$label_start'/,/'$label_end'/ {print $0}' {} \; 
	# | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'
}

function grep_fields_with_different_start_and_end_labels_in_line_retaining_labels (){
	statement="$1"
	
	statement_detected=$(
	echo "$statement" | awk '/'$label_start'/,/'$label_end'/') 
	# | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'
	
	if [ -z "$statement_detected" ]; then
		echo "Nothing detected."
	else
		#echo "removing by: " "$label_start"
		statement_detected_formatted=$(remove_before "$statement_detected" "$label_start")
		
		#echo $statement_detected_formatted
		#echo "removing by: " "$label_end"
		
		statement_detected_formatted=$(remove_after "$statement_detected_formatted" "$label_end")
		
		echo $statement_detected_formatted
	fi
}

function grep_fields_with_different_start_and_end_labels_in_line_and_remove_labels (){
	statement="$1"
	
	# extract text between tag and remove tags
	statement_detected=$(echo "$statement" | grep -oP '(?<='$label_start').*(?='$label_end')')

	if [ -z "$statement_detected" ]; then
		echo "Nothing detected."
	else
		echo $statement_detected
	fi
}


function grep_starting_with (){
	pattern="$1"
	
	if [ "$1" == '-h' ]; then
		echo "
		grep '^'$pattern --color
		e.g. $ list_bash_functions | grep '^v' --color # starts with 
		"
	fi
	
	grep '^'$pattern --color

}

function grep_containing (){
	pattern="$1"
	
	if [ "$1" == '-h' ]; then
		echo "
		grep $pattern --color
		e.g. 
		$ list_bash_functions | grep '[*sa]' --color # contains
		$ list_bash_functions | grep 'in[dat]' --color # contains a or d or t
		$ list_bash_functions | grep 'win' --color # matches
		$ list_bash_functions | grep '.in' --color
		"
		
		return 0
	fi
	
	grep $pattern --color
}

function grep_containing_not (){
	pattern="$1"
	
	if [ "$1" == '-h' ]; then
		echo "
		grep $pattern --color
		e.g. 
		$ list_bash_functions | grep '[*sa]' --color # contains
		$ list_bash_functions | grep 'in[dat]' --color # contains a or d or t
		$ list_bash_functions | grep 'win' --color # matches
		$ list_bash_functions | grep '.in' --color
		"
		
		return 0
	fi
	
	grep -v $pattern --color
}

function grep_ending_with (){
	pattern="$1"
	
	if [ "$1" == '-h' ]; then
		echo "
		grep $pattern'$' --color
		e.g. $ list_bash_functions | grep 'x$' --color # ends with
		"
	fi
	
	grep $pattern'$' --color
}

#"
#find . -type f -exec awk '/<parameter>/,/<\/parameter>/' {} \; | sed -e 's/<[^>]*>//g'
#find . -regex ".*\.\(py\)" -type f -exec awk '/<parameter>/,/<\/parameter>/' {} \; | sed -e 's/<[^>]*>//g'
#find . -type f -exec awk '/<parameter>/,/<\/parameter>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<[^>]*>//g'

# recursively with file and line number, and file type (here is .py)
# ./hello.py:17:		 None 
#find . -regex ".*\.\(py\)" -type f -exec awk '/<parameter>/,/<\/parameter>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<[^>]*>//g'

#-regex ".*\.\(wav\|aif\|wave\|aiff\)"


#$ find . -regex ".*\.\(py\)" -type f -exec awk '/<parameter>/,/<\/parameter>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<[^>]*>//g'

#./Libraries/Lib_00/hello.py:15:		 name: String 

#Notes:
#Strict format:
#example:
#	<function> __init__ </function> 
#	<parameter> name: String </parameter>
#	<return> None </return>

#get each tag and sort them.
#path, file, line # should reorder each tag search
#alternatively - put the entire in 1 <meta>, then remove the tag


#$ find . -regex ".*\.\(py\)" -type f -exec awk '/<meta-function>/,/<\/meta-function>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<.*meta-function>/ /g'

#or

#$ find . -regex ".*\.\(py\)" -type f -exec awk '/<meta-function>/,/<\/meta-function>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<meta-function>/ /g' | sed -e 's/<\/meta-function>/ /g'


# replace <function> ... </function> to <ok> ... </ok>
#find . -regex ".*\.\(py\)" -type f -exec awk '/<meta-function>/,/<\/meta-function>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<function[^>]*>/<ok>/g' | sed -e 's/</function[^>]*>/</ok>/g'
#"

#"""
#Given:
#		<meta-function>
#		<function> __init__ </function> 
#		<parameter> name: String </parameter>
#		<return> None </return>
#		</meta-function>
#
#$ find . -regex ".*\.\(py\)" -type f -exec awk '/<meta-function>/,/<\/meta-function>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<meta-function>/ /g' | sed -e 's/<\/meta-function>/ /g'
#./Libraries/Lib_00/hello.py:14:		 
#./Libraries/Lib_00/hello.py:15:		<function> __init__ </function> 
#./Libraries/Lib_00/hello.py:16:		<parameter> name: String </parameter>
#./Libraries/Lib_00/hello.py:17:		<return> None </return>
#./Libraries/Lib_00/hello.py:18:		 
#./Libraries/Lib_01/hello.py:14:		 
#./Libraries/Lib_01/hello.py:15:		<function> __init__ </function> 
#./Libraries/Lib_01/hello.py:16:		<parameter> name: String </parameter>
#./Libraries/Lib_01/hello.py:17:		<return> None </return>
#./Libraries/Lib_01/hello.py:18:		 
#"""
