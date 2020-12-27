#!/bin/bash
#dos2unix "./parameters.sh"
source $HOME"/scripts/parameters.sh" 
#dos2unix "./keys.sh"
#source $HOME"/scripts/keys.sh"

function cipher_with_rsa_oaep(){
	generate_key_rsa_for_ciphering
	# file_to_decipher: can be wrapped_key_file_rsa_oaep
	openssl rsautl -encrypt -pubin -inkey $key_rsa_ciphering_public -in $file_to_cipher -out $file_to_decipher -oaep

	openssl rsautl -decrypt -inkey $key_rsa_ciphering_private -in $file_to_decipher -out $file_deciphered -oaep

	# echo “Encode RSA-wrapped key in base64.”
	# openssl enc -base64 -in $wrapped_key_file_rsa_oaep | tr -d '\n' | sed -e '$a\' > $wrapped_key_file_rsa_oaep_in_base64

	echo "Done."
}

function extract_public_key_from_cert(){
	cert_with_path_in="$1"
	public_key_file_with_path="$2"
	
	echo "Extract public key from certificate:"
	openssl x509 -pubkey -noout -in $cert_with_path_in > $public_key_file_with_path

	echo "Done."
}




