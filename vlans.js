{
    "name": "{{ ws.name_workspace_vlans_name }}",
    "type": [
      "terraform_v1.5"
    ],
    "location": "us-south",
    "resource_group": "Default",
    "description": "Vlans for VM's to run in.",
    "tags": ["{{ ws.name_tags }}", "vlans"],
    "template_repo": {
      "url": "{{ ws.name_repo_vlans }}"
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
            "name": "datacenter",
            "value": "{{ ws.name_datacenter }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "project",
            "value": "{{ ws.name_project }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "gateway_id",
            "value": "{{ ws.name_vlans_gateway_id }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "subnet_capacity",
            "value": "{{ ws.name_vlans_subnet_capacity }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "router",
            "value": "{{ ws.name_vlans_router }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlans_tags",
            "value": "{{ ws.name_vlans_vlan_tags }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlans_tags_disconnected",
            "value": "{{ ws.name_vlans_vlan_tags_disconnected }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlan_quantity",
            "value": "{{ ws.name_vlans_quantity }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "vlan_quantity_disconnected",
            "value": "{{ ws.name_vlans_quantity_disconnected }}",
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

