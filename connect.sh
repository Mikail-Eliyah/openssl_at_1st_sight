user_id='Mikail.Eliyah'                # e.g. name of key file
key_file=$user_id'_rsa'
key_store_path='../../key_store/.ssh/'    # folder of key file

eval "$(ssh-agent -s)"
ssh-add $key_store_path$key_file

#echo "git push -u origin master"
#echo "or"
#echo "git push -uf origin master"

