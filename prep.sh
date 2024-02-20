#!/bin/bash
pip install ansible
export PATH=$PATH:~/.local/bin
echo "Put in IASS Classic API KEY"
read apikey
echo "Put in IASS Classic Username"
read username
export IAAS_CLASSIC_API_KEY=apikey
export IAAS_CLASSIC_USERNAME=username
ansible-playbook main.yml
#ansible-playbook main.yml --extra-var vlanslookup=true
