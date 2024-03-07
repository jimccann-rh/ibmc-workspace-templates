{
    "name": "{{ act.name_action_twingate_name }}",
    "description": "Update twingate",
    "location": "us-south",
    "resource_group": "Default",
    "bastion_connection_type": "ssh",
    "inventory_connection_type": "ssh", 
    "source": {
        "source_type" : "git",
        "git" : {
            "git_repo_url": "{{ act.name_repo_twingate }}"
        }
    },
    "command_parameter": "{{ act.name_playbook_twingate }}",
    "bastion": {},
    "bastion_credentials": {
	    "metadata": {}
    },
    "tags":  ["{{ act.name_tags }}", "management"], 
    "source_readme_url": "stringtype",
    "source_type": "GitHub"
}

