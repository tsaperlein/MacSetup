#!/bin/bash

# Global .gitignore Setup Script
# This script creates a global .gitignore file and configures Git to use it

set -e  # Exit on any error

echo "🚀 Setting up Global .gitignore Configuration..."
echo ""

# Define the global .gitignore file path
GITIGNORE_PATH="$HOME/.gitignore"

# Create the global .gitignore file
echo "📝 Creating global .gitignore file at $GITIGNORE_PATH"
cat > "$GITIGNORE_PATH" << 'EOF'
# Folder view configuration files
.DS_Store
Desktop.ini

# Thumbnail cache files
._*
Thumbs.db

# Files that might appear on external disks
.Spotlight-V100
.Trashes

# Compiled Python files
*.pyc

# Compiled C++ files
*.out

# Application specific files
venv
node_modules
.sass-cache

# Node.js
npm-debug.log

# WebStorm/IntelliJ
.idea/

# Vi/Vim
*~

# General log files
log/
*.log
EOF

echo "✅ Global .gitignore file created successfully"
echo ""

# Configure Git to use the global .gitignore
echo "🔧 Configuring Git to use the global .gitignore file..."
git config --global core.excludesfile "$GITIGNORE_PATH"

echo "✅ Git configured to use global .gitignore"
echo ""

# Verify the configuration
echo "🔍 Verifying Git configuration..."
CONFIGURED_PATH=$(git config --global core.excludesfile)

if [ "$CONFIGURED_PATH" = "$GITIGNORE_PATH" ]; then
    echo "✅ Configuration verified successfully!"
    echo "   Global .gitignore path: $CONFIGURED_PATH"
else
    echo "❌ Configuration verification failed!"
    echo "   Expected: $GITIGNORE_PATH"
    echo "   Got: $CONFIGURED_PATH"
    exit 1
fi

echo ""
echo "🎉 Global .gitignore setup complete!"
echo ""
echo "📋 Summary:"
echo "   • Global .gitignore file created at: $GITIGNORE_PATH"
echo "   • Git configured to use the global .gitignore"
echo "   • Configuration verified successfully"
echo ""
echo "💡 Note: This will apply to all new Git repositories on this machine."
echo "   Existing repositories will also respect these global ignore rules."