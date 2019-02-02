# ec2listtags
This Bash script is used along with AWS CLI commands to collect tags of EC2 intances and dump them into a CSV file.
Run this script form a teminal that has AWS CLI configured with the Access Key ID and Secret Access Key of a user from the AWS account.
The script uses json-query, so jq installation is required. 
