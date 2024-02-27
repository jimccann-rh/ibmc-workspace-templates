#!/bin/bash

# source filewithapikey

ibmcloud login

ibmcloud sl hardware list --output json > data.json
hardware=$(jq '.[].id' data.json)

for id in $hardware; do
  echo "ID: $id creating ticket"
  ibmcloud sl ticket create --title "Update root account access in IPMI" --body "Please update the Remote management IPMI to role of Administrator if it is set to Operator for the root account. I can not run Redfish commands. Here is the error I get: FAILED! => {"changed": false, "msg": "HTTP Error 403 on PATCH request to 'https://10.10.10.10/redfish/v1/Systems/1/VirtualMedia/EXT1', extended message: 'There are insufficient privileges for the account or credentials associated with the current session to perform the requested operation.'"}
" --subject-id 1021 --attachment $id --attachment-type hardware --rootpwd passw0rd
done


ibmcloud logout

