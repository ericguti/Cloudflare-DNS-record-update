#!/bin/bash

# ENV VARIABLE LOADING

source ./config

echo $ZONE_ID
echo $GUTI_DNS_TOKEN
echo ${RECORD_ID[@]}
echo ${RECORD_NAME[@]}
echo $API_TOKEN

# IP_BACKUP_FILE

CURRENT_DIR=/home/guti/dev/cloudflaredns
IP_BACKUP_FILE=$CURRENT_DIR/ip_backup

if [ ! -e $IP_BACKUP_FILE ]
then
	touch ip_backup
fi

# IP_QUERY

IP_QUERY_DOMAINS="ifconfig.co ifconfig.me ifconfig.cc";

for domain in $IP_QUERY_DOMAINS
do 
	new_ip=$(curl $domain 2> /dev/null)
	if [ ! -z $(echo $new_ip | egrep '([0-9]{1,3}\.){3}[0-9]{1,3}') ]
	then
		echo "Current ipv6 IP: $new_ip";
		break
	fi
done;

# DNS Record Updating



if [[ $new_ip != $(cat $IP_BACKUP_FILE) ]]
then

	number_of_records=${#RECORD_NAME[@]}

	for i in $(seq 0 $(($number_of_records-1)) )
	do

		url="https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/${RECORD_ID[$i]}"

		headers=(
		    "-H"
		    "Content-Type: application/json"
		    "-H"
		    "X-Auth-Email: $CF_EMAIL"
		    "-H"
		    "X-Auth-Key: $API_TOKEN"
		)

		data=$(cat <<EOF
{
"type": "A",
"name": "${RECORD_NAME[$i]}",
"content": "$new_ip"
}
EOF
);

		echo $new_ip > $IP_BACKUP_FILE;
		curl -v -X PATCH "$url" "${headers[@]}" -d "$data";
		echo "$(date) $url to $new_ip";
	done
fi
