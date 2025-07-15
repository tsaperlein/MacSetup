# Powerlevel10k Complete Setup

This folder contains a comprehensive setup for **Powerlevel10k** that works perfectly across **macOS Terminal**, **iTerm2**, and **VS Code integrated terminal**. Each terminal application gets optimized configurations to ensure the best possible display and functionality.

## 🎯 What This Setup Provides

- ✅ **Universal Installation**: Works with Terminal, iTerm2, and VS Code
- ✅ **Optimized Configurations**: Each terminal gets specific settings for best display
- ✅ **Automatic Font Installation**: Installs all necessary Nerd Fonts
- ✅ **Profile Management**: Creates proper profiles with correct colors and fonts
- ✅ **Smart Detection**: Automatically applies the right config for each terminal
- ✅ **Backup Safety**: Backs up existing configurations before making changes

## 📋 Prerequisites

- macOS (Apple Silicon or Intel)
- Homebrew (will be installed automatically if missing)
- Zsh shell (default on macOS)

## 🚀 Quick Start

Run the complete setup with a single command:

```bash
./setup-complete.sh
```

This master script will automatically:
1. Install Powerlevel10k and all dependencies
2. Configure macOS Terminal app
3. Configure iTerm2
4. Set up optimized configurations for each

## 📁 What's Included

### Main Scripts

| Script | Purpose |
|--------|---------|
| `setup-complete.sh` | **Master script** - Runs everything in the correct order |
| `install-powerlevel10k-complete.sh` | Core installation of Powerlevel10k and dependencies |
| `configure-terminal.sh` | Configures macOS Terminal app with optimized settings |
| `configure-iterm2.sh` | Configures iTerm2 with Nerd Font support |

### Individual Setup Steps

If you prefer to run components individually:

```bash
# 1. Core installation (required first)
./install-powerlevel10k-complete.sh

# 2. Configure Terminal app (optional)
./configure-terminal.sh

# 3. Configure iTerm2 (optional)
./configure-iterm2.sh
```

## 🎨 Terminal-Specific Features

### macOS Terminal
- **Optimized for compatibility**: Uses simplified icons for better display
- **Custom color profile**: Dark theme optimized for Powerlevel10k
- **Proper font configuration**: Automatically sets Hack Nerd Font
- **Fallback icons**: Uses compatible symbols when Nerd Fonts aren't fully supported

### iTerm2
- **Full Nerd Font support**: Complete icon set with all symbols
- **Advanced color scheme**: Rich colors with proper transparency
- **Enhanced features**: Cursor guides, ligatures, and advanced text rendering
- **Automatic profile creation**: Sets up dedicated Powerlevel10k profile

### VS Code Terminal
- **Works out of the box**: Uses default Powerlevel10k configuration
- **Perfect symbol rendering**: VS Code has excellent Unicode support
- **Consistent experience**: Matches your external terminal configuration

## 🔧 What Gets Installed

### Core Components
- **Homebrew** (if not already installed)
- **Oh My Zsh** (if not already installed)
- **Powerlevel10k theme**
- **Useful Zsh plugins**:
  - `zsh-autosuggestions` - Command suggestions
  - `zsh-syntax-highlighting` - Syntax highlighting

### Fonts
- **Hack Nerd Font** (primary, recommended)
- **MesloLGS Nerd Font** (alternative)
- **FiraCode Nerd Font** (with ligatures)
- **JetBrains Mono Nerd Font** (alternative)

### Applications
- **iTerm2** (if not already installed)

## 📝 Configuration Files Created

After running the setup, these files will be created/modified:

```
~/.zshrc                           # Main Zsh configuration
~/.p10k.zsh                        # Your personal Powerlevel10k config (after running p10k configure)
~/.p10k-terminal.zsh               # Terminal app optimized config
~/.p10k-iterm2.zsh                 # iTerm2 optimized config
~/.config/iterm2/Powerlevel10k.itermcolors  # iTerm2 color scheme
```

## 🎯 Smart Terminal Detection

The setup automatically detects which terminal you're using and applies the appropriate configuration:

```bash
# In your ~/.zshrc, this logic determines the config to use:

# Terminal-specific Powerlevel10k configuration
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
    [[ ! -f ~/.p10k-terminal.zsh ]] || source ~/.p10k-terminal.zsh
elif [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    [[ ! -f ~/.p10k-iterm2.zsh ]] || source ~/.p10k-iterm2.zsh
fi

# Default Powerlevel10k config (VS Code and others)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

## 🎨 Customization

### Running the Configuration Wizard

After installation, run the interactive configuration wizard:

```bash
p10k configure
```

This will create your personal `~/.p10k.zsh` file with your preferred:
- Prompt style
- Colors
- Icons
- Layout options

### Manual Font Selection

If automatic font configuration doesn't work:

#### Terminal App
1. Open Terminal
2. Go to **Terminal > Preferences** (⌘,)
3. Select **Profiles** tab
4. Choose **Powerlevel10k** profile
5. Go to **Text** tab
6. Set **Font** to "Hack Nerd Font Mono" size 14

#### iTerm2
1. Open iTerm2
2. Go to **iTerm2 > Preferences** (⌘,)
3. Select **Profiles** tab
4. Choose **Powerlevel10k** profile (or create new)
5. Go to **Text** tab
6. Set **Font** to "Hack Nerd Font Mono" size 14
7. Optionally enable **Use ligatures** for FiraCode

## 🔍 Troubleshooting

### Symbols Not Displaying Correctly

**Problem**: You see question marks, boxes, or missing symbols
**Solution**:
1. Verify Nerd Font installation: `brew list --cask hack-nerd-font`
2. Check terminal font settings (see Manual Font Selection above)
3. Restart terminal application completely

### Different Appearance Between Terminals

**This is normal!** Each terminal has optimized configurations:
- **Terminal**: Simplified icons for compatibility
- **iTerm2**: Full Nerd Font feature set
- **VS Code**: Default Powerlevel10k configuration

### Plugin Not Loading

**Problem**: Autosuggestions or syntax highlighting not working
**Solution**:
1. Check if plugins are installed: `ls ~/.oh-my-zsh/custom/plugins/`
2. Verify .zshrc configuration
3. Restart terminal or run: `source ~/.zshrc`

### Permission Issues

**Problem**: "Permission denied" errors
**Solution**:
```bash
# Make scripts executable
chmod +x *.sh

# If Homebrew permissions are wrong
sudo chown -R $(whoami) $(brew --prefix)/*
```

## 🆘 Getting Help

### Check Installation Status

```bash
# Check if Powerlevel10k is installed
ls ~/.oh-my-zsh/custom/themes/powerlevel10k

# Check current theme
echo $ZSH_THEME

# Check terminal program
echo $TERM_PROGRAM

# List installed fonts
brew list --cask | grep font
```

### Reset Configuration

If you want to start over:

```bash
# Backup current config
cp ~/.zshrc ~/.zshrc.backup

# Remove Powerlevel10k configs
rm -f ~/.p10k*.zsh

# Run setup again
./setup-complete.sh
```

### Common Commands

```bash
# Reconfigure Powerlevel10k
p10k configure

# Reload configuration
source ~/.zshrc

# Check Zsh plugins
echo $plugins

# View current prompt configuration
p10k display -a
```

## 🎉 What's Next?

After successful installation:

1. **Restart your terminals** - Close and reopen all terminal windows
2. **Run the configuration wizard** - Execute `p10k configure`
3. **Explore features** - Try different prompt styles and options
4. **Enjoy coding!** - Your terminal experience is now significantly enhanced

## 📚 Additional Resources

- [Powerlevel10k Documentation](https://github.com/romkatv/powerlevel10k)
- [Nerd Fonts Documentation](https://www.nerdfonts.com/)
- [Oh My Zsh Documentation](https://ohmyz.sh/)
- [iTerm2 Documentation](https://iterm2.com/documentation.html)

---

**Note**: This setup prioritizes compatibility and visual appeal across all major terminal applications used by macOS developers. Each terminal gets the configuration that works best for its capabilities.
