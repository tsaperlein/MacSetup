#!/bin/bash

# Node.js Installation Script using NVM
# This script installs Node.js using NVM (not Homebrew)

set -e  # Exit on any error

echo "🟢 Starting Node.js installation via NVM..."

# Check if NVM is installed
if [ ! -s "$HOME/.nvm/nvm.sh" ]; then
    echo "❌ NVM is not installed!"
    echo "Please install NVM first by running the NVM setup script:"
    echo "cd ../nvm-setup && ./install-nvm.sh"
    exit 1
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

echo "✅ NVM is available!"
echo "NVM version: $(nvm --version)"

# Check current Node.js installation
if command -v node >/dev/null 2>&1; then
    echo "ℹ️  Node.js is already installed:"
    echo "Current version: $(node --version)"
    echo "NPM version: $(npm --version)"
    echo "Installation path: $(which node)"

    read -p "Do you want to install additional Node.js versions? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "✅ Keeping current Node.js installation"
        exit 0
    fi
fi

echo "📋 Available Node.js versions:"
echo "Latest LTS versions:"
nvm ls-remote --lts | tail -5

echo ""
echo "Latest current versions:"
nvm ls-remote | grep -E "v[0-9]+\." | tail -5

echo ""
echo "🎯 Installing recommended Node.js versions..."

# Install latest LTS version
echo "📥 Installing latest LTS Node.js..."
LTS_VERSION=$(nvm ls-remote --lts | tail -1 | tr -d ' ' | sed 's/.*v//')
nvm install --lts
nvm alias lts-latest "lts/*"

# Install latest stable version
echo "📥 Installing latest stable Node.js..."
LATEST_VERSION=$(nvm ls-remote | grep -E "v[0-9]+\." | tail -1 | tr -d ' ' | sed 's/.*v//')
nvm install "$LATEST_VERSION"
nvm alias latest "$LATEST_VERSION"

# Install Node.js 18 (another popular LTS)
echo "📥 Installing Node.js 18 LTS..."
NODE18_VERSION=$(nvm ls-remote | grep "v18\." | tail -1 | tr -d ' ' | sed 's/.*v//')
if [ -n "$NODE18_VERSION" ]; then
    nvm install "$NODE18_VERSION"
    nvm alias lts-18 "$NODE18_VERSION"
fi

# Set LTS as default
echo "🔧 Setting LTS as default version..."
nvm alias default lts/*
nvm use default

echo "✅ Node.js installation completed!"
echo ""
echo "📊 Installation Summary:"
echo "Default version: $(node --version)"
echo "NPM version: $(npm --version)"
echo "Installation path: $(which node)"

echo ""
echo "📋 Installed Node.js versions:"
nvm list

# Install useful global packages
echo ""
echo "📦 Installing useful global NPM packages..."

# Essential development tools
npm install -g npm@latest          # Update npm itself
npm install -g yarn                # Alternative package manager
npm install -g pnpm                # Fast, disk space efficient package manager
npm install -g typescript          # TypeScript compiler
npm install -g ts-node             # TypeScript execution environment
npm install -g nodemon             # Auto-restart development server
npm install -g pm2                 # Process manager for Node.js apps

# Code quality tools
npm install -g eslint              # JavaScript linter
npm install -g prettier            # Code formatter
npm install -g jshint              # JavaScript code quality tool

# Build and development tools
npm install -g webpack             # Module bundler
npm install -g vite                # Fast build tool
npm install -g create-react-app    # React application generator
npm install -g @vue/cli            # Vue.js CLI
npm install -g @angular/cli        # Angular CLI
npm install -g express-generator   # Express application generator

# Utility tools
npm install -g serve               # Static file server
npm install -g http-server         # Simple HTTP server
npm install -g json               # JSON processing tool
npm install -g uuid               # UUID generator
npm install -g ncu                # npm-check-updates

echo "✅ Global packages installation completed!"

echo ""
echo "🔍 Verifying installation..."
echo "Node.js: $(node --version)"
echo "NPM: $(npm --version)"
echo "Yarn: $(yarn --version)"
echo "TypeScript: $(tsc --version)"

echo ""
echo "🎉 Node.js setup complete!"
echo ""
echo "💡 Usage examples:"
echo "   nvm use lts/*           # Switch to latest LTS"
echo "   nvm use latest          # Switch to latest version"
echo "   nvm use 18              # Switch to Node.js 18"
echo "   nvm list                # List installed versions"
echo "   node --version          # Check current version"
echo "   npm install <package>   # Install local package"
echo "   npm install -g <package> # Install global package"
echo ""
echo "📝 Project setup example:"
echo "   mkdir myproject && cd myproject"
echo "   echo 'lts/*' > .nvmrc    # Pin Node.js version"
echo "   npm init -y              # Initialize package.json"
echo "   npm install express      # Install dependencies"
