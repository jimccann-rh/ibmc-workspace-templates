#!/bin/bash
pip install ansible
export PATH=$PATH:~/.local/bin
echo "Put in IASS Classic API KEY"
read apikey
export IAAS_CLASSIC_API_KEY=apikey
ansible-playbook main.yml
#ansible-playbook main.yml --extra-var manlookup=true
