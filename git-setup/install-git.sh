#!/bin/bash

# Git Installation and Configuration Script
# This script installs Git via Homebrew and configures it for development

set -e  # Exit on any error

echo "🐙 Starting Git installation and configuration..."

# Check if Homebrew is available
if ! command -v brew >/dev/null 2>&1; then
    echo "❌ Homebrew is not installed!"
    echo "Please install Homebrew first by running the Homebrew setup script:"
    echo "cd ../homebrew-setup && ./install-homebrew.sh"
    exit 1
fi

echo "✅ Homebrew is available!"

# Check if Git is already installed
if command -v git >/dev/null 2>&1; then
    echo "ℹ️  Git is already installed:"
    echo "Current version: $(git --version)"
    echo "Installation path: $(which git)"

    # Check if it's the system Git or Homebrew Git
    GIT_PATH=$(which git)
    if [[ $GIT_PATH == "/usr/bin/git" ]]; then
        echo "⚠️  You're using the system Git. Installing Homebrew Git for better features..."
        brew install git
        echo "🔧 Please restart your terminal to use the new Git installation."
    else
        echo "✅ You're already using Homebrew Git"
        echo "🔄 Updating Git..."
        brew upgrade git || echo "Git is already up to date"
    fi
else
    echo "📥 Installing Git via Homebrew..."
    brew install git
    echo "✅ Git installation completed!"
fi

# Verify Git installation
echo "🔍 Verifying Git installation..."
echo "Git version: $(git --version)"
echo "Git path: $(which git)"

# Configure Git
echo ""
echo "🔧 Configuring Git..."

# Get user information
echo "Please provide your Git configuration details:"

# Check if user.name is already set
CURRENT_NAME=$(git config --global user.name 2>/dev/null || echo "")
if [ -n "$CURRENT_NAME" ]; then
    echo "Current name: $CURRENT_NAME"
    read -p "Keep current name? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        read -p "Enter your full name: " USER_NAME
        git config --global user.name "$USER_NAME"
    fi
else
    read -p "Enter your full name: " USER_NAME
    git config --global user.name "$USER_NAME"
fi

# Check if user.email is already set
CURRENT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")
if [ -n "$CURRENT_EMAIL" ]; then
    echo "Current email: $CURRENT_EMAIL"
    read -p "Keep current email? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        read -p "Enter your email address: " USER_EMAIL
        git config --global user.email "$USER_EMAIL"
    fi
else
    read -p "Enter your email address: " USER_EMAIL
    git config --global user.email "$USER_EMAIL"
fi

# Apply essential Git configurations
echo "🔧 Applying essential Git configurations..."

# Core settings
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true
git config --global pull.rebase false
git config --global core.autocrlf input
git config --global core.editor "code --wait"

# Improve Git experience
git config --global color.ui auto
git config --global branch.autosetupmerge always
git config --global branch.autosetuprebase always

# Useful aliases
echo "🔧 Setting up useful Git aliases..."
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.undo "reset --soft HEAD~1"

# Security and performance
git config --global credential.helper osxkeychain
git config --global core.precomposeunicode true
git config --global core.quotepath false

# Set up global gitignore
echo "🔧 Setting up global gitignore..."
GLOBAL_GITIGNORE="$HOME/.gitignore"

# Create global gitignore file if it doesn't exist
if [ ! -f "$GLOBAL_GITIGNORE" ]; then
    cat > "$GLOBAL_GITIGNORE" << 'EOF'
# macOS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Dependency directories
node_modules/
jspm_packages/

# Optional npm cache directory
.npm

# Optional eslint cache
.eslintcache

# Output of 'npm pack'
*.tgz

# Yarn Integrity file
.yarn-integrity

# dotenv environment variables file
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Temporary folders
tmp/
temp/

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOF
    echo "✅ Created global gitignore at $GLOBAL_GITIGNORE"
else
    echo "✅ Global gitignore already exists at $GLOBAL_GITIGNORE"
fi

# Configure global gitignore
git config --global core.excludesfile "$GLOBAL_GITIGNORE"

echo "✅ Git configuration completed!"

# Display current configuration
echo ""
echo "📋 Current Git Configuration:"
echo "Name: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"
echo "Default branch: $(git config --global init.defaultBranch)"
echo "Editor: $(git config --global core.editor)"
echo "Global gitignore: $(git config --global core.excludesfile)"

echo ""
echo "🎉 Git setup complete!"
echo ""
echo "💡 Useful Git commands:"
echo "   git st                   # Status (alias)"
echo "   git lg                   # Pretty log graph (alias)"
echo "   git undo                 # Undo last commit (alias)"
echo "   git unstage <file>       # Unstage file (alias)"
echo "   git config --list        # Show all configuration"
echo ""
echo "📝 Next steps:"
echo "1. Set up SSH key for GitHub/GitLab authentication"
echo "2. Test Git with a repository: git clone <repo-url>"
echo "3. Make your first commit in a test repository"
echo ""
echo "🔐 To set up SSH key, run the SSH setup script:"
echo "cd ../ssh-setup && ./setup-ssh.sh"
