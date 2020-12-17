# source $HOME"/scripts/include.sh"

file_name_tmp='write_here.txt'

function format_into_bash_comments () {
	echo "Enter comment / notes (and save, this file will be removed after result output to console) : "
	touch $file_name_tmp

	open_notepad $file_name_tmp
	
	# add hash in front of every line
	add_character_in_front_of_every_line $file_name_tmp '#'
	
	rm -rf  $file_name_tmp
}

function format_into_bash_non_comments () {
	echo "Enter comment / notes (and save, this file will be removed after result output to console) : "
	touch $file_name_tmp

	open_notepad $file_name_tmp

	# remove hash from the front of every line
	remove_character_in_front_of_every_line tmp.txt '#'

	rm -rf  $file_name_tmp
}


