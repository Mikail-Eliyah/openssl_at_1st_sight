function trial_00(){
	#declare -a arr=("element1" "element2" "element3") ## declare an array variable
	declare -a arr=($@) ## declare an array variable

	for var in "$@"
	do
    	echo ": $var"
	done

	for i in "${arr[@]}"  ## loop through the above array
	do
	   echo "$i" # or do whatever with individual element of the array
	done

	# access them using echo "${arr[0]}", "${arr[1]}" 

	# countries=$(cat) 
	countries+=( "${arr[@]}" “+” "${arr[@]}" ) 
	echo ${countries[@]} # element1 element2 element3 “+” element1 element2 element3

	echo $0 $1 $2 $3 $4 $5 $6 $7
	echo $?

	echo $3 # non-numneria
	ans=$3
	# return $2 # return numeric only
	
	number_of_elements=${#countries[@]}
}

function trial_01(){
	ARG1=${1:-default_value_0xx0} 
	ARG2=${2:-default_value_x00x} 
	echo $ARG1 
	echo $ARG2

	if [ ! -z $1 ] 
		then : # $1 was given 
		else : # $1 was not given 
	fi
	
	number_of_inputs=$#
	echo "number_of_inputs: " $number_of_inputs
	
	for var in "$@" # print all vars
	do
    	echo ": $var"
	done	
}

# dos2unix ./lab_input_arguments.sh
# main
#trial_00 $@; # ./lab_input_arguments.sh 1 2 'x0x' 'n 5' 101 

echo "return last statement: " $? "---" $!
echo "" $ans

trial_01
trial_01 foo bar 
trial_01 1 1 bar 
trial_01 able was i able was 
trial_01 "able was i" able was i bar 
trial_01 "able was i" super able was i super 
trial_01 "able was i" "super nn" able was i x xx