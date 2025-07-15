#!/bin/bash

# Docker Prerequisites Check Script
# Run this before installing Docker to ensure your system is ready

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Docker Prerequisites Check${NC}"
echo "============================="

# Function to print colored output
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[⚠]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

ERRORS=0

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only."
    ((ERRORS++))
else
    print_status "Running on macOS"
fi

# Check macOS version
MACOS_VERSION=$(sw_vers -productVersion)
print_status "macOS version: $MACOS_VERSION"

# Check if Homebrew is installed
if command -v brew &> /dev/null; then
    BREW_VERSION=$(brew --version | head -n1)
    print_status "Homebrew is installed: $BREW_VERSION"
else
    print_error "Homebrew is not installed"
    echo "  Install from: https://brew.sh/"
    ((ERRORS++))
fi

# Check available disk space
AVAILABLE_SPACE=$(df -h / | awk 'NR==2 {print $4}')
print_status "Available disk space: $AVAILABLE_SPACE"

# Check RAM
TOTAL_RAM=$(system_profiler SPHardwareDataType | awk '/Memory:/ {print $2 " " $3}')
print_status "Total RAM: $TOTAL_RAM"

# Check hardware architecture and virtualization support
ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    print_status "Apple Silicon Mac detected ($ARCH) - Full virtualization support available"
elif [[ "$ARCH" == "x86_64" ]]; then
    # Check for Intel virtualization features
    if sysctl -n machdep.cpu.features 2>/dev/null | grep -q VMX; then
        print_status "Intel Mac with VMX virtualization support detected"
    else
        # All Intel Macs from 2006+ support virtualization, even if VMX flag isn't visible
        print_status "Intel Mac detected - Virtualization supported (all Intel Macs 2006+)"
    fi
else
    print_status "Architecture: $ARCH - Should support Docker"
fi

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version)
    print_warning "Docker is already installed: $DOCKER_VERSION"
else
    print_status "Docker not found (ready for fresh installation)"
fi

# Check if Docker Desktop is running
if pgrep -f "Docker Desktop" > /dev/null; then
    print_warning "Docker Desktop is currently running"
else
    print_status "Docker Desktop is not running"
fi

echo ""
echo "=============================="
if [ $ERRORS -eq 0 ]; then
    echo -e "${GREEN}✅ All prerequisites met! Ready to install Docker.${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Run ./install-docker.sh to install Docker"
    echo "2. Optionally run ./setup-portainer.sh for web management interface"
else
    echo -e "${RED}❌ $ERRORS issue(s) found. Please resolve them before installing Docker.${NC}"
fi
echo ""
