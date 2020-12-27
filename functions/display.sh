#!/bin/sh

function print_label() {
	echo $demarcator
	printf "%s\n" "$label"
	echo $demarcator
}

function print_label_with_color() {
	echo $demarcator
	# printf "%s\n" "$label"
	echo -e " \e[42m"$label; 
	echo ""; 
	#echo -e " \e[49m"$label;
	echo -e " \e[49m";	# switch back to default
	echo ""
	echo $demarcator
}

	grey=30; red=31; green=32; yellow=33; blue=34; purple=35; blue_light=36
	index_color=($grey $red $green $yellow $blue $purple $blue_light)
	
function random_select_font(){
	# random select
	floor=$grey;
	ceiling=$blue_light;
	range=$(($ceiling-$floor+1));
	result=$RANDOM;
	let "result %= $range";
	#index_color_choice=$(($result + $floor));
	index_color_choice=$result;
	
	# random select
	floor=0;
	ceiling=8;
	range=$(($ceiling-$floor+1));
	result=$RANDOM;
	let "result %= $range";
	intensity_choice=$(($result + $floor));	
	intensity=$intensity_choice # 4: with underlining; 3: italic
	highlight=47 # white
	
	green='\e[0;32m' # '\e[1;32m' is too bright for white bg.
	endColor='\e[0m'	
}

#$ font_display $(echo $(hash_file <filename>))	
function font_display(){
	random_select_font;
	text="$1"
	
	echo -e "\e[1;${index_color[$index_color_choice]}m $text${endColor}"	
	
}

function font_on_screen_typing_display(){
	random_select_font;
	text="$1"
	speed_typing=10
	
	echo -e "\e[1;${index_color[$index_color_choice]}m $text${endColor}" | pv -qL $speed_typing
	
}

function test_font_display(){
	random_select_font;
	text="$1"
	
	echo -e "\e[$intensity;${index_color[$index_color_choice]}m $text.${endColor}"
	
	echo -e "\e[$intensity;${index_color[$index_color_choice]};47m $text.${endColor}"	
	
	echo -e "\e[1;${index_color[$index_color_choice]}m $text.${endColor}"	

	# echo -e "\e[4;34;47m underlined text with white highlight.\e[0m"

	#Attribute codes:
	#00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed 

	#Text color codes:
	#30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white

	#Background color codes:
	#40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white

	#echo -e "${green}Welcome \e[5;32;47m $USER \n${endColor}"

}

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
