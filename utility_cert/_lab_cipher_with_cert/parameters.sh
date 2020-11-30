#!/bin/sh
passcode="1111.11"						# Caveat: Example ONLY
# entity_name='ursa.rsa.2048'			# Caveat: depends on which Zone, e.g. 'RCA.Zone_B'
#entity_name=$entity_node_name
#key_name=$entity_name
# entity_name=<user_ID> # 'ursa'
entity_name='ursa'
key_name=$entity_name

key_store_path='./key_store/'
csr_path="./csr/"
cnf_path="./cnf/"
certs_path="./certs/"
message_store_path='./messages/'
signature_store_path='./signatures/'
passcodes_store_path='./passcodes/'

key_store_cipher_option='OFF'	# 'ON'
key_store_cipher_key_algo='aes-256-cbc'
hash_algo='sha256'				# caveat: use sha256 
pbkdf_algo='pbkdf2'
number_of_iterations=1			# caveat: use 100,000


key_rsa_pss_length=2048			# Caveat: 4096 bits as of year 2020

key_rsa_oaep_length=2048		# Caveat: 4096 bits as of year 2020

key_private_rsa_pss_for_signing_file=$key_store_path$key_name'_private_rsa_pss_sign.'$key_rsa_pss_length'.pem'
key_public_rsa_pss_for_signing_file=$key_store_path$key_name'_public_rsa_pss_sign.'$key_rsa_pss_length'.pem'

key_private_rsa_oaep_for_ciphering_file=$key_store_path$key_name'_private_rsa_oaep_cipher.'$key_rsa_oaep_length'.pem'
key_public_rsa_oaep_for_ciphering_file=$key_store_path$key_name'_public_rsa_oaep_cipher.'$key_rsa_oaep_length'.pem'


###################
key_length=2048					# Caveat: 4096 bits as of year 2020
# hash_algo=sha256

key_aes_cbc_ciphering=
key_aes_cbc_ciphering_file=$key_store_path$key_name'.aes_cbc.key'

key_hmac_sha256_authentication=
key_hmac_sha256_file=$key_store_path$key_name'.hmac_sha256.key'

number_of_days_validity=3650	# 10 years

cert_name=$entity_name
csr_with_path=$csr_path$cert_name'.rsa.'$key_length'.csr'
cert_with_path=$certs_path$cert_name'.rsa.'$key_length'.crt'

cert_signing_rsa_pss_with_path=$certs_path$cert_name'.rsa_pss.'$key_rsa_pss_length'.crt'
cert_ciphering_rsa_oaep_with_path=$certs_path$cert_name'.rsa_oaep.'$key_rsa_oaep_length'.crt'

config_file='ursa.cnf'	
# caveat: config_file to be different
config_file_cert_signing_rsa_pss_with_path=$cnf_path$config_file
config_file_cert_ciphering_rsa_oaep_with_path=$cnf_path$config_file

# ===============================================
agent_name='Kharon'
key_of_agent_aes_cbc_ciphering_file=$key_store_path$agent_name'.aes_cbc.key'
# ===============================================
status="false"
demarcator="=========================================="
# ===============================================
ICA_entity_name='ICA_01.RCA.Zone_A' # Caveat: depends on which ICA, e.g. 'ICA_00/01.RCA.Zone_A'
csr_to_sign_with_path='./to_sign/csr/'$ICA_entity_name'.csr'
cert_signed_with_path='./to_sign/certs/'$ICA_entity_name'.crt'

# ===============================================
file_to_sign='msg.txt'
file_to_cipher='msg.txt'
file_ciphered='msg_ciphered.txt'
file_deciphered='msg_deciphered.txt'

file_to_sign_with_path=$message_store_path$file_to_sign
file_to_cipher_with_path=$message_store_path$file_to_cipher
file_ciphered_with_path=$message_store_path$file_ciphered
file_deciphered_with_path=$message_store_path$file_deciphered

signature_file_rsa_pss=$signature_store_path$file_to_sign'.'$hash_algo'.rsa_sign.out'

signature_file_rsa_base64=$signature_store_path$file_to_sign'.'$hash_algo'.rsa_sign.base64.out'
signature_file_dsa_base64=$signature_store_path$file_to_sign'.'$hash_algo'.dsa_sign.base64.out'

hash_file=$message_store_path$file_to_sign'.'$hash_algo'.out'

# ===============================================
signature_file_rsa_base64=$message_store$file_to_sign'.'$hash_algo'.rsa_sign.base64.out'
signature_file_dsa_base64=$message_store$file_to_sign'.'$hash_algo'.dsa_sign.base64.out'
signature_file_ecc_base64=$message_store$file_to_sign'.'$hash_algo'.ecc_sign.base64.out'
# ===============================================


# ===============================================