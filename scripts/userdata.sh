#!/bin/bash

yum update -y
amazon-linux-extras install epel -y
yum install nginx -y
yum install git -y
yum install gcc -y
yum install build-essential -y
yum install python3-pip python3-devel python3-setuptools -y

yum install ruby -y 

cd /home/ec2-user

region=$(curl http://169.254.169.254/latest/meta-data/placement/region)

aws s3 cp s3://aws-codedeploy-us-east-2/latest/install . --region $region

chmod +x ./install
./install auto


