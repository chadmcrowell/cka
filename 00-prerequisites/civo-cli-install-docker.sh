#/bin/bash

# SOURCE: https://github.com/civo/cli#docker-usage

# (OPTION 1) map the API key for persistence
touch $HOME/.civo.json
docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:latest

# (OPTION 2) mount the kubeconfig in the container
touch $HOME/.civo.json
mkdir $HOME/.kube/
touch $HOME/.kube/config
docker run -it --rm -v $HOME/.civo.json:/.civo.json -v $HOME/.kube/config:$HOME/.kube/config civo/cli:latest

# set alias to civo commmand
alias civo="docker run -it --rm -v $HOME/.civo.json:/.civo.json civo/cli:latest"
# Maybe put the above line in ~/.bash_profile or ~/.zshrc
civo sshkey list
civo instance list
civo instance create --size g2.xsmall
civo k8s list

