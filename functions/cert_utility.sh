#dos2unix "../parameters.sh"
#source "./parameters.sh"

function display_cert () {
	certs_path='../certs/'
	# openssl x509 -in $certs_path* -text -noout
	openssl x509 -in ../certs/ursa.rsa.2048.crt -text -noout
	openssl x509 -in ../certs/ursa.dsa.2048.crt -text -noout
	openssl x509 -in ../certs/ursa.ecc.secp256r1.crt -text -noout
}

# $ openssl x509 -in ../certs/ursa.ecc.secp256r1.crt -text -noout

function sign_with_rsa_pss (){
	hash_algo='sha256'
	certs_path='../certs/'
	cert='ursa.rsa.2048.crt'
	
	signatures_path='../signatures/'
	file_path='../messages/'
	file_to_sign_or_verify='msg.txt'
	file_signature='rsa_pss_sha256.sig'
	
	key_store='../key_store/'
	key_signing='ursa.rsa.2048.private.key'
	
	openssl $hash_algo -out $signatures_path$file_signature  $file_path$file_to_sign_or_verify
	
	# openssl dgst -$hash_algo -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -sign $certs_path$cert -out $signatures_path$file_signature $file_path$file_to_sign_or_verify
	
	openssl dgst -$hash_algo -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -sign $key_store$key_signing -out $signatures_path$file_signature $file_path$file_to_sign_or_verify

}	

# openssl dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature <("$(tail -c 512 testaes.key)") -verify $certs_path$cert <("$(head -c 64 testaes.key)"

#$ openssl pkeyutl -sign \
#  -in hashOut.bin -inkey pvt_dbg.pem \
#  -out sig1.bin \
#  -pkeyopt digest:sha256 \
#  -pkeyopt rsa_padding_mode:pss \
#  -pkeyopt rsa_pss_saltlen:-1


#$ openssl pkeyutl -verify \
#  -in cp1.bin -sigfile sig1.bin \
#  -pkeyopt rsa_padding_mode:pss \
#  -pubin -inkey pub_dbg.pem \
#  -pkeyopt rsa_pss_saltlen:-1 \
#  -pkeyopt digest:sha256

function verify_with_rsa_pss (){
	hash_algo='sha256'
	certs_path='../certs/'
	cert='ursa.rsa.2048.crt'
	
	signatures_path='../signatures/'
	file_path='../messages/'
	file_to_sign_or_verify='msg.txt'
	file_signature='rsa_pss_sha256.sig'
	
	key_store='../key_store/'
	key_verifying='ursa.rsa.2048.public.key'	
	
	# openssl dgst -$hash_algo -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature $signatures_path$file_signature -verify $key_store$key_verifying $file_path$file_to_sign_or_verify
	
	openssl x509 -pubkey -noout -in $certs_path$cert  > $key_verifying
	# openssl x509 -pubkey -noout -in $certs_path$cert
	
	openssl dgst -$hash_algo -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 -signature $signatures_path$file_signature -verify $key_verifying $file_path$file_to_sign_or_verify
	
	rm -rf $key_verifying
	
}	

: '
Convert cert formats
convert certificates and keys to different formats to make them compatible with specific types of servers or software.
'
# Convert a DER file (.crt .cer .der) to PEM
function convert_DER_to_PEM () {
	openssl x509 -inform der -in $cert_in_DER -out $cert_in_PEM
}

function convert_PEM_to_DER () {
	openssl x509 -outform der -in $cert_in_PEM -out $cert_in_DER
}

# Convert a PKCS#12 file (.pfx .p12) containing a private key and certificates to PEM
function convert_PKCS_12_to_PEM () {
	openssl pkcs12 -in $cert_in_PFX -out $key_cert_profile_in_PEM -nodes
	
	# add -nocerts to only output the private key or add -nokeys to only output the certificates.
}
# Convert a PEM certificate file and a private key to PKCS#12 (.pfx .p12)
function convert_PEM_to_PKCS_12 () {
	openssl pkcs12 -export -out $cert_in_PFX -inkey $private_key -in $cert_in_PEM -certfile $CA_cert_in_CRT
}

# Convert PEM to CRT (.CRT file)
function convert_PEM_to_CRT () {
	openssl x509 -outform der -in $cert_in_PEM -out $cert_in_CRT
}

function convert_PEM_to_P7B () {
	openssl crl2pkcs7 -nocrl -certfile $cert_in_PEM -out $cert_in_P7B -certfile $CA_cert_in_CRT
}

function convert_P7B_to_PEM () {
	openssl pkcs7 -print_certs -in $cert_in_P7B -out $cert_in_PEM
}

function convert_P7B_to_PFX () {
	openssl pkcs7 -print_certs -in $cert_in_P7B -out $cert_in_PFX
	
	openssl pkcs12 -export -in $cert_in_PEM -inkey $private_key -out $cert_in_PFX -certfile $CA_cert_in_CRT
}

# globals
date_start_cert=''
date_end_cert=''

function get_cert_expiry_date (){
	echo "start date: "
	date_start_cert=$(cat $cert_with_path | openssl x509 -noout -startdate)
	echo $date_start_cert
	prefix_to_remove='notBefore='
	target_str=$date_start_cert
	date_start_cert=$(remove_prefix $target_str $prefix_to_remove)
	echo $date_start_cert
	
	echo "end date: "
	date_end_cert=$(cat $cert_with_path | openssl x509 -noout -enddate)
	echo $date_end_cert
	prefix_to_remove='notAfter='
	target_str=$date_end_cert
	date_end_cert=$(remove_prefix $target_str $prefix_to_remove)
	echo $date_end_cert
}

function is_cert_expired (){
	get_cert_expiry_date;
	
	date_formatted_00=$(date); # now
	date_formatted_01=$date_end_cert;
	
	check_date_expiry;
}

function get_cert_from_IP_with_port (){
	# = Get cert from server
	#IP=8.8.8.8 # 10.150.240.107
	#port_num=443
	IP="$1"
	port_num="$2"
	echo | openssl s_client -servername $IP -connect $IP:$port_num 2>/dev/null | openssl x509 -text
}

function get_cert_from_dns_name_with_port (){
	# = Get cert from server
	#dns_name=www.example.com
	dns_name="$1"
	port_num="$2"
	openssl s_client -showcerts -servername $dns_name -connect $dns_name:$port_num </dev/null

	#echo | openssl s_client -servername $dns_name -connect $dns_name:$port_num 2>/dev/null | openssl x509 -text

}

: '
notes: 



'