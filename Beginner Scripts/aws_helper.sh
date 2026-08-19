#!/bin/bash

echo "=============================="
echo "          AWS HELPER"
echo "=============================="

echo ""
echo "1. AWS CLI VERSION"
aws --version

echo ""
echo "2. AWS IDENTITY"
aws sts get-caller-identity

echo ""
echo "3. S3 BUCKETS"
aws s3 ls

echo ""
echo "4. EC2 INSTANCES"
aws ec2 describe-instances \
--query "Reservations[].Instances[].{ID:InstanceId,State:State.Name,Type:InstanceType}" \
--output table

echo ""
echo "=============================="
echo "       AWS CHECK COMPLETED"
echo "=============================="