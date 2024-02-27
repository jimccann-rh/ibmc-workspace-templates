#!/bin/bash

# source filewithapikey

ibmcloud login

ibmcloud sl hardware list --output json > data.json
hardware=$(jq '.[].id' data.json)

for id in $hardware; do
  echo "ID: $id creating ticket"
  ibmcloud sl ticket create --title "Update root account access in IPMI" --body "Please update the Remote management IPMI to role of Administrator if it is set to Operator. I can not run Redfish commands" --subject-id 1021 --attachment $id --attachment-type hardware --rootpwd passw0rd
done


ibmcloud logout

