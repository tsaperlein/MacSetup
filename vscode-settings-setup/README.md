# VSCode Settings Setup

This directory contains scripts and configurations to automatically apply comprehensive VSCode settings for an optimal development environment.

## 📁 Contents

- `apply-vscode-settings.sh` - Automated script to apply VSCode settings
- `README.md` - This documentation file

## 🚀 Quick Start

1. **Run the setup script:**
   ```bash
   ./apply-vscode-settings.sh
   ```

2. **Follow the prompts** to install fonts and restart VSCode

3. **Install recommended extensions** (see below)

## 📋 Prerequisites

### Required Software

- **Visual Studio Code** - Must be installed before running the script
  ```bash
  brew install --cask visual-studio-code
  ```

### Recommended Fonts

The script will check for and recommend installing:

- **Hack Nerd Font** - Required for optimal terminal and editor display
  ```bash
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font
  ```

## ⚙️ What the Script Does

### 1. VSCode Installation Check
- Verifies VSCode is installed
- Adds VSCode CLI to PATH if needed
- Creates necessary settings directories

### 2. Settings Backup
- Automatically backs up existing settings with timestamp
- Preserves your current configuration before applying new settings

### 3. Settings Application
- Applies comprehensive development-optimized settings
- Configures editor, workbench, and language-specific settings
- Sets up formatting, linting, and productivity features

### 4. Font and Extension Recommendations
- Suggests required font installations
- Lists essential extensions for development

## 🔧 Applied Settings Overview

### Editor Configuration
- **Font**: Hack Nerd Font Mono, 14px
- **Theme**: GitHub Dark Default
- **Cursor**: Solid line, 2px width
- **Minimap**: Disabled for cleaner interface
- **Line numbers**: Always visible
- **Tab size**: 2 spaces
- **Trim whitespace**: Enabled on save

### Workbench Layout
- **Sidebar**: Positioned on the right
- **Activity bar**: Hidden for more space
- **Status bar**: Visible
- **File preview**: Disabled
- **Startup editor**: None (clean start)

### Code Formatting
- **Format on save**: Enabled
- **Format on paste**: Enabled
- **Format on type**: Enabled
- **Default formatter**: Prettier for JS/TS/React
- **ESLint**: Auto-fix on save
- **Import organization**: Automatic

### Language-Specific Settings

#### JavaScript/TypeScript
- Prettier formatting
- ESLint validation
- Auto-imports on file move
- Import path optimization

#### Markdown
- Format on save disabled (preserves formatting)
- Spell checking enabled

#### Python
- Enhanced language support
- Formatting and linting ready

### Git Integration
- GitLens optimizations
- Commit message enhancements
- Repository handling improvements

### GitHub Copilot
- Enabled for most file types
- Auto-completions activated
- Optimized for productivity

### Productivity Features
- **TODO Highlighting**: Custom keywords for development
- **Spell Checker**: Configured for relevant file types
- **Code Actions**: Auto-fix and import management
- **IntelliSense**: Enhanced suggestions

## 📦 Recommended Extensions

After running the script, install these essential extensions:

### Core Development
```bash
code --install-extension eamodio.gitlens
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension github.copilot
code --install-extension ms-vscode.vscode-docker
code --install-extension mhutchie.git-graph
```

### Language Support
```bash
code --install-extension ms-python.python
code --install-extension ms-python.pylance
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension fwcd.kotlin
code --install-extension ms-vscode.cpptools
```

### React Development
```bash
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension burkeholland.simple-react-snippets
code --install-extension ms-vscode.vscode-react-native
```

### Themes and Icons
```bash
code --install-extension github.github-vscode-theme
code --install-extension pkief.material-icon-theme
code --install-extension liviuschera.noctis
code --install-extension whizkydee.material-palenight-theme
```

### Productivity Tools
```bash
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension ritwickdey.liveserver
code --install-extension ms-vscode.live-server
code --install-extension formulahendry.code-runner
```

### Jupyter and Notebooks
```bash
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
```

### Specialized Tools
```bash
code --install-extension james-yu.latex-workshop
code --install-extension yzhang.markdown-all-in-one
code --install-extension bierner.markdown-preview-github-styles
code --install-extension figma.figma-vscode-extension
code --install-extension github.vscode-github-actions
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vsliveshare.vsliveshare
```

## 🔄 Managing Settings

### Viewing Current Settings
```bash
code ~/Library/Application\ Support/Code/User/settings.json
```

### Restoring Backup
If you need to restore previous settings:
```bash
# List available backups
ls ~/Library/Application\ Support/Code/User/settings.json.backup.*

# Restore a specific backup
cp ~/Library/Application\ Support/Code/User/settings.json.backup.YYYYMMDD_HHMMSS ~/Library/Application\ Support/Code/User/settings.json
```

### Customizing Settings
You can modify the applied settings by:
1. Opening VSCode Preferences (⌘,)
2. Switching to JSON view
3. Making your custom changes
4. VSCode will auto-save your modifications

## 🐛 Troubleshooting

### Script Execution Issues
```bash
# Make script executable if needed
chmod +x apply-vscode-settings.sh

# Run with verbose output
bash -x apply-vscode-settings.sh
```

### VSCode CLI Not Found
```bash
# Manually add VSCode CLI to PATH
echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zshrc
source ~/.zshrc
```

### Font Issues
```bash
# Check installed fonts
fc-list | grep -i hack

# Install Hack Nerd Font if missing
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

### Settings Not Applied
1. Ensure VSCode is completely closed before running the script
2. Check for syntax errors in the generated settings.json
3. Restart VSCode after running the script
4. Verify settings location: `~/Library/Application Support/Code/User/settings.json`

### Extension Installation Failures
```bash
# Check VSCode CLI functionality
code --version

# Install extensions manually
code --install-extension <extension-id>

# List installed extensions
code --list-extensions
```

## 🔍 Settings Details

### Key Features Explained

#### Workbench Optimizations
- **Right sidebar**: More natural for most users
- **Hidden activity bar**: Maximizes code space
- **No file preview**: Reduces tab clutter
- **Custom title**: Shows current file clearly

#### Editor Enhancements
- **Padding top**: Breathing room at top of editor
- **Line highlighting**: Current line emphasis
- **Custom cursor**: High visibility white cursor
- **No minimap**: Focus on code, not overview

#### Development Workflow
- **Auto-formatting**: Consistent code style
- **Lint fixing**: Automatic error resolution
- **Import management**: Organized dependencies
- **Spell checking**: Professional documentation

#### Color Customizations
- **Line highlight**: Subtle blue background
- **Cursor colors**: High contrast white
- **Token customization**: Environment file styling

## 📊 Performance Considerations

The applied settings are optimized for:
- **Fast startup**: Minimal initial loading
- **Responsive editing**: Disabled heavy features
- **Efficient formatting**: Smart auto-formatting
- **Reduced visual clutter**: Focus on code

## 🔗 Related Resources

- [VSCode Documentation](https://code.visualstudio.com/docs)
- [VSCode Settings Reference](https://code.visualstudio.com/docs/getstarted/settings)
- [Extension Marketplace](https://marketplace.visualstudio.com/)
- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts)

## 🤝 Contributing

To modify or improve these settings:

1. Test changes in your local VSCode installation
2. Update the script with your improvements
3. Document any new features or requirements
4. Ensure backward compatibility with existing setups

## 📝 Notes

- Settings are applied globally to your VSCode installation
- Workspace-specific settings will override these global settings
- The script creates timestamped backups for safety
- Font installation requires system restart for full effect
- Some settings require specific extensions to function properly

---

**Last Updated**: July 2025
**Compatible With**: VSCode 1.80+
**Platform**: macOS (adaptable to other platforms)
