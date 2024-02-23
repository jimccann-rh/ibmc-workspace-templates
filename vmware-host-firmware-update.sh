#!/bin/bash

# source filewithapikey

echo "WARNING this should only be run on a new environment"
read -p "Press enter to continue"

ibmcloud login

ibmcloud sl hardware list --output json > data.json
vmware=$(jq '.[] | select(.hostname | contains("vmware")) |  .id' data.json)
vmwarename=$(jq '.[] | select(.hostname | contains("vmware")) | {"id": .id, "hostname": .hostname}' data.json)
echo $vmwarename

echo "waiting 10 seconds before shutdown and firmware update"
sleep 10

for id in $vmware; do
  echo "ID: $id powering off"
  ibmcloud sl hardware power-off -f $id
done

echo "waiting 60 seconds for shutdown of systems"
sleep 60

for id in $vmware; do
  echo "ID: $id updating firmware"
  ibmcloud sl hardware update-firmware -f $id
done

ibmcloud logout

