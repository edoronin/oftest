#!/bin/sh
brew install awscli &&
brew install kops &&
echo "Starting deployment" &&
aws configure --profile admin
bucket_name=imesh-kops-state-store-webservice001 &&
aws s3api create-bucket \
    --bucket ${bucket_name} \
    --region us-east-1 \
    --profile admin &&
aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled --profile admin &&
export KOPS_CLUSTER_NAME=imesh.k8s.local &&
export KOPS_STATE_STORE=s3://${bucket_name} &&
kops create cluster \
    --node-count=2 \
    --node-size=t2.micro \
    --master-size=t2.micro \
    --zones=us-east-1a \
    --name=${KOPS_CLUSTER_NAME}