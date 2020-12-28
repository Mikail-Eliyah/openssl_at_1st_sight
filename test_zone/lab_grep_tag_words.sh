source $HOME"/scripts/include.sh"

# main
# grep tag words
file_type='txt'
label='class' 
label='\$' 

demarcator='====================================='

path_start='.' # './test_data'
path_start='./test_data'
path_start='./test_data/00'

label_start='<'
label_end='>'


echo "[case 00]"
echo "grep_fields_with_same_start_and_end_labels"
label='\$'
grep_fields_with_same_start_and_end_labels;
echo ""
echo "[case 01]"
echo "grep_fields_with_same_start_and_end_labels"
label_start='<'
label_end='>'
grep_fields_with_different_start_and_end_labels;

#
label_start='<meta-function>'
label_end='<\/meta-function>'

echo ""
echo $demarcator

# find $path_start -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'

echo ""
echo $demarcator
path_start='./test_data'
grep_fields_with_different_start_and_end_labels;

label="[case 02]"
print_label;
# 
label_start='<meta-function>'
label_end='<\/meta-function>'
label_inner_start='<function>'
label_inner_end='<\/function>'

echo ""
echo $demarcator
path_start='./test_data'
# grep_fields_with_different_start_and_end_labels;

find $path_start -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_inner_start'/ /g' | sed -e 's/'$label_inner_end'/ /g'

statement="ok  test front <meta-function> 101 </meta-function> test end "

label="[case 03]"
print_label;
grep_fields_with_different_start_and_end_labels_in_line_retaining_labels "$statement"
echo ""
echo $demarcator
echo $demarcator
# extract text between tag and remove tags
echo "$statement" | grep -noP '(?<=<meta-function>).*(?=</meta-function)' 

label="[grep_fields_with_different_start_and_end_labels_in_line_without_labels]"
print_label;
grep_fields_with_different_start_and_end_labels_in_line_without_labels "$statement"
echo ""
echo $demarcator
echo $demarcator
echo "$statement" | grep -oP '(?<=<meta-function>).*(?=</meta-function)' 

echo "$statement" | sed -n '/<meta-function>/,/<\/meta-function>/p'

# get comment blocks
# sed -n '/<start>/,/<\/start>/p' scores.txt

grep_fields_with_different_start_and_end_labels_in_line_retaining_labels "test  202  test "

# get comment blocks with line numbers
#sed -n '/<start>/,/<\/start>/{p
#=
#d
#}' scores.txt

# get comment blocks with line numbers
#cat -n scores.txt | sed -n "/<start>/,/<\/start>/p"

### Notes 
# =======
# find . -regex ".*\.\($file_type\)" -type f -exec awk '/<'$label'>/,/<\/'$label'>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<'$label'>/ /g' | sed -e 's/<\/'$label'>/ /g'

#find . -regex ".*\.\($file_type\)" -type f -exec awk '/'$label'/,/'$label'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label'/ /g' | sed -e 's/'$label'/ /g'

# find . -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'