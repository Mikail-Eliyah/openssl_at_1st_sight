declare file_in=''
declare file_out=""

declare contains=''
declare starts_with=''
demarcator='====================================='

function delete_line_in_file_with(){
	contains="$1"
	sed '/'$contains'/d' $file_in > $file_out
}

# Replace with null
function delete_target_substring_in_line_in_file(){
	contains="$1"
	sed 's/'$contains'//g' $file_in > $file_out
}

function replace_target_substring_in_line_in_file(){
	contains="$1"
	replacement="$2"
	sed 's/'$contains'/'$replacement'/g' $file_in > $file_out
}

function replace_target_substring_in_line_in_file_extract_only_affected_lines(){
	contains="$1"
	replacement="$2"
	sed -n 's/'$contains'/'$replacement'/p' $file_in > $file_out 
	
	# # change only 2nd occurrence of abc on every line to def
	# sed -n 's/'$contains'/'$replacement'/2' $file_in > $file_out 
}

function remove_html_tags_in_file(){
	# instead delimit each < with >
	sed 's/<[^>]*>//g' $file_in > $file_out
}

function remove_fields_in_file(){
	start_open='<'
	end_close='>'
	
	sed 's/'$start_open'.*'$end_close'//g' $file_in > $file_out
	
	# sed 's/<.*>//g' $file_in > $file_out
}

# ======= main ======= 
file_in='./test_data/in.txt'
file_out="./test_data/out.txt"
contains='#'
starts_with='^#'

# delete every comment line (starting with #) in file
#sed '/'$starts_with'/d' $file_in > $file_out
delete_line_in_file_with $starts_with
cat $file_out

echo ""
echo $demarcator
contains='#'
delete_target_substring_in_line_in_file $contains
cat $file_out

echo ""
echo $demarcator
contains='#'
replace_with="-----"
echo "replace_target_substring_in_line_in_file"
replace_target_substring_in_line_in_file $contains $replace_with
cat $file_out
echo ""
echo $demarcator
echo "replace_target_substring_in_line_in_file_extract_only_affected_lines"
replace_target_substring_in_line_in_file_extract_only_affected_lines $contains $replace_with
cat $file_out

echo ""
echo $demarcator
remove_html_tags_in_file
cat $file_out

echo ""
echo $demarcator
add_line_index_to_file
cat $file_out


echo ""
echo $demarcator
remove_fields_in_file
cat $file_out