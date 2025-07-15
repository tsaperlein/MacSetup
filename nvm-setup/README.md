# NVM (Node Version Manager) Setup

## Overview

NVM (Node Version Manager) is a version manager for Node.js that allows you to install and switch between multiple Node.js versions. This is essential for developers working on different projects that require different Node.js versions.

## What is NVM?

NVM is a bash script that allows you to:
- Install multiple versions of Node.js
- Switch between Node.js versions easily
- Set default Node.js versions
- Manage npm packages per Node.js version

## Installation

### Automated Installation

Run the installation script:

```bash
./install-nvm.sh
```

### Manual Installation

If you prefer to install manually:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

After installation, restart your terminal or run:
```bash
source ~/.zshrc
```

## Basic Usage

### Installing Node.js Versions

```bash
# Install latest LTS version
nvm install --lts

# Install specific version
nvm install 18.17.0
nvm install 16.20.0
nvm install 20.5.0

# Install latest version
nvm install node
```

### Switching Between Versions

```bash
# Use specific version
nvm use 18.17.0

# Use latest LTS
nvm use --lts

# Use latest version
nvm use node
```

### Managing Versions

```bash
# List installed versions
nvm ls

# List available versions online
nvm ls-remote

# List available LTS versions
nvm ls-remote --lts

# Set default version
nvm alias default 18.17.0

# Uninstall a version
nvm uninstall 16.20.0
```

### Project-Specific Versions

Create a `.nvmrc` file in your project root:

```bash
echo "18.17.0" > .nvmrc
```

Then use:
```bash
nvm use  # Uses version specified in .nvmrc
```

## Advanced Usage

### Aliases

```bash
# Create custom aliases
nvm alias my-project 18.17.0
nvm use my-project

# List aliases
nvm alias

# Remove alias
nvm unalias my-project
```

### Global Packages

Each Node.js version has its own global packages. To migrate packages:

```bash
# Install new version and migrate packages
nvm install 20.5.0 --reinstall-packages-from=18.17.0
```

### Running Commands with Specific Versions

```bash
# Run command with specific Node.js version
nvm exec 18.17.0 node --version

# Run npm with specific version
nvm exec 18.17.0 npm install
```

## Configuration

### Shell Integration

NVM automatically adds configuration to your shell profiles:

**~/.zshrc** (for Zsh):
```bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```

### Environment Variables

Useful NVM environment variables:

```bash
# Set custom NVM directory
export NVM_DIR="$HOME/.nvm"

# Disable version auto-switching
export NVM_AUTO_USE=false

# Set default architecture on M1 Macs
export NVM_NODEJS_ORG_MIRROR=https://nodejs.org/dist
```

## Best Practices

1. **Use LTS Versions**: Prefer LTS (Long Term Support) versions for production
2. **Project-specific .nvmrc**: Always include .nvmrc in your projects
3. **Global Packages**: Keep global packages minimal, use local packages when possible
4. **Regular Updates**: Update NVM regularly for latest features and security
5. **Clean Up**: Remove unused Node.js versions to save disk space

## Troubleshooting

### Common Issues

1. **Command not found**: Restart terminal or source shell profile
2. **Permission errors**: Never use sudo with NVM
3. **Slow installation**: Use `--no-progress` flag for faster installs
4. **M1 Mac issues**: Some packages may need Rosetta 2

### Verification Commands

```bash
# Check NVM installation
nvm --version

# Check current Node.js version
node --version

# Check npm version
npm --version

# List installed versions
nvm ls
```

## Why Use NVM Instead of Homebrew?

1. **Version Management**: Easy switching between Node.js versions
2. **Project Isolation**: Different projects can use different Node.js versions
3. **No Permission Issues**: Installs in user directory, no sudo required
4. **Global Package Isolation**: Each Node.js version has its own global packages
5. **Easy Cleanup**: Simple to remove versions and start fresh

## Integration with Development Tools

### VS Code Integration

Install the "Node.js Modules Intellisense" extension and configure:

```json
{
  "typescript.preferences.includePackageJsonAutoImports": "on",
  "npm.packageManager": "npm"
}
```

### Package.json Scripts

Use .nvmrc with package.json scripts:

```json
{
  "scripts": {
    "preinstall": "nvm use",
    "start": "nvm use && node server.js"
  }
}
```

## Resources

- [Official NVM Repository](https://github.com/nvm-sh/nvm)
- [Node.js Official Website](https://nodejs.org/)
- [Node.js Release Schedule](https://nodejs.org/en/about/releases/)
- [NPM Documentation](https://docs.npmjs.com/)
