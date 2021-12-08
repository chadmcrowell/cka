#!/bin/bash

# This script prepares a generic Kubernetes 1.15.7 server with kubeadm.
# It is configured with the assumption that flannel will be used for networking.

# Designed for Ubuntu 20.04 LTS

KUBE_VERSION=1.22.2

# disable swapoff
sudo swapoff -a

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system

# Update the apt package index
sudo apt-get update

# Install the containerd.io package
sudo apt install -y containerd

# Configure containerd
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml

# restart containerd
sudo systemctl restart containerd

# Add Kubernetes gpg key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add Kubernetes stable apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the apt package index
sudo apt-get update

# Install kubelet, kubeadm and kubectl packages
sudo apt-get install -y kubelet=${KUBE_VERSION}-00 kubeadm=${KUBE_VERSION}-00 kubectl=${KUBE_VERSION}-00

# hold package versions
sudo apt-mark hold kubelet kubeadm kubectl

# download weavenet config
sudo wget -O /home/azureuser/weavenet.yml "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# download init script for control plane node
sudo wget -O /home/azureuser/initialize-cluster.sh https://raw.githubusercontent.com/chadmcrowell/cka/main/00-prerequisites/initialize-cluster.sh

sudo chmod +x /home/azureuser/initialize-cluster.sh