#/bin/bash

# k8s is the cluster name
civo k3s show k8s

# k3s-k8s-3d6d-e8e164-node-pool-c176 is the node name
civo k3s recycle k8s --node k3s-k8s-3d6d-e8e164-node-pool-c176