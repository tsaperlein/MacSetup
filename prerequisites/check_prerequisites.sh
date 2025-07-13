#!/bin/bash

# MacBook Pro Setup Prerequisites Checker
# This script verifies that all prerequisites are met before running setup scripts

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0

echo -e "${BLUE}🔍 MacBook Pro Setup Prerequisites Checker${NC}"
echo "=============================================="
echo

# Function to print test results
print_result() {
    local test_name="$1"
    local status="$2"
    local message="$3"
    
    if [ "$status" = "PASS" ]; then
        echo -e "✅ ${GREEN}PASS${NC}: $test_name"
        [ -n "$message" ] && echo -e "   ${message}"
        ((PASSED++))
    else
        echo -e "❌ ${RED}FAIL${NC}: $test_name"
        [ -n "$message" ] && echo -e "   ${message}"
        ((FAILED++))
    fi
    echo
}

# Check if running on macOS
echo -e "${YELLOW}Checking system compatibility...${NC}"
if [[ "$OSTYPE" == "darwin"* ]]; then
    print_result "macOS Detection" "PASS" "Running on macOS $(sw_vers -productVersion)"
else
    print_result "macOS Detection" "FAIL" "This script is designed for macOS systems"
fi

# Check terminal access
echo -e "${YELLOW}Checking terminal access...${NC}"
if [ -t 0 ]; then
    print_result "Terminal Access" "PASS" "Script is running in an interactive terminal"
else
    print_result "Terminal Access" "FAIL" "No interactive terminal detected"
fi

# Check if Zsh is installed
echo -e "${YELLOW}Checking Zsh installation...${NC}"
if command -v zsh >/dev/null 2>&1; then
    ZSH_VERSION=$(zsh --version | cut -d' ' -f2)
    print_result "Zsh Installation" "PASS" "Zsh version $ZSH_VERSION is installed"
else
    print_result "Zsh Installation" "FAIL" "Zsh is not installed or not in PATH"
fi

# Check if Zsh is the default shell
echo -e "${YELLOW}Checking default shell...${NC}"
if [[ "$SHELL" == *"zsh"* ]]; then
    print_result "Zsh Default Shell" "PASS" "Zsh is set as the default shell"
else
    print_result "Zsh Default Shell" "FAIL" "Default shell is $SHELL (should be zsh)"
fi

# Check if Oh My Zsh is installed
echo -e "${YELLOW}Checking Oh My Zsh installation...${NC}"
if [ -d "$HOME/.oh-my-zsh" ]; then
    if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
        print_result "Oh My Zsh Installation" "PASS" "Oh My Zsh is properly installed"
    else
        print_result "Oh My Zsh Installation" "FAIL" "Oh My Zsh directory exists but installation appears incomplete"
    fi
else
    print_result "Oh My Zsh Installation" "FAIL" "Oh My Zsh is not installed"
fi

# Check if .zshrc exists and sources Oh My Zsh
echo -e "${YELLOW}Checking Zsh configuration...${NC}"
if [ -f "$HOME/.zshrc" ]; then
    if grep -q "oh-my-zsh" "$HOME/.zshrc"; then
        print_result "Zsh Configuration" "PASS" ".zshrc exists and references Oh My Zsh"
    else
        print_result "Zsh Configuration" "FAIL" ".zshrc exists but doesn't reference Oh My Zsh"
    fi
else
    print_result "Zsh Configuration" "FAIL" ".zshrc file not found"
fi

# Check bash availability (for running bash scripts)
echo -e "${YELLOW}Checking Bash availability...${NC}"
if command -v bash >/dev/null 2>&1; then
    BASH_VERSION=$(bash --version | head -n1 | cut -d' ' -f4)
    print_result "Bash Availability" "PASS" "Bash version $BASH_VERSION is available"
else
    print_result "Bash Availability" "FAIL" "Bash is not available"
fi

# Check script execution permissions
echo -e "${YELLOW}Checking script execution capabilities...${NC}"
if [ -x "$0" ]; then
    print_result "Script Execution" "PASS" "Script has execute permissions"
else
    print_result "Script Execution" "FAIL" "Script lacks execute permissions"
fi

# Summary
echo "=============================================="
echo -e "${BLUE}📊 Prerequisites Check Summary${NC}"
echo "=============================================="
echo -e "✅ ${GREEN}Passed${NC}: $PASSED"
echo -e "❌ ${RED}Failed${NC}: $FAILED"
echo

if [ $FAILED -eq 0 ]; then
    echo -e "🎉 ${GREEN}All prerequisites are met!${NC}"
    echo -e "You can proceed with running the MacBook Pro setup scripts."
    exit 0
else
    echo -e "⚠️  ${YELLOW}Some prerequisites are missing.${NC}"
    echo
    echo -e "${BLUE}To fix the issues:${NC}"
    echo
    echo "1. Install Zsh (if not installed):"
    echo "   brew install zsh"
    echo
    echo "2. Set Zsh as default shell:"
    echo "   chsh -s /bin/zsh"
    echo
    echo "3. Install Oh My Zsh:"
    echo "   sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    echo
    echo "4. Make this script executable:"
    echo "   chmod +x $0"
    echo
    echo "Please address these issues and run the check again."
    exit 1
fi