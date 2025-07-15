# MacSetup
A comprehensive collection of automated setup scripts for configuring a MacBook Pro development environment after a format or new purchase.

## Available Setup Scripts

### 🔧 Core Development Tools

- **Prerequisites** (`prerequisites/`) - Check system requirements and shell setup
- **Homebrew** (`homebrew-setup/`) - Install the missing package manager for macOS
- **Git Setup** (`git-setup/`) - Install and configure Git version control
- **SSH Setup** (`ssh-setup/`) - Generate and configure SSH keys for secure connections

### 🐍 Programming Language Managers

- **NVM Setup** (`nvm-setup/`) - Node Version Manager for handling multiple Node.js versions
- **Node.js Setup** (`nodejs-setup/`) - Install Node.js runtime and npm package manager
- **pyenv Setup** (`pyenv-setup/`) - Python version management and installation
- **SDKMAN Setup** (`sdkman-setup/`) - Java, Kotlin, Scala, and JVM-based language version management

### 🐳 Containerization & Databases

- **Docker Setup** (`docker-setup/`) - Install Docker Desktop, Docker Compose, and container management tools
- **Database Setup** (`database-setup/`) - Install and configure popular databases (PostgreSQL, MySQL, MongoDB, Redis)

### 🎨 Terminal & Interface

- **Powerlevel10k Theme** (`powerlevel10k-setup/`) - Beautiful and fast Zsh theme with basic configuration
- **Powerlevel10k Complete Setup** (`powerlevel10k-complete-setup/`) - Full terminal theme setup for Terminal, iTerm2, and VS Code

### 💻 VS Code Configuration

- **VS Code Extensions** (`vscode-extensions-setup/`) - Install 42 essential VS Code extensions automatically
- **VS Code Settings** (`vscode-settings-setup/`) - Apply comprehensive VS Code settings and configuration

### 🛠️ Utilities & Maintenance

- **Global Gitignore** (`global-gitignore-setup/`) - Set up global Git ignore rules
- **Hidden Files Management** (`hidden-files/`) - Show/hide hidden files in Finder
- **NPM Reset Script** (`npm-reset-script/`) - Clean NPM cache and reset npm configuration

## Quick Start

### 🚀 Recommended Setup Order

1. **Check Prerequisites First**
   ```bash
   ./prerequisites/check_prerequisites.sh
   ```

2. **Install Core Development Tools**
   ```bash
   # Install Homebrew (package manager)
   ./homebrew-setup/install-homebrew.sh

   # Install and configure Git
   ./git-setup/install-git.sh

   # Set up SSH keys
   ./ssh-setup/setup-ssh.sh
   ```

3. **Install Programming Language Managers**
   ```bash
   # Install NVM (Node Version Manager)
   ./nvm-setup/install-nvm.sh

   # Install Node.js using NVM
   ./nodejs-setup/install-nodejs.sh

   # Install Python version manager
   ./pyenv-setup/install-pyenv.sh

   # Install Java/JVM language manager
   ./sdkman-setup/install-sdkman.sh
   ```

4. **Set Up Development Environment**
   ```bash
   # Install Docker and container tools
   ./docker-setup/install-docker.sh

   # Install databases
   ./database-setup/install-databases.sh
   ```

5. **Configure Terminal and Editor**
   ```bash
   # Complete terminal theme setup (recommended)
   ./powerlevel10k-complete-setup/setup-complete.sh

   # Install VS Code extensions
   ./vscode-extensions-setup/install-extensions.sh

   # Apply VS Code settings
   ./vscode-settings-setup/apply-vscode-settings.sh
   ```

6. **Apply Final Configurations**
   ```bash
   # Set up global Git ignore
   ./global-gitignore-setup/setup-global-gitignore.sh
   ```

### 📚 Alternative: Follow the Complete Guide

For detailed instructions and manual setup options, see `MacBook-Pro-Setup-Guide.md`.

## Directory Structure

```
MacSetup/
├── prerequisites/              # System requirements checker
├── homebrew-setup/            # macOS package manager installation
├── git-setup/                 # Git version control setup
├── ssh-setup/                 # SSH key generation and configuration
├── nvm-setup/                 # Node Version Manager installation
├── nodejs-setup/              # Node.js runtime installation
├── pyenv-setup/               # Python version management
├── sdkman-setup/              # Java/JVM language version management
├── docker-setup/              # Docker and containerization tools
│   ├── examples/              # Docker compose examples and Dockerfile templates
├── database-setup/            # Database installation and configuration
├── powerlevel10k-setup/       # Basic Zsh theme installation
├── powerlevel10k-complete-setup/ # Complete terminal theme setup
├── vscode-extensions-setup/   # VS Code extensions auto-installer
├── vscode-settings-setup/     # VS Code settings and configuration
├── global-gitignore-setup/    # Global Git ignore configuration
├── hidden-files/              # macOS Finder hidden files management
├── npm-reset-script/          # NPM cache and configuration reset tools
└── MacBook-Pro-Setup-Guide.md # Complete manual setup guide
```

## 🎯 Key Features

- **🔄 Automated Installation** - One-click setup scripts for each component
- **📋 Comprehensive Coverage** - From system tools to development environment
- **🛡️ Safe Execution** - Scripts include error checking and confirmation prompts
- **📖 Detailed Documentation** - Each directory includes comprehensive README files
- **🔧 Modular Design** - Install only what you need, when you need it
- **💾 Backup Support** - Important configurations are backed up before changes
- **🎨 Modern Tooling** - Includes latest development tools and best practices

## 📝 Usage Notes

- **Run scripts from their respective directories** for proper execution
- **Check prerequisites** before running any installation scripts
- **Review documentation** in each folder's README.md for specific instructions
- **Restart terminal** after installing shell-related tools (NVM, pyenv, etc.)
- **Scripts are designed for macOS** and optimized for development workflows
