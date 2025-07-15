#!/bin/bash

# Powerlevel10k Installation Script for Oh My Zsh
# This script installs Powerlevel10k theme and required fonts

set -e  # Exit on any error

echo "🚀 Installing Powerlevel10k Theme for Oh My Zsh"
echo "=============================================="

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "❌ Oh My Zsh is not installed. Please install it first."
    echo "Run: sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
    exit 1
fi

echo "✅ Oh My Zsh detected"

# Install Powerlevel10k theme
echo "📦 Installing Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "✅ Powerlevel10k theme installed"
else
    echo "✅ Powerlevel10k theme already installed"
fi

# Install MesloLGS NF fonts (required for Powerlevel10k icons)
echo "🔤 Installing MesloLGS NF fonts..."

# Create fonts directory if it doesn't exist
mkdir -p "$HOME/Library/Fonts"

# Download and install fonts
fonts=(
    "MesloLGS%20NF%20Regular.ttf"
    "MesloLGS%20NF%20Bold.ttf"
    "MesloLGS%20NF%20Italic.ttf"
    "MesloLGS%20NF%20Bold%20Italic.ttf"
)

for font in "${fonts[@]}"; do
    font_name=$(echo $font | sed 's/%20/ /g')
    if [ ! -f "$HOME/Library/Fonts/$font_name" ]; then
        echo "  📥 Downloading $font_name..."
        curl -fLo "$HOME/Library/Fonts/$font_name" \
            "https://github.com/romkatv/powerlevel10k-media/raw/master/$font"
        echo "  ✅ $font_name installed"
    else
        echo "  ✅ $font_name already installed"
    fi
done

# Update .zshrc to use Powerlevel10k theme
echo "⚙️  Configuring .zshrc..."
if [ -f "$HOME/.zshrc" ]; then
    # Backup original .zshrc
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
    echo "✅ Backup created: ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
    
    # Update theme in .zshrc
    if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
        sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$HOME/.zshrc"
        echo "✅ Theme updated in .zshrc"
    else
        echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"
        echo "✅ Theme added to .zshrc"
    fi
else
    echo "❌ .zshrc file not found"
    exit 1
fi

# Add Powerlevel10k instant prompt (for faster startup)
if ! grep -q "# Enable Powerlevel10k instant prompt" "$HOME/.zshrc"; then
    # Add instant prompt at the beginning of .zshrc (after the Oh My Zsh check)
    temp_file=$(mktemp)
    (
        echo "# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc."
        echo "# Initialization code that may require console input (password prompts, [y/n]"
        echo "# confirmations, etc.) must go above this block; everything else may go below."
        echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then'
        echo '  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"'
        echo 'fi'
        echo ""
        cat "$HOME/.zshrc"
    ) > "$temp_file"
    mv "$temp_file" "$HOME/.zshrc"
    echo "✅ Powerlevel10k instant prompt added"
fi

# Add p10k configuration sourcing at the end of .zshrc
if ! grep -q "source ~/.p10k.zsh" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> "$HOME/.zshrc"
    echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> "$HOME/.zshrc"
    echo "✅ p10k configuration sourcing added"
fi

echo ""
echo "🎉 Powerlevel10k installation completed!"
echo ""
echo "📋 Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Set your terminal font to 'MesloLGS NF' (in Terminal/iTerm2 preferences)"
echo "3. Run 'p10k configure' to customize your prompt"
echo ""
echo "💡 Tips:"
echo "- Use iTerm2 for the best experience"
echo "- The configuration wizard will guide you through setup"
echo "- You can reconfigure anytime with 'p10k configure'"
echo ""
echo "🔧 If you encounter issues:"
echo "- Make sure your terminal supports 256 colors"
echo "- Verify the MesloLGS NF font is selected in terminal settings"
echo "- Try running 'p10k configure' if the prompt looks incorrect"
