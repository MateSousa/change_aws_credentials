#!/bin/bash

set -e
set -o pipefail

# This script will change the default AWS credentials to the ones provided by the user stored in the conf file in the same directory as this script.
# To run this script you must have the AWS CLI installed and configured with the default credentials.
# This script will also change the default region to the one provided by the user stored in the conf file(aws_credentials.conf) in the same directory as this script.
# To run this script go to ~/.bashrc and add the following line: alias aws_crd='source /path/to/change_aws_credentials.sh'
# Then run the script by typing aws_crd in the terminal.

# Get the path to the directory where this script is located.
DIR="$(dirname "${BASH_SOURCE[0]}")"

# Get the credentials from the conf file by the name provide by the user. 
# Example: 
# [company]
# aws_access_key_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# aws_secret_access_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

echo "Choose the number of the credential from the conf file:"
awk -F'[][]' '/\[/{print ++i ": " $2}' $DIR/aws_credentials.conf

read -p "Enter the number of the credential: " credential_number

credential_name=$(awk -F'[][]' '/\[/{print ++i ": " $2}' $DIR/aws_credentials.conf | grep "^$credential_number" | cut -d ':' -f2 | cut -d ' ' -f2)

aws_access_key_id=$(awk -F'=' '/aws_access_key_id/{print $2}' $DIR/aws_credentials.conf | sed -n "$credential_number"p)
aws_secret_access_key=$(awk -F'=' '/aws_secret_access_key/{print $2}' $DIR/aws_credentials.conf | sed -n "$credential_number"p)

echo "Changing the default credentials to the ones from the $credential_name section in the conf file."

# Change the default credentials in the AWS CLI.
aws configure set aws_access_key_id $aws_access_key_id
aws configure set aws_secret_access_key $aws_secret_access_key

echo "Credentials changed successfully! Bye!"
