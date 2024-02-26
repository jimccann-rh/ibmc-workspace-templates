#!/bin/bash

# source filewithapikey

echo "WARNING this should only be run on a new environment"
read -p "Press enter to continue"

ibmcloud login

ibmcloud sl hardware list --output json > data.json
vmware=$(jq '.[] | select(.hostname | contains("vmware")) |  .id' data.json)
vmwarename=$(jq '.[] | select(.hostname | contains("vmware")) | {"id": .id, "hostname": .hostname}' data.json)
echo $vmwarename

for id in $vmware; do
  echo "ID: $id powering on"
  ibmcloud sl hardware power-on -f $id
done

ibmcloud logout

