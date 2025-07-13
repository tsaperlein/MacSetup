#!/bin/bash

# NPM Reset Function Installer
# This script installs the npmreset function globally on your system

echo "🚀 Installing NPM Reset Function..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NPMRESET_SCRIPT="$SCRIPT_DIR/npmreset.sh"

# Check if npmreset.sh exists
if [ ! -f "$NPMRESET_SCRIPT" ]; then
    echo "❌ Error: npmreset.sh not found in $SCRIPT_DIR"
    exit 1
fi

# Detect shell type
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
    SHELL_NAME="Zsh"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
    SHELL_NAME="Bash"
else
    # Default to zsh since it's default on macOS
    SHELL_CONFIG="$HOME/.zshrc"
    SHELL_NAME="Zsh (default)"
fi

echo "📝 Detected shell: $SHELL_NAME"
echo "📁 Config file: $SHELL_CONFIG"

# Create backup of shell config
if [ -f "$SHELL_CONFIG" ]; then
    cp "$SHELL_CONFIG" "$SHELL_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
    echo "💾 Backup created: $SHELL_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Check if npmreset is already installed
if grep -q "npmreset.sh" "$SHELL_CONFIG" 2>/dev/null; then
    echo "⚠️  NPM Reset function appears to already be installed."
    read -p "Do you want to reinstall? (y/n): " -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Installation cancelled."
        exit 0
    fi
    
    # Remove existing line
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' '/npmreset\.sh/d' "$SHELL_CONFIG"
    else
        # Linux
        sed -i '/npmreset\.sh/d' "$SHELL_CONFIG"
    fi
fi

# Add source line to shell config
echo "" >> "$SHELL_CONFIG"
echo "# NPM Reset Function" >> "$SHELL_CONFIG"
echo "source \"$NPMRESET_SCRIPT\"" >> "$SHELL_CONFIG"

echo "✅ NPM Reset function installed successfully!"
echo ""
echo "🔄 To start using it immediately, run:"
echo "   source $SHELL_CONFIG"
echo ""
echo "🎯 Or restart your terminal and then you can use:"
echo "   npmreset"
echo ""
echo "📖 Usage: Navigate to any Node.js project directory and run 'npmreset'"