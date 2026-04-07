#!/bin/bash

set -e

AWS_REGION="us-east-1"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

FRONTEND_REPO="frontend"
BACKEND_REPO="backend"

echo "Logging into ECR..."

aws ecr get-login-password --region $AWS_REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Create repos if not exist
aws ecr describe-repositories --repository-names $FRONTEND_REPO || \
aws ecr create-repository --repository-name $FRONTEND_REPO

aws ecr describe-repositories --repository-names $BACKEND_REPO || \
aws ecr create-repository --repository-name $BACKEND_REPO

# Tag images
docker tag frontend:latest $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$FRONTEND_REPO:latest
docker tag backend:latest  $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$BACKEND_REPO:latest

# Push images
echo " Pushing images..."
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$FRONTEND_REPO:latest
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$BACKEND_REPO:latest

echo "Push completed."

echo "Frontend Image:"
echo "$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$FRONTEND_REPO:latest"

echo "Backend Image:"
echo "$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$BACKEND_REPO:latest"

