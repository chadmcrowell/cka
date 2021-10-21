# Cluster Architecture, Installation & Configuration

<img src="https://github.com/kubernetes/kubernetes/raw/master/logo/logo.png" width="100">

## Table of contents

- [Objectives](#objectives)
- [Challenges](#challenges)

---

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

🔹

### 2. Get the API server certificate
Using kubeadm, you've generated a new server certificate for your cluster API named `apiserver.crt`. Use your knowledge of the Kubernetes PKI infrastructure and locate the apiserver.crt file. Copy the file into this directory.

🔹

### 3. Authenticate to the API
You are trying to access the cluster to retrive pod information, but you are receiving the following error:
```bash
The connection to the server localhost:8080 was refused - did you specify the right host or port?
```
Specify the `kubectl` command you can issue that will verify if your certificate is valid. Paste the command here (inside the code block):

```bash

```

🔹

### 4. Join nodes to a cluster
You need to add an additional node to your Kubernetes cluster using `kubeadm`. Specify the `kubeadm` commands required to add the node successfully and paste them here (inside the code block):

```bash

```

🔹

### 5. New User Authentication
John is a new member of your team, and he needs to access the API using kubectl, but only to view and list pods in the default namespace. Create a new kubeconfig for this user and apply the appropriate `role` and `roleBinding`. Copy the kubeconfig and two yaml files in this directory.


---

## Resources

- [Certifik8s: All You Need to Know about Certificates in Kubernetes](https://youtu.be/gXz4cq3PKdg)
- [Provisioning a CA and Generating TLS Certificates: Kubernetes the Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way/blob/master/docs/04-certificate-authority.md)
- 