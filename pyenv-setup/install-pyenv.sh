#!/bin/bash

# pyenv Installation Script
# This script installs pyenv for Python version management

set -e  # Exit on any error

echo "🐍 Starting pyenv installation..."

# Check if pyenv is already installed
if command -v pyenv >/dev/null 2>&1; then
    echo "✅ pyenv is already installed!"
    echo "Current version: $(pyenv --version)"

    echo "🔄 Updating pyenv..."
    if command -v brew >/dev/null 2>&1; then
        brew upgrade pyenv
    else
        echo "⚠️  Homebrew not found. Please update pyenv manually."
    fi
else
    echo "📥 Installing pyenv..."

    # Check if Homebrew is available
    if command -v brew >/dev/null 2>&1; then
        echo "🍺 Installing pyenv via Homebrew..."
        brew install pyenv pyenv-virtualenv
    else
        echo "🔧 Installing pyenv via curl..."
        curl https://pyenv.run | bash

        # Add pyenv to PATH
        echo "🔧 Configuring shell environment..."
        {
            echo ''
            echo '# pyenv Configuration'
            echo 'export PYENV_ROOT="$HOME/.pyenv"'
            echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"'
            echo 'eval "$(pyenv init -)"'
            echo 'eval "$(pyenv virtualenv-init -)"'
        } >> ~/.zshrc

        # Also add to bash profile for compatibility
        {
            echo ''
            echo '# pyenv Configuration'
            echo 'export PYENV_ROOT="$HOME/.pyenv"'
            echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"'
            echo 'eval "$(pyenv init -)"'
            echo 'eval "$(pyenv virtualenv-init -)"'
        } >> ~/.bash_profile
    fi

    echo "✅ pyenv installation completed!"
fi

# Configure shell environment for Homebrew installation
if command -v brew >/dev/null 2>&1; then
    echo "🔧 Configuring shell environment for Homebrew pyenv..."

    # Check if pyenv configuration already exists in .zshrc
    if ! grep -q "pyenv init" ~/.zshrc 2>/dev/null; then
        {
            echo ''
            echo '# pyenv Configuration'
            echo 'eval "$(pyenv init --path)"'
            echo 'eval "$(pyenv init -)"'
            echo 'eval "$(pyenv virtualenv-init -)"'
        } >> ~/.zshrc
    fi

    # Also add to bash profile for compatibility
    if ! grep -q "pyenv init" ~/.bash_profile 2>/dev/null; then
        {
            echo ''
            echo '# pyenv Configuration'
            echo 'eval "$(pyenv init --path)"'
            echo 'eval "$(pyenv init -)"'
            echo 'eval "$(pyenv virtualenv-init -)"'
        } >> ~/.bash_profile
    fi
fi

# Load pyenv for current session
if command -v brew >/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
else
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Verify installation
echo "🔍 Verifying installation..."
if command -v pyenv >/dev/null 2>&1; then
    echo "✅ pyenv is working correctly!"
    echo "Version: $(pyenv --version)"

    echo "📋 Available Python versions (latest stable):"
    pyenv install --list | grep -E "^\s*[0-9]+\.[0-9]+\.[0-9]+$" | tail -5

    # Install latest Python 3.11 (stable LTS)
    echo "📥 Installing Python 3.11 (latest stable)..."
    LATEST_PYTHON=$(pyenv install --list | grep -E "^\s*3\.11\.[0-9]+$" | tail -1 | tr -d ' ')

    if [ -n "$LATEST_PYTHON" ]; then
        pyenv install "$LATEST_PYTHON"
        pyenv global "$LATEST_PYTHON"

        echo "✅ Python installation completed!"
        echo "Python version: $(python --version)"
        echo "Pip version: $(pip --version)"

        # Upgrade pip
        echo "🔄 Upgrading pip..."
        pip install --upgrade pip
    else
        echo "⚠️  Could not determine latest Python 3.11 version"
    fi

else
    echo "❌ pyenv installation failed!"
    echo "Please restart your terminal and try again."
    exit 1
fi

echo "🎉 pyenv setup complete!"
echo ""
echo "💡 Usage examples:"
echo "   pyenv install 3.12.0     # Install specific Python version"
echo "   pyenv global 3.12.0      # Set global Python version"
echo "   pyenv local 3.11.5       # Set local Python version for project"
echo "   pyenv versions           # List installed versions"
echo "   pyenv virtualenv 3.11.5 myproject  # Create virtual environment"
echo ""
echo "⚠️  Please restart your terminal or run 'source ~/.zshrc' to use pyenv commands."
