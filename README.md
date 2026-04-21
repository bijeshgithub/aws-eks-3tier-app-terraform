🚀 Deploy a Three-Tier Application on AWS EKS using Terraform

Welcome to the official repository for deploying a Three-Tier Todo List Application on AWS EKS using Terraform and Kubernetes! This project demonstrates how to build, containerize, and deploy a production-style architecture in the cloud using best DevOps practices.

--------------------------------------------------------------------------------------------------

📁 Project Structure

3-tier-app-Deployment/

├── backend/                                                 # Node.js backend code

├── frontend/                                                # React frontend code

├── mongo/                                                   # MongoDB Kubernetes manifests

├── k8s_manifests/                                           # K8s manifests for frontend, backend, ingress

└── terra-config/                                            # Terraform files to provision AWS infrastructure

--------------------------------------------------------------------------------------------------

⚙️ Technologies Used
Terraform (Infrastructure as Code)

Amazon EKS (Kubernetes Cluster)

Amazon ECR (Docker image registry)

Amazon S3 (Terraform remote state storage)

Kubernetes (App deployment & orchestration)

Helm (Load Balancer controller installation)

React + Node.js + MongoDB (Application stack)
---------------------------------------------------------------------------------------------------
📦 Prerequisites
Make sure you have the following installed and configured:

 AWS Account + IAM user with AdministratorAccess
 
 AWS CLI
 
 Docker
 
 Terraform
 
 kubectl
 
 eksctl
 
 helm


--------------------------------------------------------------------------------------------------

==============================================================================

Reality looks like this:

----s3 bucket created, Versioning enabled, security layes AES256 added, dynomodb state lockind setup & files upload ------

bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/bootstarp

$ aws s3 ls s3://bijesh-s3-bucket
2026-03-31 17:38:19       3058 Accenture JD.txt


================================================================================



===========================================


bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/terraform (master)

$ aws eks --region us-east-1 update-kubeconfig --name my-eks

Added new context arn:aws:eks:us-east-1:906482382692:cluster/my-eks to C:\Users\bijes\.kube\config

bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/terraform (master)

$ kubectl get nodes
NAME                         STATUS   ROLES    AGE   VERSION
ip-10-0-3-232.ec2.internal   Ready    <none>   34m   v1.35.2-eks-f69f56f
ip-10-0-4-124.ec2.internal   Ready    <none>   34m   v1.35.2-eks-f69f56f

---------------------------------------------------------------------------------------------

bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/terraform (master)

$ kubectl get pods -A

NAMESPACE     NAME                       READY   STATUS    RESTARTS   AGE
kube-system   aws-node-nwlkq             2/2     Running   0          36m
kube-system   aws-node-qkrnh             2/2     Running   0          36m
kube-system   coredns-7bc7c74875-9hcx5   1/1     Running   0          38m
kube-system   coredns-7bc7c74875-v2jq2   1/1     Running   0          38m
kube-system   kube-proxy-cxsmm           1/1     Running   0          36m
kube-system   kube-proxy-dbwfv           1/1     Running   0          36m

--------------------------------------------------------------------------------------------
bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/terraform (master)

$ kubectl cluster-info

Kubernetes control plane is running at https://D541C99D8BD79350153260CD045EEAFB.gr7.us-east-1.eks.amazonaws.com

CoreDNS is running at https://D541C99D8BD79350153260CD045EEAFB.gr7.us-east-1.eks.amazonaws.com/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

-------------------------------------------------------------------------------------------
bijes@Bijesh MINGW64 /d/PROJECTS - CICD/aws-eks-3tier-app-terraform/terraform (master)

$ kubectl get pods -A

NAMESPACE     NAME                                            READY   STATUS    RESTARTS   AGE
app           backend-7575f84f47-27sgt                        1/1     Running   0          62s
app           backend-7575f84f47-nx465                        1/1     Running   0          62s
app           frontend-bd64857cf-9xlk6                        1/1     Running   0          62s
app           frontend-bd64857cf-dccmk                        1/1     Running   0          62s
kube-system   aws-load-balancer-controller-5cb49545f7-lbw7x   1/1     Running   0          12m
kube-system   aws-load-balancer-controller-5cb49545f7-whfcb   1/1     Running   0          12m
kube-system   aws-node-v67z6                                  2/2     Running   0          14m
kube-system   aws-node-zx7bt                                  2/2     Running   0          12m
kube-system   coredns-7bc7c74875-h687h                        1/1     Running   0          8h
kube-system   coredns-7bc7c74875-pnt6s                        1/1     Running   0          8h
kube-system   kube-proxy-89sqf                                1/1     Running   0          12m
kube-system   kube-proxy-d42l4                                1/1     Running   0          14m








