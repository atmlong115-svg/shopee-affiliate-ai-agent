#!/bin/bash

# Setup script for Shopee Affiliate AI Agent

# Update and install necessary packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip git

# Clone the repository
if [ ! -d "shopee-affiliate-ai-agent" ]; then
  git clone https://github.com/atmlong115-svg/shopee-affiliate-ai-agent.git
fi

# Change directory
cd shopee-affiliate-ai-agent

# Install Python dependencies
pip3 install -r requirements.txt

# Initialize the application
python3 main.py

echo "Setup completed successfully!"