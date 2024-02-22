!/bin/bash

# source filewithapikey

ibmcloud login

ibmcloud sl hardware list --output json > data.json
gateway=$(jq '.[] | select(.hostname | contains("gateway")) |  .id' data.json)
gatewayname=$(jq '.[] | select(.hostname | contains("gateway")) | {"id": .id, "hostname": .hostname}' data.json)
echo $gatewayname

for id in $gateway; do
  echo "ID: $id creating ticket"
  ibmcloud sl ticket create --title "Please mount upgrade ISO vyatta OS on gateway" --subject-id 1482 --attachment $id --attachment-type hardware
done


ibmcloud logout

