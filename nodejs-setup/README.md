# Node.js Setup via NVM

## Overview

This guide covers installing Node.js using NVM (Node Version Manager) rather than Homebrew. Using NVM provides better version management, easier switching between Node.js versions, and avoids permission issues common with system-wide installations.

## Why NVM Instead of Homebrew?

1. **Version Management**: Easy switching between Node.js versions
2. **Project Isolation**: Different projects can use different Node.js versions
3. **No Permission Issues**: Installs in user directory, no sudo required
4. **Global Package Isolation**: Each Node.js version has its own global packages
5. **Team Consistency**: Ensures consistent Node.js versions across development teams

## Prerequisites

**NVM must be installed first!**

If you haven't installed NVM yet:
```bash
cd ../nvm-setup && ./install-nvm.sh
```

## Installation

### Automated Installation

Run the installation script:

```bash
./install-nodejs.sh
```

This script will:
- ✅ Verify NVM installation
- ✅ Install latest LTS Node.js
- ✅ Install latest stable Node.js
- ✅ Install Node.js 18 LTS
- ✅ Set LTS as default version
- ✅ Install essential global packages
- ✅ Configure aliases for easy version switching

### Manual Installation

If you prefer manual installation:

```bash
# Load NVM
source ~/.nvm/nvm.sh

# Install latest LTS
nvm install --lts

# Install specific version
nvm install 20.9.0

# Set default version
nvm alias default lts/*
```

## Installed Global Packages

The setup script installs these essential global packages:

### Package Managers
- **npm** (latest) - Default Node.js package manager
- **yarn** - Fast, reliable package manager
- **pnpm** - Fast, disk space efficient package manager

### TypeScript Ecosystem
- **typescript** - TypeScript compiler
- **ts-node** - TypeScript execution environment

### Development Tools
- **nodemon** - Auto-restart development server
- **pm2** - Process manager for Node.js applications

### Code Quality
- **eslint** - JavaScript/TypeScript linter
- **prettier** - Code formatter
- **jshint** - JavaScript code quality tool

### Build Tools
- **webpack** - Module bundler
- **vite** - Fast build tool and development server

### Framework CLIs
- **create-react-app** - React application generator
- **@vue/cli** - Vue.js command line interface
- **@angular/cli** - Angular command line interface
- **express-generator** - Express application generator

### Utility Tools
- **serve** - Static file server
- **http-server** - Simple HTTP server
- **json** - JSON processing command line tool
- **uuid** - UUID generator
- **ncu** (npm-check-updates) - Update package.json dependencies

## Version Management

### Switching Between Versions

```bash
# Use latest LTS
nvm use lts/*

# Use latest stable
nvm use latest

# Use specific version
nvm use 18.17.0

# Use version from .nvmrc
nvm use
```

### Setting Default Version

```bash
# Set LTS as default
nvm alias default lts/*

# Set specific version as default
nvm alias default 20.9.0
```

### Project-Specific Versions

Create `.nvmrc` file in project root:

```bash
echo "18.17.0" > .nvmrc
```

Then team members can use:
```bash
nvm use  # Uses version from .nvmrc
```

## Package Management

### NPM Basics

```bash
# Initialize new project
npm init -y

# Install dependencies
npm install express
npm install -D typescript @types/node

# Install global packages
npm install -g typescript

# Update packages
npm update
npm outdated

# Audit security
npm audit
npm audit fix
```

### Yarn Alternative

```bash
# Initialize project
yarn init -y

# Install dependencies
yarn add express
yarn add -D typescript @types/node

# Install global packages
yarn global add typescript

# Update packages
yarn upgrade
```

### pnpm Alternative

```bash
# Initialize project
pnpm init

# Install dependencies
pnpm add express
pnpm add -D typescript @types/node

# Install global packages
pnpm add -g typescript

# Update packages
pnpm update
```

## Development Workflows

### New Project Setup

```bash
# Create project directory
mkdir myproject && cd myproject

# Pin Node.js version
echo "lts/*" > .nvmrc

# Use pinned version
nvm use

# Initialize package.json
npm init -y

# Install dependencies
npm install express
npm install -D nodemon typescript @types/node

# Create basic scripts in package.json
npm pkg set scripts.start="node index.js"
npm pkg set scripts.dev="nodemon index.js"
npm pkg set scripts.build="tsc"
```

### TypeScript Project Setup

```bash
# Create TypeScript project
mkdir ts-project && cd ts-project
echo "lts/*" > .nvmrc
nvm use

# Initialize
npm init -y
npm install -D typescript @types/node nodemon ts-node

# Create tsconfig.json
npx tsc --init

# Create development script
npm pkg set scripts.dev="nodemon --exec ts-node src/index.ts"
npm pkg set scripts.build="tsc"
npm pkg set scripts.start="node dist/index.js"
```

### React Project Setup

```bash
# Create React app
npx create-react-app my-react-app
cd my-react-app

# Pin Node.js version
echo "lts/*" > .nvmrc

# Start development
npm start
```

## Best Practices

### Version Management
1. **Use .nvmrc files** in all projects
2. **Prefer LTS versions** for production applications
3. **Test with multiple versions** if building libraries
4. **Keep Node.js updated** to latest LTS regularly

### Package Management
1. **Use package-lock.json** for consistent installs
2. **Audit dependencies** regularly with `npm audit`
3. **Keep dependencies updated** but test thoroughly
4. **Use exact versions** for critical dependencies
5. **Separate dev and production dependencies**

### Global Packages
1. **Minimize global packages** - prefer local installation
2. **Use npx** for one-time command execution
3. **Document global requirements** in project README
4. **Consider using package.json scripts** instead of global tools

## Performance Optimization

### NPM Configuration

```bash
# Set npm registry (if needed)
npm config set registry https://registry.npmjs.org/

# Enable faster installs
npm config set prefer-offline true
npm config set progress false

# Set cache location
npm config set cache ~/.npm-cache
```

### Memory Management

```bash
# Increase Node.js memory limit
export NODE_OPTIONS="--max-old-space-size=4096"

# Clear npm cache
npm cache clean --force
```

## Troubleshooting

### Common Issues

1. **Permission Errors**: Never use sudo with npm when using NVM
2. **Version Conflicts**: Use `nvm ls` to check installed versions
3. **Global Package Issues**: Reinstall global packages after Node.js version changes
4. **Path Issues**: Ensure NVM is loaded in shell profile

### Verification Commands

```bash
# Check Node.js installation
node --version
npm --version
which node
which npm

# Check NVM status
nvm --version
nvm list
nvm current

# Check global packages
npm list -g --depth=0
```

### Reset Node.js Installation

```bash
# Remove all Node.js versions
nvm ls | grep -E "v[0-9]" | xargs -n1 nvm uninstall

# Reinstall
nvm install --lts
nvm use --lts
nvm alias default lts/*
```

## IDE Integration

### VS Code Configuration

Install Node.js extensions and configure:

```json
{
  "node.envPath": "~/.nvm/versions/node",
  "typescript.preferences.includePackageJsonAutoImports": "on",
  "npm.packageManager": "npm",
  "eslint.packageManager": "npm"
}
```

### Terminal Integration

Add to shell profile for better NVM integration:

```bash
# Auto-use Node.js version from .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
```

## Resources

- [Node.js Official Website](https://nodejs.org/)
- [NPM Documentation](https://docs.npmjs.com/)
- [NVM GitHub Repository](https://github.com/nvm-sh/nvm)
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)
- [Yarn Documentation](https://yarnpkg.com/)
- [pnpm Documentation](https://pnpm.io/)
