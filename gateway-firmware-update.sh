#!/bin/bash

# source filewithapikey

echo "WARNING this should only be run on a new environment"
read -p "Press enter to continue"

ibmcloud login

ibmcloud sl hardware list --output json > data.json
gateway=$(jq '.[] | select(.hostname | contains("gateway")) |  .id' data.json)
gatewayname=$(jq '.[] | select(.hostname | contains("gateway")) | {"id": .id, "hostname": .hostname}' data.json)
echo $gatewayname

#hostname=$(jq -r '.[].hostname' data.json)
#datacenter=$(jq -r '.[].name' data.json)

echo "waiting 10 seconds before shutdown and firmware update"
sleep 10

#for id in $gateway; do
#  echo "ID: $id powering off"
#  ibmcloud sl hardware power-off -f $id
#done
#
#echo "waiting 120 seconds for shutdown of systems"
#sleep 120

for id in $gateway; do
  echo "ID: $id updating firmware"
  ibmcloud sl hardware update-firmware -f $id
done

ibmcloud logout

