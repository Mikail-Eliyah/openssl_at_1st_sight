root_path='.'
entity_root_name='RCA_Zone_00' 	# 

csr_path=$root_path"/csr/"
cnf_path=$root_path"/cnf/"
certs_path=$root_path"/certs/"

key_store=$root_path"/key_store/"
key_rsa_signing_private_client='wtg.privatekey.client.key'
key_rsa_signing_private_CA_with_path=$key_store'wtg.privatekey.CA.key'
key_rsa_signing_public_CA_with_path=$key_store'wtg.publickey.CA.key'

key_length=2048
passcode='111'
hash_algo='sha256'

cert_CA_with_path=$certs_path'walnuss.tech.CA.cert'
cert_client_with_path=$certs_path'walnuss.tech.client.cert'

#

cert_p12_with_path=$certs_path'wtg.ca.cert.p12'
csr_with_path=$csr_path$cert_name'.csr'

cert_subject="/C=US/ST=CA/L=SJC/O=Walnuss Tech/OU=Unit Ayahuasca/CN=CA test site/emailAddress=walnuss.tech.group@gmail.com"

CA_cert_validity=700
cert_client_validity=365
number_of_days_validity=3650	# 10 years
number_of_days_validity_client=365	# 1 year(s)

key_rsa_signing_private_client_with_path=$key_store'wtg.privatekey.client.key'
key_rsa_signing_public_client_with_path=$key_store'wtg.publickey.client.key'

client_id='client'
client_serial='2020'
cert_client_name=$client_id
csr_client_with_path=$csr_path$cert_client_name'.csr'
crt_client_with_path=$certs_path$cert_client_name'.crt'
cnf_client_with_path=$cnf_path'client.cnf'
pfx_client_with_path=$csr_path$cert_client_name'.pfx'

