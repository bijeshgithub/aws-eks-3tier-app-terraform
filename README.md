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


