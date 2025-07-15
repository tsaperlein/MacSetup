#!/bin/bash

# Master Setup Script for Powerlevel10k Complete Installation
# This script orchestrates the complete setup process for both Terminal and iTerm2

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_header() {
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}═══════════════════════════════════════════════════════════${NC}"
}

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

print_success() {
    echo -e "${CYAN}✅ $1${NC}"
}

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_header "🚀 POWERLEVEL10K COMPLETE SETUP"
echo -e "${CYAN}This script will set up Powerlevel10k for both Terminal and iTerm2${NC}"
echo -e "${CYAN}with optimized configurations for each terminal application.${NC}"
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only"
    exit 1
fi

# Step 1: Main Installation
print_header "📦 PHASE 1: CORE INSTALLATION"
print_step "Running main Powerlevel10k installation..."

if [ -f "$SCRIPT_DIR/install-powerlevel10k-complete.sh" ]; then
    chmod +x "$SCRIPT_DIR/install-powerlevel10k-complete.sh"
    "$SCRIPT_DIR/install-powerlevel10k-complete.sh"
    print_success "Core installation completed"
else
    print_error "Main installation script not found!"
    exit 1
fi

echo ""

# Step 2: Terminal Configuration
print_header "🖥️  PHASE 2: TERMINAL CONFIGURATION"
print_step "Configuring macOS Terminal app..."

if [ -f "$SCRIPT_DIR/configure-terminal.sh" ]; then
    chmod +x "$SCRIPT_DIR/configure-terminal.sh"
    "$SCRIPT_DIR/configure-terminal.sh"
    print_success "Terminal configuration completed"
else
    print_warning "Terminal configuration script not found, skipping..."
fi

echo ""

# Step 3: iTerm2 Configuration
print_header "🚀 PHASE 3: ITERM2 CONFIGURATION"
print_step "Configuring iTerm2..."

if [ -f "$SCRIPT_DIR/configure-iterm2.sh" ]; then
    chmod +x "$SCRIPT_DIR/configure-iterm2.sh"
    "$SCRIPT_DIR/configure-iterm2.sh"
    print_success "iTerm2 configuration completed"
else
    print_warning "iTerm2 configuration script not found, skipping..."
fi

echo ""

# Step 4: Final Instructions
print_header "🎉 SETUP COMPLETE!"

echo -e "${GREEN}Powerlevel10k has been successfully installed and configured!${NC}"
echo ""
echo -e "${CYAN}📋 NEXT STEPS:${NC}"
echo ""
echo -e "${YELLOW}1. RESTART YOUR TERMINALS:${NC}"
echo "   • Close all Terminal and iTerm2 windows"
echo "   • Reopen your preferred terminal application"
echo ""
echo -e "${YELLOW}2. CONFIGURE YOUR PROMPT:${NC}"
echo "   • Run: ${BLUE}p10k configure${NC}"
echo "   • Follow the interactive setup wizard"
echo "   • This will create your personal ~/.p10k.zsh configuration"
echo ""
echo -e "${YELLOW}3. FONT VERIFICATION:${NC}"
echo "   • If you see broken symbols, verify Nerd Fonts are properly set:"
echo "   • Terminal: Preferences > Profiles > Text > Font: 'Hack Nerd Font Mono'"
echo "   • iTerm2: Preferences > Profiles > Text > Font: 'Hack Nerd Font Mono'"
echo ""
echo -e "${YELLOW}4. TROUBLESHOOTING:${NC}"
echo "   • If Terminal looks different from iTerm2, that's normal!"
echo "   • Each has optimized configurations for best display"
echo "   • VS Code terminal should work perfectly with default settings"
echo ""
echo -e "${GREEN}📁 Configuration files created:${NC}"
echo "   • ${BLUE}~/.zshrc${NC} - Main shell configuration"
echo "   • ${BLUE}~/.p10k-terminal.zsh${NC} - Terminal-specific config"
echo "   • ${BLUE}~/.p10k-iterm2.zsh${NC} - iTerm2-specific config"
echo "   • ${BLUE}~/.config/iterm2/Powerlevel10k.itermcolors${NC} - iTerm2 color scheme"
echo ""
echo -e "${GREEN}🎨 Theme will automatically switch based on your terminal:${NC}"
echo "   • ${BLUE}Apple Terminal${NC}: Optimized for better compatibility"
echo "   • ${BLUE}iTerm2${NC}: Full Nerd Font feature support"
echo "   • ${BLUE}VS Code${NC}: Uses default Powerlevel10k configuration"
echo ""

# Check if user wants to run p10k configure now
echo -e "${CYAN}Would you like to run the Powerlevel10k configuration wizard now? (y/n)${NC}"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    print_step "Starting Powerlevel10k configuration wizard..."
    # Source the new .zshrc and run p10k configure
    zsh -c "source ~/.zshrc && p10k configure"
else
    print_status "You can run 'p10k configure' later to customize your prompt"
fi

echo ""
print_header "🎊 ENJOY YOUR NEW TERMINAL EXPERIENCE!"
echo -e "${CYAN}Your terminal is now powered by Powerlevel10k with optimized${NC}"
echo -e "${CYAN}configurations for both Terminal and iTerm2!${NC}"
