# pyenv Setup

## Overview

pyenv is a simple Python version management tool that allows you to easily switch between multiple versions of Python. It's essential for Python developers working on different projects that require different Python versions.

## What is pyenv?

pyenv lets you:
- Install and manage multiple Python versions
- Switch between Python versions globally or per-project
- Create and manage virtual environments
- Ensure consistent Python environments across development teams

## Installation

### Automated Installation

Run the installation script:

```bash
./install-pyenv.sh
```

### Manual Installation

#### Via Homebrew (Recommended)

```bash
brew install pyenv pyenv-virtualenv
```

#### Via curl

```bash
curl https://pyenv.run | bash
```

After installation, add to your shell profile:

```bash
# Add to ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
```

## Basic Usage

### Installing Python Versions

```bash
# List available Python versions
pyenv install --list

# Install specific Python version
pyenv install 3.11.5
pyenv install 3.12.0
pyenv install 3.10.12

# Install latest stable version
pyenv install 3.11.5  # Replace with latest version
```

### Managing Python Versions

```bash
# List installed versions
pyenv versions

# Set global Python version
pyenv global 3.11.5

# Set local Python version for current directory
pyenv local 3.10.12

# Show current Python version
pyenv version

# Refresh pyenv shims
pyenv rehash
```

### Virtual Environments

```bash
# Create virtual environment
pyenv virtualenv 3.11.5 myproject

# Activate virtual environment
pyenv activate myproject

# Deactivate virtual environment
pyenv deactivate

# List virtual environments
pyenv virtualenvs

# Delete virtual environment
pyenv virtualenv-delete myproject
```

## Project-Specific Python Versions

### Using .python-version File

Create a `.python-version` file in your project root:

```bash
echo "3.11.5" > .python-version
```

pyenv will automatically use this version when you enter the directory.

### Multiple Versions

You can specify multiple versions:

```bash
echo -e "3.11.5\n3.10.12" > .python-version
```

## Advanced Usage

### Building Python with Optimizations

```bash
# Install with optimizations (slower build, faster runtime)
PYTHON_CONFIGURE_OPTS="--enable-optimizations" pyenv install 3.11.5

# Install with shared library support
PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.11.5
```

### Using Different Python Implementations

```bash
# Install PyPy
pyenv install pypy3.9-7.3.11

# Install Miniconda
pyenv install miniconda3-latest
```

### Managing Dependencies

```bash
# Install packages in specific environment
pyenv activate myproject
pip install django flask requests

# Create requirements.txt
pip freeze > requirements.txt

# Install from requirements.txt
pip install -r requirements.txt
```

## Configuration

### Shell Integration

pyenv automatically adds configuration to your shell profiles:

**~/.zshrc** (for Zsh):
```bash
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

### Environment Variables

Useful pyenv environment variables:

```bash
# Set custom pyenv root directory
export PYENV_ROOT="$HOME/.pyenv"

# Disable automatic activation of virtualenvs
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Set default virtualenv prompt
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
```

## Best Practices

1. **Use Virtual Environments**: Always create virtual environments for projects
2. **Pin Python Versions**: Use `.python-version` files in your projects
3. **Keep Dependencies Updated**: Regularly update pip and packages
4. **Use Requirements Files**: Maintain `requirements.txt` for reproducibility
5. **Version Strategy**: Use stable releases for production, latest for development

## Common Workflows

### New Project Setup

```bash
# Create project directory
mkdir myproject && cd myproject

# Set Python version
pyenv local 3.11.5

# Create virtual environment
pyenv virtualenv 3.11.5 myproject-env

# Activate environment (optional, auto-activates with .python-version)
pyenv local myproject-env

# Install dependencies
pip install --upgrade pip
pip install django requests pytest

# Save dependencies
pip freeze > requirements.txt
```

### Team Development

```bash
# Team member setup
cd myproject
pyenv install $(cat .python-version)  # Install required Python version
pyenv virtualenv $(cat .python-version) myproject-env
pyenv local myproject-env
pip install -r requirements.txt
```

## Troubleshooting

### Common Issues

1. **Build Dependencies**: Install build tools for compiling Python
2. **Path Issues**: Ensure pyenv is in PATH before system Python
3. **Shim Issues**: Run `pyenv rehash` after installing packages with binaries
4. **M1 Mac Issues**: Some packages may need architecture-specific builds

### Required Build Dependencies

#### macOS

```bash
# Install Xcode command line tools
xcode-select --install

# Install additional dependencies via Homebrew
brew install openssl readline sqlite3 xz zlib
```

### Verification Commands

```bash
# Check pyenv installation
pyenv --version

# Check current Python version
python --version

# Check pip version
pip --version

# List installed versions
pyenv versions

# Check which python is being used
which python
```

## Integration with Development Tools

### VS Code Integration

Install Python extension and configure:

```json
{
  "python.defaultInterpreterPath": "~/.pyenv/shims/python",
  "python.pythonPath": "~/.pyenv/shims/python"
}
```

### Git Integration

Add to `.gitignore`:

```
# Python
__pycache__/
*.py[cod]
*$py.class
.Python
env/
venv/
.venv/
.python-version  # Optional: include if you want to share Python version
```

## Performance Tips

### Faster Installation

```bash
# Use multiple cores for compilation
export MAKE_OPTS="-j$(nproc)"

# Install from pre-built binaries when available
export PYTHON_BUILD_CACHE_PATH="$HOME/.pyenv/cache"
```

### Memory Usage

```bash
# Limit memory usage during build
export MAKEFLAGS="-j1"  # Use single core if low on memory
```

## Resources

- [Official pyenv Repository](https://github.com/pyenv/pyenv)
- [pyenv-virtualenv Plugin](https://github.com/pyenv/pyenv-virtualenv)
- [Python Official Website](https://python.org/)
- [Python Version Release Schedule](https://devguide.python.org/versions/)
- [Real Python pyenv Tutorial](https://realpython.com/intro-to-pyenv/)
