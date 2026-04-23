#!/bin/sh
set -e

cd terraform

echo "Running Terraform..."

terraform init
terraform validate
terraform plan
