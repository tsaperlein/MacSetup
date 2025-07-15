# Homebrew Setup

## Overview

Homebrew is the missing package manager for macOS that simplifies the installation of software. It allows you to install command-line tools, applications, fonts, and more with simple commands.

## What is Homebrew?

Homebrew is a free and open-source software package management system that simplifies the installation of software on Apple's operating system, macOS, as well as Linux. It's particularly useful for developers who need to install various tools and libraries.

## Installation

### Automated Installation

Run the installation script:

```bash
./install-homebrew.sh
```

### Manual Installation

If you prefer to install manually:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Key Features

- **Simple Installation**: Install software with a single command
- **Package Management**: Easily update, upgrade, and remove packages
- **Dependency Management**: Automatically handles dependencies
- **Cask Support**: Install GUI applications with `brew install --cask`
- **Formula Repository**: Access to thousands of pre-built packages

## Basic Usage

### Installing Packages

```bash
# Install command-line tools
brew install git
brew install node
brew install python

# Install GUI applications
brew install --cask visual-studio-code
brew install --cask google-chrome
brew install --cask docker
```

### Managing Packages

```bash
# Update Homebrew and all packages
brew update && brew upgrade

# List installed packages
brew list

# Search for packages
brew search <package-name>

# Remove packages
brew uninstall <package-name>

# Clean up old versions
brew cleanup
```

### Useful Commands

```bash
# Check Homebrew installation
brew doctor

# Show package information
brew info <package-name>

# List outdated packages
brew outdated

# Pin a package (prevent updates)
brew pin <package-name>

# Unpin a package
brew unpin <package-name>
```

## Architecture Support

Homebrew supports both Intel and Apple Silicon Macs:

- **Intel Macs**: Installs to `/usr/local/`
- **Apple Silicon Macs**: Installs to `/opt/homebrew/`

The installation script automatically detects your architecture and configures the PATH accordingly.

## Troubleshooting

### Common Issues

1. **Permission Errors**: Run `brew doctor` to check for issues
2. **PATH Problems**: Ensure Homebrew is in your PATH
3. **Xcode Command Line Tools**: Install with `xcode-select --install`

### Verification

Check if Homebrew is working correctly:

```bash
brew --version
brew doctor
which brew
```

## Best Practices

1. **Regular Updates**: Run `brew update && brew upgrade` regularly
2. **Cleanup**: Use `brew cleanup` to remove old versions
3. **Use Casks**: Install GUI apps with casks instead of downloading DMGs
4. **Check Dependencies**: Use `brew deps <package>` to see dependencies
5. **Backup**: Consider using `brew bundle` to create a Brewfile for reproducible setups

## Security

- Homebrew downloads packages from official sources
- Formulas are reviewed by the community
- Use `brew audit` to check for security issues
- Always run `brew doctor` after installation

## Next Steps

After installing Homebrew, you can:

1. Install essential development tools (git, node, python)
2. Install your preferred applications via casks
3. Set up other package managers (NVM, pyenv, SDKMAN)
4. Create a Brewfile for your standard setup

## Resources

- [Official Homebrew Website](https://brew.sh/)
- [Homebrew Documentation](https://docs.brew.sh/)
- [Homebrew GitHub Repository](https://github.com/Homebrew/brew)
- [Formula Search](https://formulae.brew.sh/)
