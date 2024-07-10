#############
#!/bin/bash
##########

#Author:Palash Lochan Mhapatra
#Date:7th July
#version:v1
#This Script will report the aws resource usage
#################

#########
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM 
#####

#list all s3 buckets
echo "Print list of s3 buckets"
aws s3 ls
#
#list all ec2 instances
echo "Print list of ec2 instances"
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType,LaunchTime]' --output json

#
#list all lamda functions
echo "Print all lambda fuctions"
aws lambda list-functions
#
#list all iam users 
echo "Print all iam users"
aws iam list-users
#

