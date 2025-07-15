#!/bin/bash

# NVM (Node Version Manager) Installation Script
# This script installs NVM for managing multiple Node.js versions

set -e  # Exit on any error

echo "🟢 Starting NVM installation..."

# Check if NVM is already installed
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "✅ NVM is already installed!"
    source "$HOME/.nvm/nvm.sh"
    echo "Current version: $(nvm --version)"
else
    echo "📥 Installing NVM..."

    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

    echo "🔧 Configuring shell environment..."

    # Add NVM to shell profiles
    {
        echo ''
        echo '# NVM Configuration'
        echo 'export NVM_DIR="$HOME/.nvm"'
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'
    } >> ~/.zshrc

    # Also add to bash profile for compatibility
    {
        echo ''
        echo '# NVM Configuration'
        echo 'export NVM_DIR="$HOME/.nvm"'
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm'
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'
    } >> ~/.bash_profile

    echo "✅ NVM installation completed!"
fi

# Load NVM for current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Verify installation
echo "🔍 Verifying installation..."
if command -v nvm >/dev/null 2>&1; then
    echo "✅ NVM is working correctly!"
    echo "Version: $(nvm --version)"

    echo "📋 Available Node.js versions (latest LTS):"
    nvm ls-remote --lts | tail -5

    # Install latest LTS Node.js
    echo "📥 Installing latest LTS Node.js..."
    nvm install --lts
    nvm use --lts
    nvm alias default node

    echo "✅ Node.js installation completed!"
    echo "Node.js version: $(node --version)"
    echo "NPM version: $(npm --version)"

else
    echo "❌ NVM installation failed!"
    echo "Please restart your terminal and try again."
    exit 1
fi

echo "🎉 NVM setup complete!"
echo ""
echo "💡 Usage examples:"
echo "   nvm install 18.17.0    # Install specific Node.js version"
echo "   nvm use 18.17.0        # Switch to specific version"
echo "   nvm ls                 # List installed versions"
echo "   nvm alias default 18   # Set default version"
echo ""
echo "⚠️  Please restart your terminal or run 'source ~/.zshrc' to use NVM commands."
