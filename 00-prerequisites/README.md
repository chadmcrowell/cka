# 00-Pre-Requisites

## Installing a kubeadm cluster with containerd

```bash
# clone the repo
git clone https://github.com/chadmcrowell/cka.git && cd ./cka/00-prerequisites

# deploy two vm's for your k8s cluster
# public ip will be output
./kubeadm-deploy-cluster.sh

# (optional) set variables for node IPs
NODE0=<ip addreess>
NODE1=<ip address>

# log into the Node0 (control plane)
# password is KubernetesCKA001!!
ssh azureuser@$NODE0

# from SSH session on node0
./initialize-cluster.sh

# copy join command and login to node1
ssh azureuser@$NODE1

sudo kubeadm join

```

