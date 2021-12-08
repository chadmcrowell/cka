# initialize the cluster
rm /root/.kube/config
kubeadm init --kubernetes-version=${KUBE_VERSION} --ignore-preflight-errors=NumCPU --skip-token-print

# set config and permissions
mkdir -p ~/.kube
sudo cp -i /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# apply the cni
# workaround due to: https://github.com/weaveworks/weave/issues/3927
kubectl apply -f ${HOME}/weave.yaml
rm weave.yaml

echo
echo "### COPY AND PASTE THIS IN THE WORKER NODE ###"
kubeadm token create --print-join-command --ttl 0