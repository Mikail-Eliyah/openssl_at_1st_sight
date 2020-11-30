function set_up_parameters(){
	cipher_option='OFF'
	key_private_file='./private.pem'
	key_public_file='./public.pem'
	number_of_bits_rsa=1024
	
	file_message_input='./messages/msg.txt'
	file_message_ciphered='./x.out'
	file_message_deciphered='./x_deciphered.out'
	
	cipher_key_algo='des3'
}

function create_rsa_oaep_keys_for_ciphering (){
	if [ "$cipher_option" = 'ON' ];
	then
		openssl genrsa -$cipher_key_algo -out $key_private_file $number_of_bits_rsa
	else
		openssl genrsa -out $key_private_file $number_of_bits_rsa
	fi
	
	echo "Export public key to: "$key_public_file
	openssl rsa -in $key_private_file -outform PEM -pubout -out $key_public_file
	# openssl rsa -in $key_private_file -pubout > $key_public_file

}

function rsa_oaep_file_cipher() {
	openssl rsautl -encrypt -pubin -inkey $key_public_file -in $file_message_input -out $file_message_ciphered -oaep
}

function rsa_oaep_file_decipher() {
	openssl rsautl -decrypt -inkey $key_private_file -in $file_message_ciphered -out $file_message_deciphered -oaep
}

function rsa_oaep_cipher() {
	echo "Caveat: RSA public key can encrypt a file less than the key size, hence, it is usually used to cipher symmetric keys, hence, for data > key size 'error: data too large for key size'"
	set_up_parameters;
	create_rsa_oaep_keys_for_ciphering;
	rsa_oaep_file_cipher;
	rsa_oaep_file_decipher;
	echo "=========================="
	echo "file (plaintext in): "$file_message_input
	echo "=========================="
	echo ""		
	cat $file_message_input
	echo ""		
	echo "=========================="
	echo "file (ciphered out): "$file_message_ciphered
	echo "=========================="
	echo ""	
	cat $file_message_ciphered
	echo ""		
	echo "=========================="	
	echo "file (deciphered out): "$file_message_deciphered
	echo "=========================="	
	echo ""	
	cat $file_message_deciphered
	echo ""		
	echo "=========================="

	clear_files;
}

function clear_files(){
	rm -rf $file_message_ciphered $file_message_deciphered $key_private_file $key_public_file 
}

# dos2unix rsa_oaep_cipher.sh
rsa_oaep_cipher;

# rm -rf $file_message_ciphered $file_message_deciphered