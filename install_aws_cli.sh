#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y unzip curl

# Download the AWS CLI installation file
echo "Downloading AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded file
echo "Unzipping AWS CLI..."
unzip awscliv2.zip

# Install AWS CLI
echo "Installing AWS CLI..."
sudo ./aws/install

# Verify installation
echo "Verifying AWS CLI installation..."
aws --version

# Cleanup
echo "Cleaning up..."
rm -rf awscliv2.zip aws/

echo "AWS CLI installation completed."
