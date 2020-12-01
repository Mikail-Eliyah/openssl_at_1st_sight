#!/bin/sh

# [includes]
number_of_levels_up="../"
#dos2unix $number_of_levels_up"functions/*.sh"
#source $number_of_levels_up"functions/*.sh" # 
#dos2unix $number_of_levels_up"functions/folders_and_files.sh"
#source $number_of_levels_up"functions/folders_and_files.sh" # 
#dos2unix $number_of_levels_up"functions/keys.sh"
#source $number_of_levels_up"functions/keys.sh"
#dos2unix $number_of_levels_up"functions/identity.sh"
#source $number_of_levels_up"functions/identity.sh" #
#dos2unix $number_of_levels_up"functions/display.sh"
#source $number_of_levels_up"functions/display.sh"
#dos2unix $number_of_levels_up"functions/serial.sh"
#source $number_of_levels_up"functions/serial.sh"
#dos2unix source $number_of_levels_up"functions/cipher_utility.sh"
#source $number_of_levels_up"functions/cipher_utility.sh"


passcode="1111.11"			# Caveat: example only
entity_name='RA'			# Caveat: depends on which Zone, e.g. 'RCA.Zone_B'
entity_name=$entity_node_name
entity_name='ursa'
key_name=$entity_name

key_store_path='../key_store/'
csr_path="../csr/"
cnf_path="../cnf/"
certs_path="../certs/"
message_store_path='../messages/'

key_length=2048
hash_algo=sha256

number_of_days_validity=3650	# 10 years

cert_name=$entity_name
csr_with_path=$csr_path$cert_name'.csr'
cert_with_path=$certs_path$cert_name'.crt'

cert_bundle_with_path=$certs_path'bundle_ca_chain.crt'	# bundle cert contains chain of trust

key_hmac_sha256_file=$key_store_path$key_name'.hmac_sha256.key'
# ===============================================
key_rsa_ciphering_private=$key_store_path$key_name'.rsa.'$key_length'.ciphering.private.key'
key_rsa_ciphering_public=$key_store_path$key_name'.rsa.'$key_length'.ciphering.public.key'

# ===============================================
file_to_sign='msg.txt'
file_to_sign_with_path=$message_store_path$file_to_sign

file_to_cipher=$file_to_sign_with_path
file_to_decipher=$file_to_sign_with_path.'enc'
file_deciphered=$message_store_path'msg_deciphered.txt'

key_rsa_signing_private=$key_store_path$key_name'.rsa.'$key_length'.private.key'
key_rsa_signing_public=$key_store_path$key_name'.rsa.'$key_length'.public.key'

key_dsa_signing_private=$key_store_path$key_name'.dsa.key'
key_ec_signing_private=$key_store_path$key_name'.ec.key'
#

signature_file_rsa=$message_store_path$file_to_sign'.'$hash_algo'.rsa_sign.out'
signature_file_dsa=$message_store_path$file_to_sign'.'$hash_algo'.dsa_sign.out'

signature_file_rsa_base64=$message_store_path$file_to_sign'.'$hash_algo'.rsa_sign.base64.out'
signature_file_dsa_base64=$message_store_path$file_to_sign'.'$hash_algo'.dsa_sign.base64.out'

hash_file=$message_store_path$file_to_sign'.'$hash_algo'.out'