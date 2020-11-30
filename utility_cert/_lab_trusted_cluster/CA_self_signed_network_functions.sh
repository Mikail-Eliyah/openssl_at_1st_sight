# version: 2020-10-13_0745hr_39sec
source "./parameters.sh"

function print_menu_CA_self_signed_services() {
  echo "Press 1 : generate_CA_self_signed_cert"
  echo "Press 2 : generate_client_certs"
  echo "Press 3 : clean_all_certs_CSR_and_keys"
  echo ""  
  echo "Press 'x' or 'X' to exit the script"
}

function print_label() {
	echo "╔════════════════ ೋღ☃ღೋ ════════════════╗" 
	echo "* 	 $label  	*" 
	echo "╚════════════════ ೋღ☃ღೋ ════════════════╝"
}

# client
# With CA certificate (wtg.ca.cert), which can be installed into web server under test and a private key file (wtg.ca.key) that you can use to sign user certificates.
function generate_client_certs() {
	label="Generate client key-pair"
	print_label;
	openssl genrsa -out $key_rsa_signing_private_client_with_path  $key_length
	
	# Export public key
	openssl rsa -in $key_rsa_signing_private_client_with_path -pubout > $key_rsa_signing_public_client_with_path	
	# Create a digital certificate for a user.
	# Create a CSR file for user. Set initial password to abc. Optionally, provide an appropriate subject.
	# openssl req -key $key_rsa_signing_private_client_with_path -new -out $csr_client_with_path -subj "/C=US/ST=CA/L=SJC/O=Walnuss Tech/OU=Unit Omen/CN=Client service test site/emailAddress=walnuss.omen@gmail.com" 
	label="Create client CSR"
	print_label;	
	openssl req -config $cnf_path$client_id'.cnf'  -key $key_rsa_signing_private_client_with_path -new -out $csr_client_with_path
	
	cat $csr_client_with_path
	
	label="Sign child cert root CA cert and it’s private key"
	print_label;	
	openssl x509 -req -in $csr_client_with_path -days $number_of_days_validity_client -CA $cert_CA_with_path -CAkey $key_rsa_signing_private_CA_with_path -set_serial $client_serial -out $crt_client_with_path

	# Print textual representation of the certificate
	openssl x509 -in $crt_client_with_path -text -noout
	
	openssl req -in $csr_client_with_path -verify

	openssl x509 -noout -modulus -in $crt_client_with_path | openssl $hash_algo
	
	label="verify_file_with_cert"
	print_label;
	openssl verify -verbose -CAfile $cert_CA_with_path $crt_client_with_path 
}

function generate_CA_self_signed_cert() {
	# by omitting -aes128 : openssl do not encrypt key
	# openssl genrsa -aes -out $key_rsa_signing_private_CA_with_path $key_length
	# openssl genrsa -aes128 -out $key_rsa_signing_private_CA_with_path $key_length
	label="Generate root CA key-pair"
	print_label;	
	openssl genrsa -out $key_rsa_signing_private_CA_with_path  $key_length
	
	echo ""
	label="Create a self-signed certificate authority (CA) for testing"
	print_label;	
	openssl req -x509 -config $cnf_path$entity_root_name'.cnf' -new -nodes -key $key_rsa_signing_private_CA_with_path -$hash_algo -days $number_of_days_validity -out $cert_CA_with_path
	
	#cp <source> <dest>
	
	# Export public key
	openssl rsa -in $key_rsa_signing_private_CA_with_path -pubout > $key_rsa_signing_public_CA_with_path
	#cat $key_rsa_signing_public_CA_with_path

	# Create an X.509 digital certificate from CSR. Creates a certificate signed with the CA private key. Certificate is valid for N days.
	#openssl x509 -in $csr_with_path -out $cert_name_with_path -req -signkey $key_store$key_rsa_signing_private_CA -days $CA_cert_validity
	
	# Create a PKCS#12-encoded file containing certificate and private key. Sets password on P12 file to $passcode. Service: TLS testing uses $passcode for all PKCS#12 files.
	# openssl pkcs12 -passout pass:$passcode -export -nokeys -cacerts -in $cert_name_with_path -out $cert_p12_with_path -inkey $key_store$key_rsa_signing_private_CA
}

function clean_all_certs_CSR_and_keys() {
	label="clean_all_certs_CSR_and_keys"
	print_label;
	
	rm -rf $key_rsa_signing_private_CA_with_path \
	$key_rsa_signing_public_CA_with_path \
	$csr_client_with_path \
	$key_rsa_signing_private_client_with_path \
	$key_rsa_signing_public_client_with_path \
	$cert_CA_with_path	\
	$crt_client_with_path
}
