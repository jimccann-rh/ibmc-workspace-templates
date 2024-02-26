#!/bin/bash

# source filewithapikey

#echo "WARNING this should only be run on a new environment"
#read -p "Press enter to continue"

ibmcloud login

ibmcloud sl hardware list --output json > data.json
vmware=$(jq '.[] | select(.hostname | contains("gateway")) |  .id' data.json)
vmwarename=$(jq '.[] | select(.hostname | contains("gateway")) | {"id": .id, "hostname": .hostname, "publicip": .primaryIpAddress}' data.json)
vmwareip=$(jq '.[] | select(.hostname | contains("gateway")) |  .primaryIpAddress' data.json)
vmwareidip=($(jq '.[] | select(.hostname | contains("gateway")) | .id, .primaryIpAddress' data.json))
data=($(jq '.[] | select(.hostname | contains("gateway")) | .id, .primaryIpAddress' data.json))
echo $vmwarename 
#echo $vmwareidip 

#echo "${vmwareidip[1]}"
#echo "${vmwareidip[0]} ${vmwareidip[1]}"



i=0
while [[ $i -lt ${#data[@]} ]]; do
  # Check if at least 2 items remain
  if [[ $((i + 1)) -lt ${#data[@]} ]]; then
    # Print the first two items
    printf "%s %s\n" "${data[$i]}" "${data[$((i + 1))]}"
    ibmcloud sl call-api SoftLayer_Network_Monitor_Version1_Query_Host createObject --parameters '[{ "hardwareId": '${data[$i]}', "ipAddress": '${data[$((i + 1))]}', "queryTypeId": 1, "responseActionId": 2, "status": "ON"}]'
  fi
  # Increment the index by 2 to skip the processed items
  i=$((i + 2))
done

ibmcloud logout

