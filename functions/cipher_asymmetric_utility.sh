#!/bin/bash
#dos2unix "./parameters.sh"
source "./parameters.sh"
#dos2unix "./keys.sh"
source "./keys.sh"

function cipher_with_rsa_oaep(){
	generate_key_rsa_for_ciphering
	openssl rsautl -encrypt -pubin -inkey $key_rsa_ciphering_public -in $file_to_cipher -out $file_to_decipher -oaep
	openssl rsautl -decrypt -inkey $key_rsa_ciphering_private -in $file_to_decipher -out $file_deciphered -oaep

	echo "Done."
}

