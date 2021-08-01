#!/usr/bin/env bash
set -e

source vars.sh

# Start from a clean slate
#rm -rf .terraform

terraform init \
    -backend=true \
    -backend-config key="${TF_STATE_OBJECT_KEY}" \
    -backend-config bucket="${TF_STATE_BUCKET}"

terraform plan \
    -input=false \
    -out=tf.plan

terraform apply \
    -input=false \
    -auto-approve=true \
    tf.plan

#terraform destroy \
 #  -input=false \
 # -auto-approve=true 

