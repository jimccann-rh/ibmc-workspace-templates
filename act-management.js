{
    "name": "{{ act.name_action_man_name }}",
    "description": "Setup management server",
    "location": "us-south",
    "resource_group": "Default",
    "bastion_connection_type": "ssh",
    "inventory_connection_type": "winrm", 
    "source": {
        "source_type" : "git",
        "git" : {
            "git_repo_url": "{{ act.name_repo_man }}"
        }
    },
    "command_parameter": "{{ act.name_playbook }}",
    "bastion": {},
    "bastion_credentials": {
	    "metadata": {}
    },
    "tags":  ["{{ act.name_tags }}", "management"], 
    "source_readme_url": "stringtype",
    "source_type": "GitHub"
}

