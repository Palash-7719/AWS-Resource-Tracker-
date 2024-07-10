#############
#!/bin/bash
##########

#Author:Palash Lochan Mhapatra
#Date:7th July
#version:v1
#This Script will report the aws resource usage
#################
#
set -x
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
#To connect with a VM USing AWS EC2 instance & AWS CLI
ssh ubuntu@54.144.205.116 
#copy the public IP Address of the EC2 instance
#for granting the permission type yes
chmod 600 /Users/Downloads/test110.pem 
#chmod the key value pair
#Connected to EC2 instance AMI server of the created EC2 instance 
sudo snap install aws-cli --classic
#To check the version 
aws-cli --version
aws configure 
AWS Access key ID:
AWS Secret Access key:
Deafault region name:
Deafaullt output format:Json
chmod 777 aws_resource_tracker.sh
./aws_resource_tarcker.sh | more
#To open the script in a better understandable way 
./aws_resource_tarcker.sh | jq '.Reservations[].Instance[].InstanceID[]'
#jq is a parser for Json format to retrieve only the particular files
#####
#To integrate with the crontab 
#Crontab-used for scheduling tasks to run at specified times or intervals
crontab -e
#enter-1 for nano text editor
#for to run the script everyday at midnight
00***/path/to/aws_resource_tracker.sh
#for to run hourly
0****/path/to/aws_resource_tracker.sh
#for to run every 5 mins
*/5****/path/to/aws_resource_tracker.sh
#for to run every sunday at midnight
00**0/path/to/aws_resource_tracker.sh

