#!/bin/bash

# SDKMAN Installation Script
# This script installs SDKMAN for Java and JVM-related SDK management

set -e  # Exit on any error

echo "☕ Starting SDKMAN installation..."

# Check if SDKMAN is already installed
if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    echo "✅ SDKMAN is already installed!"
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    echo "Current version: $(sdk version)"

    echo "🔄 Updating SDKMAN..."
    sdk selfupdate
else
    echo "📥 Installing SDKMAN..."

    # Download and install SDKMAN
    curl -s "https://get.sdkman.io" | bash

    echo "🔧 Configuring shell environment..."

    # SDKMAN automatically adds configuration to shell profiles during installation
    # But let's ensure it's properly configured

    echo "✅ SDKMAN installation completed!"
fi

# Load SDKMAN for current session
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Verify installation
echo "🔍 Verifying installation..."
if command -v sdk >/dev/null 2>&1; then
    echo "✅ SDKMAN is working correctly!"
    echo "Version: $(sdk version)"

    echo "📋 Available Java versions (latest LTS and current):"
    sdk list java | grep -E "(17\.|11\.|21\.)" | head -10

    # Install latest LTS Java (Java 21)
    echo "📥 Installing Java 21 (latest LTS)..."
    sdk install java 21.0.1-tem

    # Install Java 11 (LTS)
    echo "📥 Installing Java 11 (LTS)..."
    sdk install java 11.0.21-tem

    # Set Java 21 as default
    sdk default java 21.0.1-tem

    echo "✅ Java installation completed!"
    echo "Default Java version: $(java -version)"

    # Install other useful tools
    echo "📥 Installing additional development tools..."

    # Install Maven
    sdk install maven

    # Install Gradle
    sdk install gradle

    # Install Kotlin
    sdk install kotlin

    echo "✅ Additional tools installation completed!"

else
    echo "❌ SDKMAN installation failed!"
    echo "Please restart your terminal and try again."
    exit 1
fi

echo "🎉 SDKMAN setup complete!"
echo ""
echo "💡 Usage examples:"
echo "   sdk list java           # List available Java versions"
echo "   sdk install java 17.0.9-tem  # Install specific Java version"
echo "   sdk use java 11.0.21-tem     # Switch to specific version (current session)"
echo "   sdk default java 21.0.1-tem  # Set default Java version"
echo "   sdk current java        # Show current Java version"
echo "   sdk list maven          # List available Maven versions"
echo "   sdk install gradle      # Install latest Gradle"
echo ""
echo "⚠️  Please restart your terminal or run 'source ~/.sdkman/bin/sdkman-init.sh' to use SDKMAN commands."
