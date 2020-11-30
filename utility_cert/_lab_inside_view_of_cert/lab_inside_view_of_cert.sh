function set_up_parameters(){
	certs_path="./certs/"
	cert_with_path=$certs_path'ursa.rsa_oaep.2048.crt' # ursa.rsa_pss.2048.crt
	
	key_private_file='./private.pem'
	key_public_file='./public.pem'
	number_of_bits_rsa=1024
	
	
}

function is_expired(){
	if [ "$expiry_time_in_linux_epoch" -ge "$time_to_check_for_expiry_in_linux_epoch" ];
	then
		echo "VALID"
	else
		echo "EXPIRED"
	fi	
	
}

function get_cert_expiry_date (){
	echo "start data: "
	cat $cert_with_path | openssl x509 -noout -startdate
	echo "end data: "
	cat $cert_with_path | openssl x509 -noout -enddate
	
	#local time_end=''
	
	prefix="notAfter="
	#suffix="GMT"
	time_end=$(cat $cert_with_path | openssl x509 -noout -enddate)
	
	time_end=${time_end#"$prefix"} # remove prefix
	#time_end=${time_end%"$suffix"}	# remove suffix
	echo "time_end: " $time_end

	time_end=$(date -d "$time_end" +"%s")
	echo "time_end (in linux epoch): " $time_end
	echo "time_end (year-month.day_hour_minutes:seconds): " $(date -d "$time_end" +"%Y-%m.%d_%H%Mhr:%S secs")
	
	now=$(date +"%s")
	echo "now: " $now
	echo "now (year-month.day_hour_minutes:seconds): " $(date -d @"$now" +"%Y-%m.%d_%H%Mhr:%S secs")
	
	# assume today is expired date: Nov 10 04:00:59 2020 GMT
	date_assumed='Nov 10 04:00:59 2020 GMT'
	date_assumed='Nov 10 04:01:00 2020 GMT' # 1 sec expired
	date_assumed_in_linux_epoch=$(date -d "$date_assumed" +"%s")
	
	expiry_time_in_linux_epoch=$time_end
	time_to_check_for_expiry_in_linux_epoch=$date_assumed_in_linux_epoch
	
: '	
'
}


function view_cert() {
	echo "Viewing cert: " $cert_with_path
	set_up_parameters;
	
	get_cert_expiry_date;
	echo "=========================="
	is_expired;
	echo ""		
	echo "=========================="
}



# dos2unix lab_inside_view_of_cert.sh
view_cert;
