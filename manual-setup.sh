#!/bin/sh

# Set AWS credentials
export AWS_ACCESS_KEY_ID={your_access_key_id}
export AWS_SECRET_ACCESS_KEY={your_secret_access_key}

# Create S3 bucket for Terraform state
aws s3api create-bucket --bucket dotnetapp-terraform-dev --region us-east-1
aws s3api put-bucket-versioning --bucket dotnetapp-terraform-dev --versioning-configuration Status=Enabled
aws s3 ls s3://dotnetapp-terraform-dev

# After test delete the bucket
## delete all versions in the bucket
aws s3 rm s3://dotnetapp-terraform-dev --recursive
## delete the bucket (from AWS console cleanup the bucket)
aws s3api delete-bucket --bucket dotnetapp-terraform-dev

# Create EKS cluster
eksctl create cluster \
--name dotnetapp \
--region=us-east-1 \
--nodegroup-name dotnetapp-workers \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 4 \
--managed

