#!/bin/bash

EXISTING_NSG="k8s-nsg"
EXISTING_SUBNET="default"
EXISTING_VNET=$(az network vnet list -g ckaprep-rg --query [].name --output tsv)

# add vm named k8s2 to existing resource group named "ckaprep-rg" and existing vnet/subnet and apply existing nsg
az vm create -n k8s2 -g ckaprep-rg \
--image UbuntuLTS \
--custom-data cloud-init-k8s.yml \
--size Standard_B2s \
--location southcentralus \
--nsg $EXISTING_NSG \
--subnet $EXISTING_SUBNET \
--vnet-name $EXISTING_VNET \
--public-ip-sku Standard \
--admin-username azureuser \
--admin-password "KubernetesCKA001"