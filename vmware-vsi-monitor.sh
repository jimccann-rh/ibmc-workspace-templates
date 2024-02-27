#!/bin/bash

# source filewithapikey

#echo "WARNING this should only be run on a new environment"
#read -p "Press enter to continue"

ibmcloud login


emailid=$(ibmcloud sl call-api Account getUsers --output json | jq -r '.[] | select(.email=="jimccann@redhat.com") | .id')
ibmcloud sl vs list --output json > vsdata.json
vmware=$(jq '.[] | select(.hostname | contains("instance")) |  .id' vsdata.json)
vmwarename=$(jq '.[] | select(.hostname | contains("instance")) | {"id": .id, "hostname": .hostname, "privateip": .primaryBackendIpAddress}' vsdata.json)
vmwareip=$(jq '.[] | select(.hostname | contains("instance")) |  .primaryBackendIpAddress' vsdata.json)
vmwareidip=($(jq '.[] | select(.hostname | contains("instance")) | .id, .primaryBackendIpAddress' vsdata.json))
data=($(jq '.[] | select(.hostname | contains("instance")) | .id, .primaryBackendIpAddress' vsdata.json))
echo $vmwarename
echo $emailid
#sleep 60 
#echo $vmwareidip 

#echo "${vmwareidip[1]}"
#echo "${vmwareidip[0]} ${vmwareidip[1]}"



i=0
while [[ $i -lt ${#data[@]} ]]; do
  # Check if at least 2 items remain
  if [[ $((i + 1)) -lt ${#data[@]} ]]; then
    # Print the first two items
    printf "%s %s\n" "${data[$i]}" "${data[$((i + 1))]}"
    ibmcloud sl call-api SoftLayer_Network_Monitor_Version1_Query_Host createObject --parameters '[{ "guestId": '${data[$i]}', "ipAddress": '${data[$((i + 1))]}', "queryTypeId": 1, "responseActionId": 2, "status": "ON"}]'
    ibmcloud sl call-api SoftLayer_User_Customer_Notification_Virtual_Guest createObject --parameters '[{ "guestId": '${data[$i]}', "userId": '${emailid}' }]'
  fi
  # Increment the index by 2 to skip the processed items
  i=$((i + 2))
done

ibmcloud logout

