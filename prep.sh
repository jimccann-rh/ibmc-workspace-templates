#!/bin/bash
pip install ansible
export PATH=$PATH:~/.local/bin
read apikey
export IAAS_CLASSIC_API_KEY=apikey
ansible-playbook main.yml
