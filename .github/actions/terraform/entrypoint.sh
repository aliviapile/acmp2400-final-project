#!/bin/bash
set -e

echo "Running Terraform command: $1"
terraform version
terraform $1
