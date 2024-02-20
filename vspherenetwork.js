{
    "name": "{{ ws.name_workspace_vsphere_name }}",
    "type": [
      "terraform_v1.5"
    ],
    "location": "us-south",
    "resource_group": "Default",
    "description": "This is for vCenter and other management systems needed for vSphere.",
    "tags": ["{{ ws.name_tags }}", "vsphere network"],
    "template_repo": {
      "url": "{{ ws.name_repo_vsphere }}"
    },
    "template_data": [
      {
        "folder": ".",
        "type": "terraform_v1.5",
        "env_values":[
          { 
            "TF_CLI_ARGS_apply": "-parallelism=250"
          },
          { 
            "TF_CLI_ARGS_plan": "-parallelism=250"
          },
          {
            "TF_CLI_ARGS_destroy": "-parallelism=100"
          },
          { 
            "VAR1":"<val1>"
          },
          {
            "VAR2":"<val2>"
          } 
        ],
        "variablestore": [
          {
            "name": "subnet_capacity",
            "value": "{{ ws.name_vsphere_subnet_capacity }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlan_id",
            "value": "{{ ws.name_vsphere_vlan_id }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlan_tags",
            "value": "{{ ws.name_vsphere_vlan_tags }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "iaas_classic_username",
            "value": "{{ ws.name_iaas_classic_username }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "iaas_classic_api_key",
            "value": "{{ ws.name_iaas_classic_api_key }}",
            "type": "string",
            "secure": true
          }
        ]
      }
    ]
  }

