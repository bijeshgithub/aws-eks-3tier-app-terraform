#!/bin/bash

set -e

echo " Building Docker images..."

# Frontend
docker build -t frontend:latest ../app/frontend

# Backend
docker build -t backend:latest ../app/backend

echo " Build completed."
