#!/bin/bash

function sign_message_rsa(){
	key_signing_private=$key_rsa_signing_private
	key_signing_public=$key_rsa_signing_public
	signature_file=$signature_file_rsa
	signing_algo='RSA'
	sign_message;
}

function sign_message_dsa(){
	key_signing_private=$key_dsa_signing_private
	key_signing_public=$key_dsa_signing_public
	signature_file=$signature_file_dsa
	signing_algo='DSA'
	sign_message;
}

function sign_message_ecc(){
	key_signing_private=$key_ec_signing_private
	key_signing_public=$key_ec_signing_public
	signature_file=$signature_file_ec
	signing_algo='ECC'
	sign_message;
}

function sign_message(){
	file_to_sign="message_write_to_file.txt"
	echo $message_input > $message_store_path$file_to_sign
	# hash_hex=$(echo  | openssl $hash_algo | awk '{print $2}')
	# echo "hash_hex: "$hash_hex
	
	openssl dgst -$hash_algo $message_store_path$file_to_sign
	openssl $hash_algo -out $hash_file $message_store_path$file_to_sign
	
	# Signs SHA256 (DSS1) hash of the file ($hash_file) using DSA private key in ($key_dsa_signing_private) and write signature out to (raw binary file: $signature_file_dsa). The PEM file format is a format for storing cryptographic objects such as private keys, certificates, etc.
	# openssl dgst -dss1 -sign $key_dsa_signing_private -out $signature_file_dsa $hash_file
	# Caveat: DSS1 dropped from OpenSSL version !
	openssl dgst -$hash_algo -sign $key_signing_private -out $signature_file $hash_file
	
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	# openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file
	#openssl dgst -$hash_algo -prverify $key_signing_private -signature $signature_file $hash_file
	openssl dgst -$hash_algo -verify $key_signing_public -signature $signature_file $hash_file
	
	signature=$(cat $signature_file | xxd -p)
	# signature=$(echo $signature | xxd -p )
	echo "signature for $signing_algo: "$signature
	
	rm -rf $message_store_path$file_to_sign
	
	# https://medium.com/@bn121rajesh/rsa-sign-and-verify-using-openssl-behind-the-scene-bf3cac0aade2
	
	# openssl dgst -sha256 -sign <private-key> -out <file_out.sha256> <file_in>
	# openssl base64 -in <file_out.sha256> -out <signature_file_out>
}
# verify_message
# openssl base64 -d -in <signature_file_out> -out <file_out.sha256>
# openssl dgst -sha256 -verify <pub-key> -signature <file_out.sha256> <file_in>

function verify_message_rsa(){
	key_signing_public=$key_rsa_signing_public
	signature_file=$signature_file_rsa
	signing_algo='RSA'
	verify_message;
}

function verify_message_dsa(){
	key_signing_public=$key_dsa_signing_public
	signature_file=$signature_file_dsa
	signing_algo='DSA'
	verify_message;
}

function verify_message_ecc(){
	key_signing_public=$key_ec_signing_public
	signature_file=$signature_file_ec
	signing_algo='ECC'
	verify_message;
}

function verify_message(){
	filename="$signature_file"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;

	file_to_sign="message_write_to_file.txt"
	echo $message_input > $message_store_path$file_to_sign
	# hash_hex=$(echo  | openssl $hash_algo | awk '{print $2}')
	# echo "hash_hex: "$hash_hex
	
	openssl dgst -$hash_algo $message_store_path$file_to_sign
	openssl $hash_algo -out $hash_file $message_store_path$file_to_sign
	
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	# openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file
	# openssl dgst -$hash_algo -prverify $key_signing_private -signature $signature_file $hash_file
	openssl dgst -$hash_algo -verify $key_signing_public -signature $signature_file $hash_file
	
	signature=$(cat $signature_file | xxd -p)
	# signature=$(echo $signature | xxd -p )
	echo "signature for $signing_algo: "$signature
	
	rm -rf $message_store_path$file_to_sign
}

function sign_file_rsa(){
	key_signing_private=$key_rsa_signing_private
	key_signing_public=$key_rsa_signing_public
	signature_file=$signature_file_rsa
	signing_algo='RSA'
	sign_file;
}

function sign_file_dsa(){
	key_signing_private=$key_dsa_signing_private
	key_signing_public=$key_dsa_signing_public
	signature_file=$signature_file_dsa
	signing_algo='DSA'
	sign_file;
}

function sign_file_ecc(){
	key_signing_private=$key_ec_signing_private
	key_signing_public=$key_ec_signing_public
	signature_file=$signature_file_ec
	signing_algo='ECC'
	sign_file;
}

function sign_file(){
	read -p "Input file_to_sign (e.g. view.txt):" file_to_sign
	
	filename="$message_store_path$file_to_sign"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;
	
	# file_to_sign="message_write_to_file.txt"
	# echo $message_input > $message_store_path$file_to_sign
	# hash_hex=$(echo  | openssl $hash_algo | awk '{print $2}')
	# echo "hash_hex: "$hash_hex
	
	openssl dgst -$hash_algo $message_store_path$file_to_sign
	openssl $hash_algo -out $hash_file $message_store_path$file_to_sign
	
	# Signs SHA256 (DSS1) hash of the file ($hash_file) using DSA private key in ($key_dsa_signing_private) and write signature out to (raw binary file: $signature_file_dsa). The PEM file format is a format for storing cryptographic objects such as private keys, certificates, etc.
	# openssl dgst -dss1 -sign $key_dsa_signing_private -out $signature_file_dsa $hash_file
	# Caveat: DSS1 dropped from OpenSSL version !
	openssl dgst -$hash_algo -sign $key_signing_private -out $signature_file $hash_file
	
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	# openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file
	#openssl dgst -$hash_algo -prverify $key_signing_private -signature $signature_file $hash_file
	openssl dgst -$hash_algo -verify $key_signing_public -signature $signature_file $hash_file
	
	signature=$(cat $signature_file | xxd -p)
	# signature=$(echo $signature | xxd -p )
	echo "signature for $signing_algo: "$signature
}

function verify_file_rsa(){
	key_signing_public=$key_rsa_signing_public
	signature_file=$signature_file_rsa
	signing_algo='RSA'
	verify_file;
}

function verify_file_dsa(){
	key_signing_public=$key_dsa_signing_public
	signature_file=$signature_file_dsa
	signing_algo='DSA'
	verify_file;
}

function verify_file_ecc(){
	key_signing_public=$key_ec_signing_public
	signature_file=$signature_file_ec
	signing_algo='ECC'
	verify_file;
}

function verify_file(){
	filename="$signature_file"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;

	# input file 
	read -p "Input file_to_sign (e.g. view.txt):" file_to_sign
	
	filename="$message_store_path$file_to_sign"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;
	
	# hash_hex=$(echo  | openssl $hash_algo | awk '{print $2}')
	# echo "hash_hex: "$hash_hex
	
	openssl dgst -$hash_algo $message_store_path$file_to_sign
	openssl $hash_algo -out $hash_file $message_store_path$file_to_sign
	
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	# openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file
	# openssl dgst -$hash_algo -prverify $key_signing_private -signature $signature_file $hash_file
	openssl dgst -$hash_algo -verify $key_signing_public -signature $signature_file $hash_file
	
	signature=$(cat $signature_file | xxd -p)
	# signature=$(echo $signature | xxd -p )
	echo "signature for $signing_algo: "$signature
}

function sign_file_base64_signature(){
	echo "file to sign e.g. message.txt:"
	read file_to_sign
	openssl dgst -$hash_algo $message_store$file_to_sign
	openssl $hash_algo -out $hash_file $message_store$file_to_sign
	echo "write to file: " hash_file
	#
	# Signs SHA256 (DSS1) hash of the file ($hash_file) using DSA private key in ($key_dsa_signing_private) and write signature out to (raw binary file: $signature_file_dsa). The PEM file format is a format for storing cryptographic objects such as private keys, certificates, etc.
	openssl dgst -dss1 -sign $key_dsa_signing_private -out $signature_file_dsa $hash_file
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file

	echo "DSA signature created"
	openssl base64 -in $signature_file_dsa -out $signature_file_dsa_base64
	openssl base64 -in $signature_file_dsa
	
	# Signs SHA256 hash of ($file_to_sign) using RSA private key ($key_rsa_signing_private) and write signature out to ($signature_file_rsa).
	openssl dgst -$hash_algo -sign $key_rsa_signing_private -out $signature_file_rsa $message_store$file_to_sign

	# Verifies signature of($file_to_sign) that is contained in ($signature_file_rsa) using SHA256 and RSA public key from ($key_rsa_signing_public)
	openssl dgst -$hash_algo -verify $key_rsa_signing_public -signature $signature_file_rsa $message_store$file_to_sign

	#echo "RSA signature created"
	openssl base64 -in $signature_file_rsa -out $signature_file_rsa_base64
	openssl base64 -in $signature_file_rsa
}

function verify_signature_base64_signature () {
	echo "file to verify e.g. message.txt:"
	read file_to_sign # file_to_sign == file_to_verify
	# Verifies signature ($hash_file) that is contained in (raw binary file: $signature_file_dsa) using the SHA256 (DSS1) message digest algorithm and the DSA private key from the file ($key_dsa_signing_private).
	openssl base64 -d -in $signature_file_dsa_base64 -out $signature_file_dsa
	
	openssl dgst -dss1 -prverify $key_dsa_signing_private -signature $signature_file_dsa $hash_file
	echo "DSA signature verified"
	
	# Verifies signature of($file_to_sign) that is contained in ($signature_file_rsa) using SHA256 and RSA public key from ($key_rsa_signing_public)
	openssl base64 -d -in $signature_file_rsa_base64 -out $signature_file_rsa
	
	openssl dgst -$hash_algo -verify $key_rsa_signing_public -signature $signature_file_rsa $message_store$file_to_sign
	echo "RSA signature verified"
}

function sign_file_with_cert_rsa (){
	key_signing_private=$key_rsa_signing_private
	cert_with_path=$cert_rsa_with_path
	signing_algo='rsa'
	sign_file_with_cert;
}

function sign_file_with_cert_dsa (){
	key_signing_private=$key_dsa_signing_private
	cert_with_path=$cert_dsa_with_path
	signing_algo='dsa'
	sign_file_with_cert;
}

function sign_file_with_cert_ecc (){
	key_signing_private=$key_ec_signing_private
	cert_with_path=$cert_ecc_with_path
	signing_algo='ecc'
	sign_file_with_cert;
}

# caveat: depends on which signing_algo used in cert generation
function sign_file_with_cert () {
	# input file 
	read -p "Input file_to_sign (e.g. view.txt):" file_to_sign
	
	file_to_sign_with_path=$message_store_path$file_to_sign
	message_file_plaintext=$file_to_sign_with_path
	
	filename="$file_to_sign_with_path"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;
	
	# With PEM encoded X.509 signing certificate stored in file $cert_signer and PEM encoded PKCS#1 private key stored in file $key_signing
	cert_signer=$cert_with_path # *.cer, *.pem
	key_signing=$key_signing_private # *.signer.key, *.pem
	file_signature_pkcs7=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.p7s' # eg. signature.p7s
	file_signature_PEM=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.cer'

	# sign file $message_file_plaintext and output signature stored in PEM encoded PKCS#7 structure into file $file_signature_pkcs7
	openssl smime -sign -binary -in $message_file_plaintext -signer $cert_signer -inkey $key_signing -outform PEM -out $file_signature_pkcs7
	
	# signer's X.509 certificate is obtained from file $cert_signer , and contents of file $message_file_plaintext are signed using the private key from the file $key_signing. Certificate is included in the S/MIME message that is written to $file_signature_pkcs7
	# openssl smime -sign -in $message_file_plaintext -signer $cert_signer -inkey $key_signing -out $file_signature_pkcs7
	
	# convert from pkcs7 to PEM
	openssl pkcs7 -print_certs -in $file_signature_pkcs7 -out $file_signature_PEM
	openssl x509 -in $file_signature_PEM -text -noout
	
	echo "file_signature_pkcs7 " $file_signature_pkcs7 " generated"
}

function verify_file_with_cert_rsa (){
	cert_with_path=$cert_rsa_with_path
	signing_algo='rsa'
	verify_file_with_cert;
}

function verify_file_with_cert_dsa (){
	cert_with_path=$cert_dsa_with_path
	signing_algo='dsa'
	verify_file_with_cert;
}

function verify_file_with_cert_ecc (){
	cert_with_path=$cert_ecc_with_path
	signing_algo='ecc'
	verify_file_with_cert;
}

# caveat: depends on which signing_algo used in cert generation
function verify_file_with_cert () {
	# input file 
	read -p "Input file_to_sign (e.g. view.txt):" file_to_sign
	
	file_to_sign_with_path=$message_store_path$file_to_sign
	message_file_plaintext=$file_to_sign_with_path
	
	filename="$file_to_sign_with_path"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;
	
	filename="$file_signature_pkcs7"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;	
	
	cert_signer=$cert_with_path # *.cer
	# key_signing=$key_rsa_signing_private # *.signer.key
	file_signature_pkcs7=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.p7s' # eg. signature.p7s
	file_signature_PEM=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.cer'
	file_signature_verification=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.result'
	
	# verify signature (If Windows, replace /dev/null with nul)
	openssl smime -verify -binary -inform PEM -in $file_signature_pkcs7 -content $message_file_plaintext -certfile $cert_signer -nointern -noverify > /dev/null
	# 
	# Verifies signature on S/MIME message contained in file $file_signature_pkcs7 and writes result to file mail.txt. The signer's certificate is expected to be included as part of S/MIME message.
	# openssl smime -verify -in $file_signature_pkcs7 -out $file_signature_verification

	echo "file_signature_pkcs7 " $file_signature_pkcs7 " verified"
}

function sign_message_with_cert_rsa(){
	key_signing_private=$key_rsa_signing_private
	cert_with_path=$cert_rsa_with_path
	signing_algo='rsa'
	sign_message_with_cert;
}

function sign_message_with_cert_dsa(){
	key_signing_private=$key_dsa_signing_private
	cert_with_path=$cert_dsa_with_path
	signing_algo='dsa'
	sign_message_with_cert;
}
	
function sign_message_with_cert_ecc(){
	key_signing_private=$key_ec_signing_private
	cert_with_path=$cert_ecc_with_path
	signing_algo='ecc'
	sign_message_with_cert;
}


function sign_message_with_cert(){
	file_to_sign="message_write_to_file.txt"
	echo $message_input > $message_store_path$file_to_sign
	message_file_plaintext=$message_store_path$file_to_sign
	
	# With PEM encoded X.509 signing certificate stored in file $cert_signer and PEM encoded PKCS#1 private key stored in file $key_signing
	cert_signer=$cert_with_path # *.cer, *.pem
	key_signing=$key_signing_private # *.signer.key, *.pem
	file_signature_pkcs7=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.p7s' # eg. signature.p7s
	file_signature_PEM=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.cer'

	# sign file $message_file_plaintext and output signature stored in PEM encoded PKCS#7 structure into file $file_signature_pkcs7
	openssl smime -sign -binary -in $message_file_plaintext -signer $cert_signer -inkey $key_signing -outform PEM -out $file_signature_pkcs7
	
	# signer's X.509 certificate is obtained from file $cert_signer , and contents of file $message_file_plaintext are signed using the private key from the file $key_signing. Certificate is included in the S/MIME message that is written to $file_signature_pkcs7
	# openssl smime -sign -in $message_file_plaintext -signer $cert_signer -inkey $key_signing -out $file_signature_pkcs7
	
	# convert from pkcs7 to PEM
	openssl pkcs7 -print_certs -in $file_signature_pkcs7 -out $file_signature_PEM
	openssl x509 -in $file_signature_PEM -text -noout
	
	echo "file_signature_pkcs7 " $file_signature_pkcs7 " generated"
	
	signature_file=$file_signature_pkcs7	# caveat: this will be used for verification
	signature=$(cat $signature_file | xxd -p)
	# signature=$(echo $signature | xxd -p )
	echo "signature for $signing_algo: "$signature
	
	rm -rf $message_file_plaintext
}

function verify_message_with_cert_rsa(){
	key_signing_private=$key_rsa_signing_private
	cert_with_path=$cert_rsa_with_path
	signing_algo='rsa'
	verify_message_with_cert;
}

function verify_message_with_cert_dsa(){
	key_signing_private=$key_dsa_signing_private
	cert_with_path=$cert_dsa_with_path
	signing_algo='dsa'
	verify_message_with_cert;
}
	
function verify_message_with_cert_ecc(){
	key_signing_private=$key_ec_signing_private
	cert_with_path=$cert_ecc_with_path
	signing_algo='ecc'
	verify_message_with_cert;
}

function verify_message_with_cert () {
	file_to_sign="message_write_to_file.txt"
	echo $message_input > $message_store_path$file_to_sign
	message_file_plaintext=$message_store_path$file_to_sign
	
	filename="$file_signature_pkcs7"
	
	check_if_file_exists;
	if [ $status == "false" ]; then 
		echo " "$filename" does NOT exists"; 
		return
	fi;	
	
	cert_signer=$cert_with_path # *.cer
	# key_signing=$key_rsa_signing_private # *.signer.key
	file_signature_pkcs7=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.p7s' # eg. signature.p7s
	file_signature_PEM=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.cer'
	file_signature_verification=$signature_store_path$file_to_sign'.'$hash_algo'.'$signing_algo'_sign.result'
	
	# verify signature (If Windows, replace /dev/null with nul)
	openssl smime -verify -binary -inform PEM -in $file_signature_pkcs7 -content $message_file_plaintext -certfile $cert_signer -nointern -noverify > /dev/null
	# 
	# Verifies signature on S/MIME message contained in file $file_signature_pkcs7 and writes result to file mail.txt. The signer's certificate is expected to be included as part of S/MIME message.
	# openssl smime -verify -in $file_signature_pkcs7 -out $file_signature_verification

	echo "file_signature_pkcs7 " $file_signature_pkcs7 " verified"
	
	rm -rf $message_file_plaintext
}