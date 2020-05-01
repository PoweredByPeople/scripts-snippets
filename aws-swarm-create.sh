#!/bin/bash
# Script to automatically create a scaling test envrionment.
# Key value below is cluster size which is the number of docker swarm nodes this will create. You should be able 
# to run ~500 containers per host. 

aws cloudformation create-stack \
--stack-name Scaling \
--template-url https://editions-us-east-1.s3.amazonaws.com/aws/stable/Docker.tmpl \
--capabilities CAPABILITY_IAM \
--parameters ParameterKey=ClusterSize,ParameterValue=60 \
ParameterKey=EnableCloudStorEfs,ParameterValue=no \
ParameterKey=EnableCloudWatchLogs,ParameterValue=no \
ParameterKey=EnableEbsOptimized,ParameterValue=no \
ParameterKey=EnableSystemPrune,ParameterValue=no \
ParameterKey=EncryptEFS,ParameterValue=false \
ParameterKey=InstanceType,ParameterValue=t2.large \
ParameterKey=KeyName,ParameterValue=id_rsa \
ParameterKey=ManagerDiskSize,ParameterValue=20 \
ParameterKey=ManagerDiskType,ParameterValue=gp2 \
ParameterKey=ManagerInstanceType,ParameterValue=c5.2xlarge \
ParameterKey=ManagerSize,ParameterValue=3 \
ParameterKey=WorkerDiskSize,ParameterValue=20 \
ParameterKey=WorkerDiskType,ParameterValue=gp2
