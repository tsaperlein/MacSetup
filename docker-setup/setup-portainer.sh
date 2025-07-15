#!/bin/bash

# Portainer Setup Script for Docker
# This script installs and configures Portainer for Docker management

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🐳 Portainer Setup Script${NC}"
echo "=========================="

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is running
if ! docker system info &> /dev/null; then
    print_error "Docker is not running. Please start Docker Desktop first."
    exit 1
fi

print_status "Creating Portainer volume..."
docker volume create portainer_data

print_status "Starting Portainer container..."
docker run -d \
    -p 8000:8000 \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest

print_status "Waiting for Portainer to start..."
sleep 10

echo ""
echo -e "${GREEN}✅ Portainer has been installed successfully!${NC}"
echo ""
echo "Access Portainer at:"
echo "- HTTPS: https://localhost:9443"
echo "- HTTP: http://localhost:8000"
echo ""
echo "First-time setup:"
echo "1. Open https://localhost:9443 in your browser"
echo "2. Create an admin account"
echo "3. Select 'Docker' as the environment"
echo "4. Start managing your Docker containers!"
echo ""
echo "To stop Portainer: docker stop portainer"
echo "To start Portainer: docker start portainer"
echo "To remove Portainer: docker rm -f portainer && docker volume rm portainer_data"
