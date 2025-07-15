# Powerlevel10k Setup Guide

This folder contains scripts and configurations for setting up Powerlevel10k, a highly customizable and fast Zsh theme that works perfectly with Oh My Zsh.

## What is Powerlevel10k?

Powerlevel10k is a theme for Zsh that emphasizes:

- ⚡ **Speed** - Up to 100x faster than other themes
- 🎨 **Customization** - Extensive configuration options
- 🔤 **Icons** - Beautiful icons and symbols
- 📊 **Git integration** - Rich git status information
- 🌈 **Colors** - Support for 256 colors and true color

## Prerequisites

Before installing Powerlevel10k, ensure you have:

- ✅ **macOS** running
- ✅ **Zsh** as your default shell
- ✅ **Oh My Zsh** installed
- ✅ Terminal app that supports 256 colors (Terminal.app or iTerm2)

Run the prerequisites checker in the parent directory if you haven't already:

```bash
./prerequisites/check_prerequisites.sh
```

## Installation

### 1. Make the installation script executable

```bash
chmod +x install-powerlevel10k.sh
```

### 2. Run the installation script

```bash
./install-powerlevel10k.sh
```

The script will:

- 📦 Install Powerlevel10k theme from GitHub
- 🔤 Download and install MesloLGS NF fonts
- ⚙️ Configure your `.zshrc` file
- 🚀 Enable instant prompt for faster startup
- 💾 Create a backup of your current `.zshrc`

### 3. Configure your terminal font

After installation, you need to set your terminal to use the MesloLGS NF font:

#### For Terminal.app:
1. Open Terminal → Preferences
2. Go to Profiles → Text
3. Click "Change..." next to Font
4. Select "MesloLGS NF" family
5. Choose your preferred size (12-14pt recommended)

#### For iTerm2:
1. Open iTerm2 → Preferences
2. Go to Profiles → Text
3. Click "Change Font"
4. Select "MesloLGS NF" family
5. Choose your preferred size (12-14pt recommended)

### 4. Restart your terminal

Close and reopen your terminal, or run:

```bash
source ~/.zshrc
```

### 5. Run the configuration wizard

```bash
p10k configure
```

This will launch an interactive wizard that helps you customize your prompt.

## Configuration Options

The `p10k configure` wizard will ask you about:

### Visual Elements
- **Prompt style** - Classic, Rainbow, etc.
- **Character set** - Unicode, ASCII
- **Prompt colors** - 256 colors, True color
- **Show current time** - Yes/No
- **Prompt separators** - Angled, Straight, Rounded

### Information Display
- **Git status** - Show dirty files, stash count
- **Command execution time** - Show for long-running commands
- **Context information** - Username, hostname
- **Directory truncation** - How to shorten long paths

### Layout Options
- **Prompt height** - One line, Two lines
- **Prompt connection** - Connected, Disconnected
- **Prompt frame** - No frame, Left frame, Full frame
- **Spacing** - Compact, Sparse

## Customization

### Manual Configuration

Your configuration is saved in `~/.p10k.zsh`. You can edit this file directly for advanced customization:

```bash
# Edit configuration
code ~/.p10k.zsh

# Or use nano/vim
nano ~/.p10k.zsh
```

### Reconfigure Anytime

You can run the configuration wizard again at any time:

```bash
p10k configure
```

### Reload Configuration

After making manual changes, reload your configuration:

```bash
source ~/.zshrc
```

## Features

### Git Integration
- 🌿 Current branch name
- 📊 Ahead/behind commit count
- 🔄 Dirty working directory indicator
- 📋 Stash count
- 🔀 Merge conflict indicators

### System Information
- 👤 Username (when relevant)
- 🖥️ Hostname (when SSH)
- 📁 Current directory (smartly truncated)
- ⏱️ Command execution time
- 🔋 Battery status (laptops)
- 🌐 Network status

### Development Tools
- 🐍 Python version and virtual environment
- 📦 Node.js version
- ☕ Java version
- 🐹 Go version
- 🦀 Rust version
- 🐳 Docker context

## Troubleshooting

### Common Issues

#### Prompt looks broken or shows weird characters
- ❌ **Problem**: Terminal font is not set to MesloLGS NF
- ✅ **Solution**: Change terminal font to MesloLGS NF

#### Prompt is slow
- ❌ **Problem**: Heavy git repositories or network issues
- ✅ **Solution**: Configure git status timeout in `.p10k.zsh`

#### Icons not showing
- ❌ **Problem**: Terminal doesn't support Unicode
- ✅ **Solution**: Use ASCII mode in `p10k configure`

#### Configuration not loading
- ❌ **Problem**: `.p10k.zsh` not sourced properly
- ✅ **Solution**: Check that this line exists in `.zshrc`:
  ```bash
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  ```

### Reset to Default

If you want to start over:

```bash
# Remove configuration file
rm ~/.p10k.zsh

# Run configuration wizard again
p10k configure
```

### Debugging

Enable debug mode to troubleshoot issues:

```bash
# Debug mode
p10k debug

# Verbose debug
POWERLEVEL9K_DEBUG=1 zsh
```

## Advanced Tips

### Performance Optimization

For even better performance, add these to your `.zshrc`:

```bash
# Skip oh-my-zsh auto-update checks
DISABLE_AUTO_UPDATE="true"

# Skip oh-my-zsh security checks for faster startup
ZSH_DISABLE_COMPFIX="true"

# Reduce history size if needed
HISTSIZE=1000
SAVEHIST=1000
```

### iTerm2 Integration

For the best experience with iTerm2:

1. Enable **GPU rendering** in iTerm2 preferences
2. Set **Terminal Type** to `xterm-256color`
3. Enable **Use thin strokes for anti-aliased text**

### VS Code Integration

If using VS Code's integrated terminal:

1. Add to VS Code settings.json:
   ```json
   {
     "terminal.integrated.fontFamily": "MesloLGS NF",
     "terminal.integrated.fontSize": 13
   }
   ```

## Uninstallation

If you want to remove Powerlevel10k:

```bash
# Remove theme directory
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Remove configuration
rm ~/.p10k.zsh

# Restore original theme in .zshrc (e.g., robbyrussell)
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="robbyrussell"/' ~/.zshrc

# Restart terminal
source ~/.zshrc
```

## Resources

- 📖 [Official Documentation](https://github.com/romkatv/powerlevel10k)
- 🎨 [Customization Guide](https://github.com/romkatv/powerlevel10k/blob/master/README.md#configuration)
- 🔧 [Troubleshooting](https://github.com/romkatv/powerlevel10k/blob/master/README.md#troubleshooting)
- 💬 [Community Support](https://github.com/romkatv/powerlevel10k/discussions)
