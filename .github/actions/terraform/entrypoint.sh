#!/bin/sh
set -e

cd /github/workspace/terraform

terraform init
terraform plan
