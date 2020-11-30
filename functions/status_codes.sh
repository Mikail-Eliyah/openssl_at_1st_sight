#!/bin/bash

function check_status_codes_net () {
	number_of_inputs=1
	if [ $# -lt $number_of_inputs ]
	then
		clr;
        echo "Usage : $0 check_status_codes $1: (status_codes)"
        # exit
	fi
	
	if [ $1 -gt 199 ] && [ $1 -lt 300 ]
	then
		clr;
        echo "2xx (Success category)"
	fi	
	
	if [ $1 -gt 299 ] && [ $1 -lt 400 ]
	then
		clr;
        echo "3xx (Redirection Category)"
	fi	
	
	if [ $1 -gt 399 ] && [ $1 -lt 500 ]
	then
		clr;
        echo "4xx (Client Error Category)"
	fi		

	if [ $1 -gt 499 ] && [ $1 -lt 600 ]
	then
		clr;
        echo "5xx (Server Error Category)"
	fi
	

	case "$1" in
	200)  echo "[$1] : Ok : success for GET, PUT or POST."
		# kill -SIGHUP $2
		;;
	201)  echo  "[$1] : Created :should be returned whenever the new instance is created. E.g on creating a new instance, using [POST/PUT/PATCH], should always return 201 status code."
		;;
	204)  echo  "[$1] : No Content : request e.g. [DELETE]  is successfully processed, but has not returned any content."
		;;

	304)  echo  "[$1] : Not Modified : client has the response in its cache. hence there is no need to transfer the same data again."
		;;		
 
	400)  echo  "[$1] : Bad/ INVALID  Request : request [POST/PUT/PATCH]  by client was not processed, as server could not understand what client is asking for."
		;;	
	401)  echo  "[$1] : Unauthorized :client is not allowed to access resources, and should re-request with the required credentials."
		;;
	403)  echo  "[$1] : Forbidden : request is valid and the client is authenticated, but the client is not allowed access the page or resource for any reason. E.g sometimes the authorized client is not allowed to access the directory on the server."
		;;
	404)  echo  "[$1] : Not Found :requested resource is not available now."
		;;
	410)  echo  "[$1] : Gone :requested resource is no longer available which has been intentionally moved."
		;;

	500)  echo  "[$1] : Internal Server Error :request is valid, but the server is totally confused and the server is asked to serve some unexpected condition."
		;;			
	503)  echo  "[$1] : Service Unavailable : server is down or unavailable to receive and process the request. Mostly if the server is undergoing maintenance."
		;;	
		
	*) echo "Input [$1] : Out of range" # default
		;;
	esac
}
