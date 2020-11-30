

# Introspection tag and track
function grep_fields_with_same_start_and_end_labels (){
	label_start=$label
	label_end=$label	
	
	grep_fields_with_different_start_and_end_labels;
}

function grep_fields_with_different_start_and_end_labels (){
	find $path_start -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'
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
