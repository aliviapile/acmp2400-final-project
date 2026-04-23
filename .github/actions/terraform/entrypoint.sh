#!/bin/sh
set -e

cd /github/workspace

echo "Running Terraform..."

terraform init
terraform validate
terraform plan
