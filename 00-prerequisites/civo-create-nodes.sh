#/bin/bash

# api key can be found in Settings > Preferences > Security
# API_KEY=<paste api key here>

# civo apikey add my_key $API_KEY

civo instance create --size g3.small --diskimage ubuntu-focal --sshkey chad --initialuser root --hostname k8s0 --wait

civo instance create --size g3.small --diskimage ubuntu-focal --sshkey chad --initialuser root --hostname k8s1 --wait

civo instance show k8s0 | grep "Public IP"

civo instance show k8s1 | grep "Public IP"