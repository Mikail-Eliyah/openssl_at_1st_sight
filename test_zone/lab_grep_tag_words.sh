source $HOME"/include.sh"

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

### Notes 
# =======
# find . -regex ".*\.\($file_type\)" -type f -exec awk '/<'$label'>/,/<\/'$label'>/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/<'$label'>/ /g' | sed -e 's/<\/'$label'>/ /g'

#find . -regex ".*\.\($file_type\)" -type f -exec awk '/'$label'/,/'$label'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label'/ /g' | sed -e 's/'$label'/ /g'

# find . -regex ".*\.\($file_type\)" -type f -exec awk '/'$label_start'/,/'$label_end'/ {print FILENAME ":" FNR ":" $0}' {} \; | sed -e 's/'$label_start'/ /g' | sed -e 's/'$label_end'/ /g'