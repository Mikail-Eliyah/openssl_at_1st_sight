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

key_length=2048					# Caveat: 4096 bits as of year 2020
hash_algo=sha256

key_aes_cbc_ciphering=
key_aes_cbc_ciphering_file=$key_store_path$key_name'.aes_cbc.key'

key_hmac_sha256_authentication=
key_hmac_sha256_file=$key_store_path$key_name'.hmac_sha256.key'


number_of_days_validity=3650	# 10 years

cert_name=$entity_name
csr_with_path=$csr_path$cert_name'.rsa.'$key_length'.csr'
cert_with_path=$certs_path$cert_name'.rsa.'$key_length'.crt'

cert_rsa_with_path=$certs_path$cert_name'.rsa.'$key_length'.crt'
cert_dsa_with_path=$certs_path$cert_name'.dsa.'$key_length'.crt'
cert_ecc_with_path=$certs_path$cert_name'.ecc.''secp256r1''.crt'


cert_bundle_with_path=$certs_path'bundle_ca_chain.crt'	# bundle cert contains chain of trust
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
file_to_sign_with_path=$message_store_path$file_to_sign

key_rsa_signing_private=$key_store_path$key_name'.rsa.'$key_length'.private.key'
key_rsa_signing_public=$key_store_path$key_name'.rsa.'$key_length'.public.key'

key_dsa_signing_private=$key_store_path$key_name'.dsa.private.key'
key_dsa_signing_public=$key_store_path$key_name'.dsa.public.key'

key_ec_signing_private=$key_store_path$key_name'.ec.private.key'
key_ec_signing_public=$key_store_path$key_name'.ec.public.key'
#

signature_file_rsa=$message_store_path$file_to_sign'.'$hash_algo'.rsa_sign.out'
signature_file_dsa=$message_store_path$file_to_sign'.'$hash_algo'.dsa_sign.out'
signature_file_ec=$message_store_path$file_to_sign'.'$hash_algo'.ec_sign.out'

signature_file_rsa_base64=$message_store_path$file_to_sign'.'$hash_algo'.rsa_sign.base64.out'
signature_file_dsa_base64=$message_store_path$file_to_sign'.'$hash_algo'.dsa_sign.base64.out'

hash_file=$message_store_path$file_to_sign'.'$hash_algo'.out'

# ===============================================
signature_file_rsa_base64=$message_store$file_to_sign'.'$hash_algo'.rsa_sign.base64.out'
signature_file_dsa_base64=$message_store$file_to_sign'.'$hash_algo'.dsa_sign.base64.out'
signature_file_ecc_base64=$message_store$file_to_sign'.'$hash_algo'.ecc_sign.base64.out'
# ===============================================


# ===============================================