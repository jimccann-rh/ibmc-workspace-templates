#!/bin/bash
pip install ansible
export PATH=$PATH:~/.local/bin
ansible-playbook main.yml
