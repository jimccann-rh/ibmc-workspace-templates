{
    "name": "{{ ws.name_workspace_bms_name }}-{{ my_idx }}",
    "type": [
      "terraform_v1.5"
    ],
    "location": "us-south",
    "resource_group": "Default",
    "description": "create single host to mitigate issues with datacenter not installing server in under 24hrs.",
    "tags": ["{{ ws.name_tags }}", "esxi"],
    "template_repo": {
      "url": "{{ ws.name_repo_bms }}"
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
            "name": "existing_ssh_key",
            "value": "{{ ws.name_esxisting_ssh_key }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "domain_name",
            "value": "{{ ws.name_domain_name }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "bmshostname",
            "value": "{{ ws.name_bmshostname }}-{{ my_idx }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "bms_private_vlan",
            "value": "{{ ws.name_bms_private_vlan }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "bms_private_subnet",
            "value": "{{ ws.name_bms_private_subnet }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "bms_public_vlan",
            "value": "{{ ws.name_bms_public_vlan }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "bms_public_subnet",
            "value": "{{ ws.name_bms_public_subnet }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "quote_id",
            "value": "{{ ws.name_quote_id }}",
            "type": "string",
            "secure": false
          },
          {
            "name": "iaas_classic_username",
            "value": "{{ ws.name_iaas_classic_username }}",
            "type": "string",
            "secure": false
          }
        ]
      }
    ]
  }

