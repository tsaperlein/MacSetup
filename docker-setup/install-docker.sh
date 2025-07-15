#!/bin/bash

# Docker Installation Script for macOS
# This script installs Docker Desktop and essential Docker tools

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🐳 Docker Installation Script for macOS${NC}"
echo "==========================================="

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

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_error "Homebrew is not installed. Please install Homebrew first:"
    echo "Visit: https://brew.sh/"
    exit 1
fi

print_status "Updating Homebrew..."
brew update

# Install Docker Desktop
print_status "Installing Docker Desktop..."
if brew list --cask docker &> /dev/null; then
    print_warning "Docker Desktop is already installed"
else
    brew install --cask docker
fi

# Install Docker Compose (if not already included)
print_status "Installing Docker Compose..."
if command -v docker-compose &> /dev/null; then
    print_warning "Docker Compose is already installed"
else
    brew install docker-compose
fi

# Install additional Docker tools
print_status "Installing additional Docker tools..."

# Docker Machine (for managing Docker hosts)
if brew list docker-machine &> /dev/null; then
    print_warning "Docker Machine is already installed"
else
    brew install docker-machine
fi

# Docker Buildx (advanced build features)
print_status "Docker Buildx should be included with Docker Desktop"

# Lazydocker (TUI for Docker)
if brew list lazydocker &> /dev/null; then
    print_warning "Lazydocker is already installed"
else
    brew install lazydocker
fi

# Dive (tool for exploring Docker images)
if brew list dive &> /dev/null; then
    print_warning "Dive is already installed"
else
    brew install dive
fi

# Portainer (Docker management UI) - We'll provide instructions for this
print_status "Portainer installation instructions will be provided in README"

print_status "Starting Docker Desktop..."
open -a Docker

# Wait for Docker to start
print_status "Waiting for Docker to start (this may take a minute)..."
while ! docker system info &> /dev/null; do
    sleep 5
done

print_status "Docker is now running!"

# Verify installation
print_status "Verifying Docker installation..."
docker --version
docker-compose --version

# Test Docker with hello-world
print_status "Testing Docker with hello-world container..."
docker run hello-world

print_status "Setting up useful Docker aliases..."
# Add Docker aliases to shell profile
SHELL_PROFILE=""
if [[ "$SHELL" == *"zsh"* ]]; then
    SHELL_PROFILE="$HOME/.zshrc"
elif [[ "$SHELL" == *"bash"* ]]; then
    SHELL_PROFILE="$HOME/.bashrc"
fi

if [[ -n "$SHELL_PROFILE" ]]; then
    echo "" >> "$SHELL_PROFILE"
    echo "# Docker aliases" >> "$SHELL_PROFILE"
    echo "alias dps='docker ps'" >> "$SHELL_PROFILE"
    echo "alias dpa='docker ps -a'" >> "$SHELL_PROFILE"
    echo "alias di='docker images'" >> "$SHELL_PROFILE"
    echo "alias drmi='docker rmi'" >> "$SHELL_PROFILE"
    echo "alias drm='docker rm'" >> "$SHELL_PROFILE"
    echo "alias dstop='docker stop'" >> "$SHELL_PROFILE"
    echo "alias dstart='docker start'" >> "$SHELL_PROFILE"
    echo "alias drestart='docker restart'" >> "$SHELL_PROFILE"
    echo "alias dexec='docker exec -it'" >> "$SHELL_PROFILE"
    echo "alias dlogs='docker logs'" >> "$SHELL_PROFILE"
    echo "alias dclean='docker system prune -f'" >> "$SHELL_PROFILE"
    echo "alias dcleanall='docker system prune -a -f'" >> "$SHELL_PROFILE"
    echo "alias dcup='docker-compose up'" >> "$SHELL_PROFILE"
    echo "alias dcdown='docker-compose down'" >> "$SHELL_PROFILE"
    echo "alias dcbuild='docker-compose build'" >> "$SHELL_PROFILE"
    echo "alias dcpull='docker-compose pull'" >> "$SHELL_PROFILE"
    
    print_status "Docker aliases added to $SHELL_PROFILE"
    print_warning "Please restart your terminal or run 'source $SHELL_PROFILE' to use the aliases"
fi

echo ""
echo -e "${GREEN}✅ Docker installation completed successfully!${NC}"
echo ""
echo "Next steps:"
echo "1. Docker Desktop should be running in your Applications"
echo "2. Restart your terminal to use the new aliases"
echo "3. Check the README.md for usage examples and tips"
echo "4. Consider setting up Portainer for a web-based Docker management interface"
echo ""
echo "Useful commands to get started:"
echo "- docker --version"
echo "- docker ps"
echo "- docker images"
echo "- lazydocker (for a nice TUI interface)"
