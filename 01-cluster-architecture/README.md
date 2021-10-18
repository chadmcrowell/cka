# Cluster Architecture, Installation & Configuration

<img src="https://github.com/kubernetes/kubernetes/raw/master/logo/logo.png" width="100">

----

## Objectives
* Manage role based access control (RBAC)
* Use kubeadm to install a basic cluster
* Manage a highly-available Kubernetes cluster
* Provision underlying infrastructure to deploy a Kubernetes cluster
* Perform a version upgrade on a Kubernetes cluster using Kubeadm
* Implement etcd backup and restore

---

## Challenges

> Please complete the following challenges by inserting a new file (YAML or SH) and insert the link to that file below the question. The first challenge is an example, and the rest are to be completed by you. Clone this repository and create a new branch. Once you are finished solving the challenges, create a pull request.

### 1. Creating a pod (example)
Create the YAML for a single pod that uses the nginx image and exposes port 80 from the container

[pod.yml](https://github.com/chadmcrowell/cka/blob/main/01-cluster-architecture/pod.yml)

> ---

### 2. Change the api server certificate
Using kubeadm, you've generated a new server certificate for your cluster API named `apiserver.crt`. Use your knowledge of the Kubernetes PKI infrastructure and locate the apiserver.crt file. Copy the file into this directory.

> ---
