#!/bin/bash

# Replace/Add your regions in below variable list
region=("us-east-1" "us-east-2" "eu-west-3")
outputFile="InstanceTagsList.csv"


# Removing output file to overcome content overlap issues

if [ -f "$outputFile" ]; then

 rm -rf "$outputFile"
fi

# Getting List of instances into array and looping them..

for instance in ${region[@]};
do

#AWS CLI  command to get all tags details of each instance in the region specified..

aws ec2 describe-tags --region $instance  --filters "Name=resource-type,Values=instance" | jq -r '.Tags[] | "\(.ResourceId),\(.Key),\(.Value)"' >> "$outputFile"
done


#Output

#   <Instance ID>,<Tag Key>,<Tag Value>

# The output will be dumped into the redirected InstanceTagsList.csv file.

