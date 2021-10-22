# 00-Pre-Requisites

## Installing a kubeadm cluster with containerd

```bash
# clone the repo
git clone https://github.com/chadmcrowell/cka.git && cd ./cka/00-prerequisites

# deploy the vm's for your k8s cluster
./kubeadm-deploy-cluster.sh

# log into the Node0 (control plane)
ssh azureuser@$NODE0

# from SSH session on node0
./initialize-cluster.sh



```

