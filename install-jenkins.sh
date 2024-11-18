#!/bin/bash

# Update the package list
apt-get update -y

# Install prerequisites
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package list again
apt-get update -y

# Install Docker
apt-get install -y docker-ce

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add the current user to the Docker group
usermod -aG docker ${USER}

# Create Jenkins home directory
mkdir -p /var/jenkins_home
chown -R 1000:1000 /var/jenkins_home

# Run the Jenkins container
docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins jenkins/jenkins:lts

# Output endpoint
echo "Jenkins is installed and running. Access it at http://<server-ip>:8080"
