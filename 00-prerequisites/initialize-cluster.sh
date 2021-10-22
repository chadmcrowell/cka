# initialize the cluster
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# set config and permissions
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown azureuser:azureuser $HOME/.kube/config

# apply the cni
kubectl apply -f /root/weavenet.yml