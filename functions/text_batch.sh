
function delete_lines_from_to() {
	from="$1"
	to="$2"
	# delete lines of file
	sed ''$from','$to'd' # file_in > file_out
}

function retain_lines_from_to() {
	from="$1"
	to="$2"
	# retain lines of file
	#statement=sed "''$from','$to'!d'"
	#echo $statement
	#statement="sed ''$from','$to'd' "
	#echo $statement
	#sed ''$from','$to'\!d' # file_in > file_out
	sed "$from,$to!d"
}


