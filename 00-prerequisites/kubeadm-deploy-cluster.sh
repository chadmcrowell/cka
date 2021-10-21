# set env variables
resourceGroupName="ckaprep-rg"
location="southcentralus"
deploymentName="ckaprep-deploy"

# create resource group
az group create -n $resourceGroupName -l $location

# deploy the vms
az deployment group create \
-g $resourceGroupName \
-n $deploymentName \
--template-file kubeadm-vm-deploy.json

# list public ip
az vm list-ip-addresses -g ckaprep-rg | grep ipAddress