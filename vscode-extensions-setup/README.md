# VSCode Extensions Setup

This directory contains scripts and instructions for automatically installing all the essential VSCode extensions for development work.

## Overview

The script installs 42 carefully selected VSCode extensions organized into the following categories:

### 🔧 Core Development (6 extensions)
- **GitLens** - Enhanced Git integration and visualization
- **ESLint** - JavaScript/TypeScript linting
- **Prettier** - Code formatting
- **GitHub Copilot** - AI-powered code assistance
- **Docker** - Container development support
- **Git Graph** - Visual Git history and management

### 💻 Language Support (5 extensions)
- **Python** - Comprehensive Python language support
- **Pylance** - Advanced Python language server
- **Kotlin Language** - Kotlin development support
- **C/C++** - C and C++ language support
- **JavaScript and TypeScript** - Enhanced JS/TS support

### ⚛️ React Development (3 extensions)
- **ES7+ React/Redux/React-Native snippets** - React code snippets
- **Simple React Snippets** - Additional React snippets
- **React-Native/React/Redux snippets** - Extended React support

### 🎨 Themes and Icons (6 extensions)
- **New Moon Theme** - Modern dark color theme
- **One Dark Pro** - Popular Atom-inspired theme
- **Material Theme** - Google Material Design theme
- **GitHub Theme** - GitHub-inspired color scheme
- **Material Icon Theme** - Material Design file icons
- **vscode-icons** - Alternative comprehensive icon set

### ⚡ Productivity (6 extensions)
- **Auto Close Tag** - Automatic HTML/XML tag closing
- **Auto Rename Tag** - Synchronized tag renaming
- **Code Spell Checker** - Spell checking for code and comments
- **Live Server** - Local development server with live reload
- **Live Preview** - Real-time HTML preview
- **Code Runner** - Quick code execution in various languages

### 📓 Jupyter and Notebooks (5 extensions)
- **Jupyter** - Jupyter notebook support in VSCode
- **Jupyter Cell Tags** - Cell organization and tagging
- **Jupyter Keymap** - Familiar Jupyter keyboard shortcuts
- **Jupyter Notebook Renderers** - Enhanced output rendering
- **Jupyter Slide Show** - Presentation mode for notebooks

### 🛠️ Specialized Tools (7 extensions)
- **LaTeX Workshop** - Complete LaTeX support
- **Markdown All in One** - Comprehensive Markdown tools
- **Markdown Preview GitHub Styling** - GitHub-flavored Markdown preview
- **Figma for VS Code** - Figma design integration
- **GitHub Actions** - CI/CD workflow support
- **Remote - SSH** - Remote development over SSH
- **Live Share** - Real-time collaborative editing

### 🔧 Secondary Extensions (4 extensions)
- **Remote Development** - Complete remote development pack
- **Dev Containers** - Development in Docker containers
- **Docker** - Docker container management
- **npm Intellisense** - Auto-completion for npm packages

## Quick Start

### Prerequisites

1. **VSCode must be installed** on your system
2. **VSCode CLI must be available** in your PATH
   - Open VSCode
   - Press `Cmd+Shift+P` (macOS) or `Ctrl+Shift+P` (Windows/Linux)
   - Type "Shell Command: Install 'code' command in PATH"
   - Select and execute the command

### Installation

Run the installation script:

```bash
# Navigate to the setup directory
cd vscode-extensions-setup

# Run the installation script
./install-extensions.sh
```

### Alternative Installation

If you prefer to run it directly from the repository root:

```bash
./vscode-extensions-setup/install-extensions.sh
```

## What the Script Does

1. **Validates Prerequisites** - Checks if VSCode CLI is available
2. **Organizes Installation** - Groups extensions by category for clarity
3. **Error Handling** - Reports success/failure for each extension
4. **Progress Tracking** - Shows installation progress with emojis and descriptions
5. **Summary Report** - Provides completion summary and next steps

## After Installation

### Immediate Steps
1. **Restart VSCode** to ensure all extensions load properly
2. **Configure GitHub Copilot** if you have access to it
3. **Select your preferred theme** from the installed options
4. **Choose your icon theme** (Material Icon Theme or vscode-icons)

### Recommended Configuration
1. **Review language-specific settings** for your primary development languages
2. **Configure Prettier** formatting rules for your projects
3. **Set up ESLint** rules if working with JavaScript/TypeScript
4. **Customize keyboard shortcuts** for installed productivity extensions

## Troubleshooting

### Common Issues

**"command not found: code"**
- Solution: Install VSCode CLI as described in Prerequisites

**Extension installation fails**
- Solution: Check internet connection and try running the script again
- Individual extensions can be installed manually if needed

**Extensions not appearing**
- Solution: Restart VSCode completely

### Manual Installation

If you prefer to install extensions manually, you can use:

```bash
code --install-extension <extension-id>
```

All extension IDs are clearly listed in the script for reference.

## Customization

The script can be easily customized by:
1. **Adding new extensions** - Add new `install_extension` calls
2. **Removing unwanted extensions** - Comment out or remove specific lines
3. **Organizing differently** - Rearrange the installation order

## Integration with Main Setup

This extensions setup is part of the complete MacBook Pro Developer Setup Guide. After running this script, you'll have a fully configured VSCode environment ready for:

- **Full-stack web development**
- **Python development and data science**
- **Mobile app development (React Native)**
- **Container-based development**
- **Documentation and technical writing**
- **Collaborative development**

## Support

If you encounter any issues:
1. Check the main setup guide for context
2. Verify VSCode is properly installed
3. Ensure you have an active internet connection
4. Try installing problematic extensions manually

---

**Note**: Some extensions may require additional configuration or authentication (like GitHub Copilot). Refer to individual extension documentation for specific setup requirements.
