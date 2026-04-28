#!/bin/bash

set -e

export ARM_CLIENT_ID=${INPUT_ARM_CLIENT_ID}
export ARM_CLIENT_SECRET=${INPUT_ARM_CLIENT_SECRET}
export ARM_SUBSCRIPTION_ID=${INPUT_ARM_SUBSCRIPTION_ID}
export ARM_TENANT_ID=${INPUT_ARM_TENANT_ID}
export STATE_KEY=${INPUT_STATE_KEY}
export TF_STAGE=${INPUT_TF_STAGE}

if [[ "$TF_STAGE" == "terraform/stage1" ]]; then
  terraform -chdir=${TF_STAGE} init -backend-config="key=${STATE_KEY}.tfstate"
  terraform -chdir=${TF_STAGE} plan -out=${TF_STAGE}.tfplan
  terraform -chdir=${TF_STAGE} apply ${TF_STAGE}.tfplan

elif [[ "$TF_STAGE" == "terraform/stage2" ]]; then
  terraform -chdir=${TF_STAGE} init -backend-config="key=${STATE_KEY}.tfstate"
  terraform -chdir=${TF_STAGE} plan -out=${TF_STAGE}.tfplan
  terraform -chdir=${TF_STAGE} apply ${TF_STAGE}.tfplan
fi
