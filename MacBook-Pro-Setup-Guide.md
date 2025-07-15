# MacBook Pro Developer Setup Guide

This comprehensive guide will help you set up a new MacBook Pro for development work, including essential tools, applications, and configurations.

## Core Development Tools

### Essential Package Managers and Version Control

1. **Install Homebrew** - The missing package manager for macOS
   ```bash
   ./homebrew-setup/install-homebrew.sh
   ```

2. **Install and configure Git** - Version control system
   ```bash
   ./git-setup/install-git.sh
   ```

3. **Enable SSH** - Generate new SSH key for secure connections
   ```bash
   ./ssh-setup/setup-ssh.sh
   ```

### Programming Language Version Managers

4. **Install NVM** - Node Version Manager for handling different Node.js versions
   ```bash
   ./nvm-setup/install-nvm.sh
   ```

5. **Install Node.js using NVM** - JavaScript runtime and npm package manager
   ```bash
   ./nodejs-setup/install-nodejs.sh
   ```

6. **Install pyenv** - Python version management
   ```bash
   ./pyenv-setup/install-pyenv.sh
   ```

7. **Install SDKMAN** - Java, Kotlin, Scala, and JVM-based language version management
   ```bash
   ./sdkman-setup/install-sdkman.sh
   ```

### Containerization and Databases

8. **Install Docker Desktop** - Containerization platform with management tools
   ```bash
   ./docker-setup/install-docker.sh

   # Optional: Set up Portainer web interface
   ./docker-setup/setup-portainer.sh
   ```

9. **Install Databases** - PostgreSQL, MySQL, MongoDB, and Redis
   ```bash
   ./database-setup/install-databases.sh
   ```

### Additional Development Features

10. **Install Powerlevel10k** - Enhanced Zsh theme for better terminal experience
    ```bash
    # Complete setup for Terminal, iTerm2, and VS Code (Recommended)
    ./powerlevel10k-complete-setup/setup-complete.sh

    # Or use individual scripts:
    # Basic installation only
    ./powerlevel10k-setup/install-powerlevel10k.sh

    # Configure with pre-made themes
    ./powerlevel10k-setup/configure-themes.sh

    # Interactive configuration (run after any installation)
    p10k configure
    ```

    > **💡 Recommendation**: Use the complete setup (`setup-complete.sh`) as it provides optimized configurations for all terminal applications with proper font handling and terminal-specific optimizations.

11. **Configure Global Git Ignore** - Set up global Git ignore rules
    ```bash
    ./global-gitignore-setup/setup-global-gitignore.sh
    ```

12. **VS Code Setup** - Install extensions and apply settings
    ```bash
    # Install all essential VS Code extensions (42 extensions)
    ./vscode-extensions-setup/install-extensions.sh

    # Apply comprehensive VS Code settings
    ./vscode-settings-setup/apply-vscode-settings.sh
    ```

## Applications to Install

### Essential Development Tools

1. **Visual Studio Code** - Primary code editor
2. **Docker Desktop** - Containerization platform
3. **Android Studio** - Android development IDE
4. **Xcode** - iOS development IDE (includes Command Line Tools)
5. **iTerm2** - Enhanced terminal application
6. **Google Chrome**

- Adblock for YouTube
- Adblocker for YouTube
- Google Translate
- Grammarly
- Dark Reader

### Productivity Applications

1. **Obsidian** - Note-taking and knowledge management
2. **Figma** - Design and prototyping tool
3. **Raycast** - Enhanced Spotlight replacement
4. **Zoom** - Video conferencing
5. **Google Drive** - Cloud storage
6. **Microsoft Office** - Office suite
7. **Discord** - Communication platform
8. **Spotify** - Music streaming

### Additional Developer Tools

- **Joplin** - Note-taking application
  ```bash
  brew install --cask joplin
  ```
- **LibreOffice** - Open-source office suite
  ```bash
  brew install --cask libreoffice
  ```

## System Settings Configuration

### General Settings

- Set **Google Chrome** as default browser

### Dock Configuration

- **Automatically hide and show Dock**
- **Show indicators for open applications**

### Keyboard Settings

- **Key Repeat** → Fast
- **Delay Until Repeat** → Short
- **Disable** "Correct spelling automatically"
- **Disable** "Capitalize words automatically"
- **Disable** "Add period with double-space"
- **Disable** "Use smart quotes and dashes"

### Security and Privacy

- **Allow apps** downloaded from App Store and identified developers
- **Turn FileVault On** (ensures SSD encryption)

### Sharing Settings

- **Change computer name** to desired name
- **Ensure all file sharing is disabled**

## Development Environment Setup

### Directory Structure

Create a **"Repositories"** folder as the parent directory for all development projects.

### Environment Variables

- Set **VSCode** as the default text editor (EDITOR environment variable)
- Enable **auto-completion of commands**

### Global Git Configuration

```bash
# Configure git user
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Set upstream tracking for new branches
git config --global push.autoSetupRemote true

# Set default branch name
git config --global init.defaultBranch main

# Apply global gitignore
git config --global core.excludesfile ~/.gitignore
```

## Visual Studio Code Configuration

### Essential Extensions

#### Core Development

1. **GitLens** - Git integration
2. **ESLint** - JavaScript linting
3. **Prettier** - Code formatting
4. **GitHub Copilot** - AI code assistance
5. **Docker** - Container support
6. **Git Graph** - Git visualization

#### Language Support

7. **Python** - Python language support
8. **Pylance** - Python language server
9. **Kotlin Language** - Kotlin support
10. **C/C++** - C/C++ support
11. **JavaScript and TypeScript** - Enhanced JS/TS support

#### React Development

12. **ES7+ React** - React snippets
13. **Simple React Snippets** - Additional React snippets
14. **React-Native/React/Redux snippets** - Extended React support

#### Themes and Icons

15. **New Moon Theme** - Color theme
16. **One Dark Pro** - Popular dark theme
17. **Material Theme** - Material design theme
18. **GitHub Theme** - GitHub-inspired theme
19. **Material Icon Theme** - File icons
20. **vscode-icons** - Alternative file icons

#### Productivity

21. **Auto Close Tag** - HTML tag completion
22. **Auto Rename Tag** - Synchronized tag editing
23. **Code Spell Checker** - Spell checking
24. **Live Server** - Local development server
25. **Live Preview** - Real-time preview
26. **Code Runner** - Run code snippets

#### Jupyter and Notebooks

27. **Jupyter** - Jupyter notebook support
28. **Jupyter Cell Tags** - Cell organization
29. **Jupyter Keymap** - Jupyter shortcuts
30. **Jupyter Notebook Renderers** - Enhanced rendering
31. **Jupyter Slide Show** - Presentation mode

#### Specialized Tools

32. **LaTeX Workshop** - LaTeX support
33. **Markdown All In One** - Markdown tools
34. **Markdown Preview GitHub Styling** - GitHub-style markdown
35. **Figma for VS Code** - Figma integration
36. **GitHub Actions** - CI/CD workflow support
37. **Remote SSH** - Remote development
38. **Live Share** - Collaborative editing

#### Secondary Extensions

39. **Container Tools** - Container development
40. **Dev Containers** - Development containers
41. **Docker DX** - Enhanced Docker experience
42. **NPM Intellisense** - NPM package intelligence

### VSCode Settings Configuration

For optimal VSCode configuration, use the automated setup script provided in this repository:

```bash
# Navigate to the VSCode settings setup directory
cd vscode-settings-setup

# Run the automated settings installer
./apply-vscode-settings.sh
```

This script will:
- ✅ **Backup existing settings** with timestamp
- ✅ **Apply comprehensive development settings**
- ✅ **Check for required fonts** (Hack Nerd Font)
- ✅ **Suggest essential extensions**
- ✅ **Restart VSCode** automatically

### VSCode Extensions Installation

Install all 42 essential VSCode extensions automatically:

```bash
# Navigate to the VSCode extensions setup directory
cd vscode-extensions-setup

# Run the automated extensions installer
./install-extensions.sh
```

The script installs extensions organized into these categories:
- **🔧 Core Development** (6 extensions) - GitLens, ESLint, Prettier, GitHub Copilot, Docker, Git Graph
- **💻 Language Support** (5 extensions) - Python, Pylance, Kotlin, C/C++, JavaScript/TypeScript
- **⚛️ React Development** (3 extensions) - React snippets and enhanced support
- **🎨 Themes and Icons** (6 extensions) - Material themes, GitHub theme, icon packs
- **⚡ Productivity** (6 extensions) - Auto close/rename tags, spell checker, live server
- **📓 Jupyter and Notebooks** (5 extensions) - Complete Jupyter support
- **🔧 Specialized Tools** (11 extensions) - LaTeX, Markdown, Figma, GitHub Actions, Remote development

#### Manual Settings Reference

If you prefer to apply settings manually, the complete configuration includes:

```json
{
  "workbench.colorTheme": "GitHub Dark Default",
  "terminal.integrated.fontSize": 14,
  "terminal.integrated.fontFamily": "Hack Nerd Font Mono",
  "editor.find.addExtraSpaceOnTop": true,
  "editor.padding.top": 36,
  "editor.stickyScroll.enabled": false,
  "editor.fontFamily": "Hack Nerd Font Mono",
  "editor.fontSize": 14,
  "editor.tabSize": 2,
  "editor.lineHeight": 0,
  "editor.insertSpaces": true,
  "editor.detectIndentation": false,
  "editor.renderWhitespace": "none",
  "editor.scrollBeyondLastLine": true,
  "editor.minimap.enabled": false,
  "editor.lineNumbers": "on",
  "editor.find.seedSearchStringFromSelection": "never",
  "editor.renderLineHighlight": "all",
  "workbench.colorCustomizations": {
    "editor.lineHighlightBackground": "#102032",
    "editorCursor.foreground": "#ffffff",
    "terminalCursor.foreground": "#ffffff"
  },
  "files.associations": {
    ".env*": "makefile"
  },
  "editor.formatOnSave": true,
  "[markdown]": {
    "editor.formatOnSave": false
  },
  "[javascript]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascriptreact]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "prettier.documentSelectors": ["**/*.astro"],
  "[astro]": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.fixAll.eslint": "explicit",
    "source.fixAll.tslint": "explicit",
    "source.addMissingImports": "explicit"
  },
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],
  "javascript.validate.enable": false,
  "javascript.updateImportsOnFileMove.enabled": "prompt",
  "typescript.preferences.autoImportFileExcludePatterns": ["@radix-ui"],
  "typescript.updateImportsOnFileMove.enabled": "never",
  "debug.javascript.codelens.npmScripts": "never",
  "explorer.confirmDragAndDrop": false,
  "js/ts.implicitProjectConfig.checkJs": true,
  "editor.formatOnPaste": true,
  "editor.formatOnType": true,
  "editor.inlineSuggest.enabled": true,
  "gitlens.advanced.messages": {
    "suppressCommitHasNoPreviousCommitWarning": true
  },
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": true,
    "scminput": false
  },
  "github.copilot.advanced": {},
  "github.copilot.editor.enableAutoCompletions": true,
  "git.openRepositoryInParentFolders": "never",
  "todohighlight.isEnable": true,
  "todohighlight.isCaseSensitive": true,
  "todohighlight.keywords": [
    {
      "text": "ctx.prisma.stripeIntegration",
      "color": "red",
      "border": "1px solid red",
      "borderRadius": "4px",
      "backgroundColor": "rgba(0,0,0,.2)",
      "isWholeLine": false
    },
    {
      "text": "adminProcedure",
      "color": "red",
      "border": "1px solid red",
      "borderRadius": "4px",
      "backgroundColor": "rgba(0,0,0,.2)",
      "isWholeLine": false
    },
    {
      "text": "authProcedure",
      "color": "red",
      "border": "1px solid red",
      "borderRadius": "4px",
      "backgroundColor": "rgba(0,0,0,.2)",
      "isWholeLine": false
    },
    {
      "text": "publicProcedure",
      "color": "green",
      "border": "1px solid green",
      "borderRadius": "4px",
      "backgroundColor": "rgba(0,0,0,.2)",
      "isWholeLine": false
    }
  ],
  "cSpell.enableFiletypes": [
    "!asciidoc",
    "!c",
    "!cpp",
    "!csharp",
    "!css",
    "!elixir",
    "!erlang",
    "!git-commit",
    "!go",
    "!graphql",
    "!handlebars",
    "!haskell",
    "!html",
    "!jade",
    "!java",
    "!javascript",
    "!javascriptreact",
    "!json",
    "!jsonc",
    "!jupyter",
    "!less",
    "!prisma",
    "!php",
    "!pug",
    "!python",
    "!restructuredtext",
    "!rust",
    "!scala",
    "!scminput",
    "!scss",
    "!swift",
    "!typescript",
    "!typescriptreact",
    "!vue",
    "!yaml",
    "!yml",
    "mdx"
  ],
  "editor.tokenColorCustomizations": {
    "textMateRules": [
      {
        "name": "envKeys",
        "scope": "string.quoted.single.ini,constant.numeric.ini,string.quoted.double.ini",
        "settings": {
          "foreground": "#19354900"
        }
      }
    ]
  }
}
```

>**💡 Tip**: Instead of manually copying these settings, use the automated setup script in the `vscode-settings-setup/` directory for a complete installation with backups and font checking.

For detailed information about each setting and additional configuration options, see the [VSCode Settings Setup README](./vscode-settings-setup/README.md).

## Additional Tools to Consider

### Command-Line Tools
- **GitHub CLI** (via Homebrew) - Command-line interface for GitHub
  ```bash
  brew install gh
  ```
- **Netlify CLI** (via NPM) - Deploy and manage Netlify sites
  ```bash
  npm install -g netlify-cli
  ```

### System Utilities
- **Hidden Files Management** - Toggle visibility of hidden files in Finder
  ```bash
  # Show hidden files
  ./hidden-files/show-hidden-files.sh

  # Hide hidden files
  ./hidden-files/hide-hidden-files.sh
  ```

- **NPM Reset Tools** - Clean and reset NPM configuration
  ```bash
  # Install NPM reset utility
  ./npm-reset-script/install.sh

  # Use the reset tool when needed
  npmreset
  ```

### Docker Management Tools

The Docker setup includes additional management tools:
- **Lazydocker** - Terminal UI for Docker management
- **Dive** - Tool for exploring Docker image layers
- **Portainer** - Web-based Docker management interface

Access Portainer at: http://localhost:9000 (after running setup-portainer.sh)

### Development Prerequisites Check

Before starting any development work, run the prerequisites checker:
```bash
./prerequisites/check_prerequisites.sh
```

This will verify:
- Zsh shell configuration
- Xcode Command Line Tools
- System compatibility
- Required permissions

## Conclusion

This setup guide provides a comprehensive foundation for MacBook Pro development using the automated scripts provided in this repository. The modular approach allows you to:

### 🎯 Benefits of Using These Scripts

- **⚡ Save Time** - Automated installation reduces setup time from hours to minutes
- **🔄 Consistency** - Reproducible setups across different machines
- **📋 Comprehensive** - Covers everything from system tools to development environment
- **🛡️ Safety** - Scripts include error checking and backup functionality
- **📖 Documentation** - Each component is thoroughly documented

### 🚀 Recommended Workflow

1. **Start with Prerequisites** - Always run the prerequisites checker first
2. **Follow the Logical Order** - Install core tools before language-specific managers
3. **Use Complete Setups** - Prefer the complete setup scripts (like powerlevel10k-complete-setup)
4. **Verify Each Step** - Check that each installation completed successfully
5. **Restart When Needed** - Restart terminal/applications after major installations

### 🔧 Customization

Each script can be customized by editing the configuration files in their respective directories. Refer to individual README files for customization options.

### 📚 Getting Help

- Check the README.md file in each setup directory for detailed instructions
- Review the script contents before running for transparency
- Use the prerequisites checker to diagnose setup issues

After following these steps, you'll have a fully configured development environment optimized for modern software development workflows with all tools properly integrated and configured.

Remember to restart your terminal and applications after making configuration changes to ensure all settings take effect.
