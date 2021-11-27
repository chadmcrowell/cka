#!/bin/bash

az group create -n ckapreparation-rg -l eastus

az network vnet create \
--resource-group ckapreparation-rg \
--name k8s-cka-vnet \
--address-prefix 2.0.0.0/16 \
--subnet-name default \
--subnet-prefix 2.0.0.0/24

az network nsg create \
--resource-group ckapreparation-rg \
--name k8s-cka-nsg

az network nsg rule create \
--resource-group ckapreparation-rg \
--nsg-name k8s-cka-nsg \
--name web \
--source-address-prefixes '*' \
--destination-address-prefixes '*' \
--priority 1001 \
--protocol tcp \
--destination-port-ranges 80 443 22 6443

az network nsg rule create \
--resource-group ckapreparation-rg \
--nsg-name k8s-cka-nsg \
--name nodeport \
--source-address-prefixes '*' \
--destination-address-prefixes '*' \
--priority 1011 \
--protocol tcp \
--destination-port-ranges 30000-32767

az network nsg rule create \
--resource-group ckapreparation-rg \
--nsg-name k8s-cka-nsg \
--name etcd \
--source-address-prefixes VirtualNetwork \
--destination-address-prefixes VirtualNetwork \
--priority 1021 \
--protocol tcp \
--destination-port-ranges 2379-2380

az network nsg rule create \
--resource-group ckapreparation-rg \
--nsg-name k8s-cka-nsg \
--name controller \
--source-address-prefixes VirtualNetwork \
--destination-address-prefixes VirtualNetwork \
--priority 1031 \
--protocol tcp \
--destination-port-ranges 10250-10252

for i in `seq 1 3`; do
    az vm create \
    --resource-group ckapreparation-rg \
    --name controller-$i \
    --image UbuntuLTS \
    --size Standard_D2s_v3 \
    --admin-username azureuser \
    --admin-password "KubernetesCKA001" \
    --nsg k8s-cka-nsg \
    --subnet default \
    --vnet-name k8s-cka-vnet \
    --public-ip-sku Standard \
    --no-wait
done

for i in `seq 1 3`; do
    az vm create \
    --resource-group ckapreparation-rg \
    --name worker-$i \
    --image UbuntuLTS \
    --size Standard_B2s \
    --admin-username azureuser \
    --admin-password "KubernetesCKA001" \
    --nsg k8s-cka-nsg \
    --subnet default \
    --vnet-name k8s-cka-vnet \
    --public-ip-sku Standard \
    --no-wait
done

az vm list -g ckapreparation-rg --query [].name
az vm list-ip-addresses -g ckapreparation-rg | grep ipAddress

