#!/bin/bash

read -p " Are you sure you want to destroy ALL resources? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
  echo "❌ Aborted"
  exit 1
fi

terraform destroy
