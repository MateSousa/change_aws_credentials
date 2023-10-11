#!/bin/bash

# This script install the change_aws_credentials.sh script and the aws_credentials.conf file in the user's home directory.
# It fetches the main script from a remote location and sets it up for use.


set -e
set -o pipefail

SCRIPT_URL="https://raw.githubusercontent.com/MateSousa/change_aws_credentials/main/change_aws_credentials.sh"
INSTALL_DIR="$HOME/.aws_crd"

echo "Installing the change_aws_credentials.sh script and the aws_credentials.conf file in the user's home directory."

echo "Creating the installation directory."
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
fi

echo "Downloading the change_aws_credentials.sh script."

curl -sSL "$SCRIPT_URL" -o "$INSTALL_DIR/change_aws_credentials.sh"

echo "Downloading the aws_credentials.conf file."
if [ ! -f "$INSTALL_DIR/aws_credentials.conf" ]; then
    touch "$INSTALL_DIR/aws_credentials.conf"
fi

echo "Setting up the script for use."
chmod +x "$INSTALL_DIR/change_aws_credentials.sh"



echo "Installation complete! please add the following line to your shell profile file(.bashrc, .zshrc, etc): " 
echo "alias aws_crd='source $INSTALL_DIR/change_aws_credentials.sh'"
echo "Then run the script by typing aws_crd in the terminal."


echo "Bye!"



