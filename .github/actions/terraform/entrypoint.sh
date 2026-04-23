#!/bin/sh
set -e

cd /github/workspace/terraform

echo "Running Terraform..."

terraform init
terraform validate
terraform plan
