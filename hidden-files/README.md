# Hidden Files Management Scripts

This folder contains scripts to manage the visibility of hidden files and folders on your MacBook Pro.

## What These Scripts Do

### `show-hidden-files.sh`

This script makes hidden files and folders visible in Finder by:

- Making the `~/Library` folder visible
- Enabling display of all hidden files in Finder
- Showing the path bar in Finder windows
- Showing the status bar in Finder windows
- Automatically restarting Finder to apply changes

### `hide-hidden-files.sh`

This companion script reverses the changes by:

- Hiding the `~/Library` folder
- Disabling display of hidden files in Finder
- Hiding the path bar in Finder windows
- Hiding the status bar in Finder windows
- Automatically restarting Finder to apply changes

## How to Run the Scripts

### Method 1: Using Terminal

1. Open Terminal
2. Navigate to this directory:
   ```bash
   cd "/Users/tsaperlein/Desktop/GitHub Projects/MacSetup/show-hidden-files"
   ```
3. Make the scripts executable (only needed once):
   ```bash
   chmod +x show-hidden-files.sh
   chmod +x hide-hidden-files.sh
   ```
4. Run the desired script:

   ```bash
   # To show hidden files
   ./show-hidden-files.sh

   # To hide hidden files
   ./hide-hidden-files.sh
   ```

### Method 2: Double-click in Finder

1. Right-click on the script file (`.sh`)
2. Select "Open With" → "Terminal"
3. The script will run automatically

## What You'll See

After running `show-hidden-files.sh`, you'll notice:

- Files and folders starting with `.` (like `.gitignore`, `.env`) become visible
- The `Library` folder appears in your home directory
- System files and folders that are normally hidden become visible
- A path bar appears at the bottom of Finder windows
- A status bar appears showing file counts and available space

## Important Notes

⚠️ **Be Careful**: Hidden files are hidden for a reason. Avoid modifying or deleting system files unless you know what you're doing.

💡 **Tip**: You can quickly toggle hidden file visibility using the keyboard shortcut `Cmd + Shift + .` in Finder (macOS Sierra and later).

🔄 **Reversible**: All changes made by these scripts are completely reversible using the companion script.

## Troubleshooting

If the scripts don't work:

1. Make sure they have execute permissions: `chmod +x *.sh`
2. Run them with bash explicitly: `bash show-hidden-files.sh`
3. Check that you have administrator privileges

## Integration with Main Setup

These scripts complement the main MacBook Pro setup guide by providing an easy way to manage hidden file visibility, which is often needed during development work.
