#!/bin/sh
set -e

echo "Current directory:"
pwd

echo "Listing files:"
ls -la

cd terraform

echo "Now inside terraform folder:"
pwd
ls -la

echo "Running Terraform..."

terraform init
terraform validate
terraform plan
