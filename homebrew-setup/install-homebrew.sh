#!/bin/bash

# Homebrew Installation Script
# This script installs Homebrew - The missing package manager for macOS

set -e  # Exit on any error

echo "🍺 Starting Homebrew installation..."

# Check if Homebrew is already installed
if command -v brew >/dev/null 2>&1; then
    echo "✅ Homebrew is already installed!"
    echo "Current version: $(brew --version | head -n1)"

    echo "🔄 Updating Homebrew..."
    brew update
    brew upgrade

    echo "🧹 Cleaning up..."
    brew cleanup
else
    echo "📥 Installing Homebrew..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo "🔧 Configuring PATH for Apple Silicon..."
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "🔧 Configuring PATH for Intel Macs..."
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    echo "✅ Homebrew installation completed!"
fi

# Verify installation
echo "🔍 Verifying installation..."
if command -v brew >/dev/null 2>&1; then
    echo "✅ Homebrew is working correctly!"
    echo "Version: $(brew --version | head -n1)"
    echo "Installation path: $(which brew)"

    echo "📋 Running brew doctor..."
    brew doctor
else
    echo "❌ Homebrew installation failed!"
    exit 1
fi

echo "🎉 Homebrew setup complete!"
echo "💡 You can now install packages using 'brew install <package-name>'"
echo "💡 To install GUI applications, use 'brew install --cask <app-name>'"
