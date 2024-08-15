#!/bin/bash

# Remove any existing Docker installations
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# Update package information
sudo apt-get update

# Install required packages for Docker installation
sudo apt-get install -y ca-certificates curl gnupg lsb-release

# Create a directory for Docker's GPG key
sudo mkdir -p /etc/apt/keyrings

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

# Update package information again
sudo apt-get update

# Install Docker Engine, CLI, and containerd
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose plugin
sudo apt-get install -y docker-compose-plugin

# Start Docker Compose in detached mode
sudo docker compose up -d
