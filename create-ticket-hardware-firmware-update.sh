#!/bin/bash

# source filewithapikey

ibmcloud login

ibmcloud sl hardware list --output json > data.json
hardware=$(jq '.[].id' data.json)

for id in $hardware; do
  echo "ID: $id creating ticket"
  ibmcloud sl ticket create --title "update Cloud portal" --body "Please update IBM Cloud portal I have updated my firmware and portal still says firmware updates needed" --subject-id 1021 --attachment $id --attachment-type hardware --rootpwd passw0rd
done


ibmcloud logout

