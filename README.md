# AWS Credentials Automation Script

## Purpose

This script automates the process of changing AWS credentials without the need for manual modifications to the AWS credentials file. It enables users to select AWS credentials from a configuration file and set them as default in the AWS CLI.

## Prerequisites

Before using this script, ensure that you have the following prerequisites in place:

- **AWS CLI**: The AWS Command Line Interface must be installed and configured with the default AWS credentials.

## Installation

To install the AWS Credentials Automation Script, follow these steps:

1. Download the installation script:

    ```bash
    curl -sSL https://raw.githubusercontent.com/MateSousa/change_aws_credentials/main/install.sh | bash
    ```

2. The installation script will create an installation directory in your home directory and download the main script and a sample `aws_credentials.conf` file.

3. After the installation is complete, add the following line to your shell profile file (e.g., `~/.bashrc`, `~/.zshrc`, etc.):

    ```bash
    alias aws_crd='source $HOME/.aws_crd/change_aws_credentials.sh'
    ```

4. Save your shell profile file and either source it or restart your terminal for the changes to take effect.

5. To use the script, open a new terminal session and execute the following command:

    ```bash
    aws_crd
    ```

6. The script will prompt you to choose a set of credentials from the `aws_credentials.conf` file. Enter the corresponding number, and it will update the AWS CLI configuration with the selected credentials.

## Example `aws_credentials.conf` File

```ini
[company]
aws_access_key_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## Important Notes

- The script uses the `aws configure` command to update AWS credentials and regions, so it relies on the AWS CLI being correctly installed and configured.

- Ensure that the `aws_credentials.conf` file is correctly formatted and contains the necessary credentials.

- Be cautious when running this script, as it can change the AWS CLI configuration. Ensure you select the correct credentials to avoid any unexpected behavior.

- Always keep your AWS credentials and configuration files secure to prevent unauthorized access.

## Disclaimer

This script is provided as-is and is not officially endorsed or supported by AWS. Use it at your own risk and ensure proper testing in a safe environment before deploying it in a production setting.


