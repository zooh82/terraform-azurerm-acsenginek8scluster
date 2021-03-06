{
  "apiVersion": "vlabs",
  "properties": {
    "orchestratorProfile": {
      "orchestratorType": "Kubernetes",
      "orchestratorRelease": "${kubernetes_release_version}",
      "kubernetesConfig": {
        "maxPods": ${kubernetes_max_pods},
        "networkPolicy": "${kubernetes_network_policy}",
        "enableRbac": ${kubernetes_rbac_enabled}                
      }
    },
    "masterProfile": {
      "count": ${master_count},
      "dnsPrefix": "${dns_prefix}",
      "vmSize": "${master_vm_size}",
      "vnetSubnetId": "${master_subnet_id}",
      "firstConsecutiveStaticIP": "${master_first_consecutive_static_ip}"     
    },
    "agentPoolProfiles": [
      {
        "name": "agentpool1",
        "count": ${agent_pool_count},
        "vmSize": "${node_vm_size}",
        "availabilityProfile": "AvailabilitySet",
        "vnetSubnetId": "${nodes_subnet_id}"             
      }
    ],
    "linuxProfile": {
      "adminUsername": "azureuser",
      "ssh": {
        "publicKeys": [
          {
            "keyData": "${rsa_public_key}"
          }
        ]
      }
    },
    "servicePrincipalProfile": {
      "clientId": "${service_principal_client_id}",
      "secret": "${service_principal_client_secret}"
    }
  }
}
