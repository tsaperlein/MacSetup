# Prerequisites Checker

This folder contains a script to verify that your MacBook Pro meets all the prerequisites before running the main setup scripts.

## What it checks

The prerequisites checker verifies the following requirements:

### System Compatibility

- ✅ Running on macOS
- ✅ Interactive terminal access

### Shell Requirements

- ✅ **Zsh** is installed
- ✅ **Zsh** is set as the default shell
- ✅ **Oh My Zsh** is properly installed
- ✅ `.zshrc` configuration file exists and references Oh My Zsh

### Script Execution

- ✅ **Bash** is available for running setup scripts
- ✅ Script has proper execution permissions

## How to use

### 1. Make the script executable

```bash
chmod +x check_prerequisites.sh
```

### 2. Run the prerequisites check

```bash
./check_prerequisites.sh
```

Or from the parent directory:

```bash
./prerequisites/check_prerequisites.sh
```

## Output

The script provides:

- ✅ **Green checkmarks** for passed requirements
- ❌ **Red X marks** for failed requirements
- 📊 **Summary** with pass/fail counts
- 🔧 **Helpful instructions** to fix any issues

### Example successful output:

```
🔍 MacBook Pro Setup Prerequisites Checker
==============================================

✅ PASS: macOS Detection
   Running on macOS 14.0

✅ PASS: Terminal Access
   Script is running in an interactive terminal

✅ PASS: Zsh Installation
   Zsh version 5.9 is installed

✅ PASS: Oh My Zsh Installation
   Oh My Zsh is properly installed

🎉 All prerequisites are met!
You can proceed with running the MacBook Pro setup scripts.
```

## Fixing prerequisites

If any prerequisites fail, the script will provide specific instructions to fix them:

### Install Zsh

```bash
brew install zsh
```

### Set Zsh as default shell

```bash
chsh -s /bin/zsh
```

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Next steps

Once all prerequisites pass, you can proceed with the main MacBook Pro setup guide in the parent directory.
