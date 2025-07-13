# NPM Reset Script

This script provides a global `npmreset` function that cleans up Node.js projects by removing `node_modules`, `package-lock.json`, and reinstalling dependencies.

## What it does

The `npmreset` function performs the following actions:

1. 🔥 Removes the `node_modules` directory
2. 🔥 Removes the `package-lock.json` file
3. ⚡️ Runs `npm install` to reinstall all dependencies

## Quick Installation (Recommended)

Run the automated installer:

```bash
cd "/Users/tsaperlein/Desktop/GitHub Projects/MacSetup/npm-reset-script"
bash install.sh
```

The installer will:

- Automatically detect your shell (Zsh/Bash)
- Add the npmreset function to your shell configuration
- Create a backup of your existing config
- Provide instructions for immediate use

After installation, simply run `npmreset` in any Node.js project directory!

## Manual Installation

### Option 1: Add to Shell Profile

To make the function available in all terminal sessions:

1. Open your shell configuration file:

   ```bash
   # For Zsh (default on macOS)
   nano ~/.zshrc

   # For Bash
   nano ~/.bashrc
   ```

2. Add this line to the end of the file:

   ```bash
   source "/Users/tsaperlein/Desktop/GitHub Projects/MacSetup/npm-reset-script/npmreset.sh"
   ```

3. Reload your shell configuration:

   ```bash
   # For Zsh
   source ~/.zshrc

   # For Bash
   source ~/.bashrc
   ```

### Option 2: Create a Symlink (Alternative)

Create a symlink to make the script available globally:

```bash
# Make the script executable
chmod +x "/Users/tsaperlein/Desktop/GitHub Projects/MacSetup/npm-reset-script/npmreset.sh"

# Create a symlink in a directory that's in your PATH
sudo ln -s "/Users/tsaperlein/Desktop/GitHub Projects/MacSetup/npm-reset-script/npmreset.sh" /usr/local/bin/npmreset

# Now you can run the script from anywhere
npmreset
```

## How to Use

Once installed (using either the automated installer or manual installation), you can use the function in any Node.js project directory:

```bash
# Navigate to your project directory
cd /path/to/your/nodejs/project

# Run npmreset silently (no output comments)
npmreset

# Run npmreset with visual feedback (shows what's happening)
npmreset -c
```

### Command Options

- **`npmreset`** - Runs silently without emoji comments (clean output)
- **`npmreset -c`** - Runs with visual feedback showing each step

**Example output with `-c` flag:**

```
🔥 rm -rf node_modules
🔥 rm package-lock.json
⚡️ npm i
```

**Example output without `-c` flag:**

```
(Shows only npm install output)
```

## Files in this Directory

- **`npmreset.sh`** - The main script containing the npmreset function
- **`install.sh`** - Automated installer script (recommended)
- **`README.md`** - This documentation file

## Use Cases

This function is useful when you need to:

- Fix dependency conflicts
- Clear corrupted node_modules
- Reset project state after switching branches
- Troubleshoot npm installation issues
- Clean up after package version conflicts

## Requirements

- Node.js and npm must be installed
- Must be run from within a Node.js project directory (containing package.json)

## Safety Note

This function will permanently delete your `node_modules` directory and `package-lock.json` file. Make sure you're in the correct project directory before running it.
