#!/bin/bash

set -e

AWS_REGION="us-east-1"

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

FRONTEND_IMAGE="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/frontend:latest"
BACKEND_IMAGE="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/backend:latest"

echo "Starting deployment..."

cd ../terraform

echo "Initializing Terraform..."
terraform init

echo "Applying Infrastructure..."
terraform apply -auto-approve \
  -var="frontend_image=$FRONTEND_IMAGE" \
  -var="backend_image=$BACKEND_IMAGE"

echo "Re-applying for Kubernetes resources..."
terraform apply -auto-approve \
  -var="frontend_image=$FRONTEND_IMAGE" \
  -var="backend_image=$BACKEND_IMAGE"

echo "Deployment completed."
