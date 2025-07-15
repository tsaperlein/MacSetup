#!/bin/bash

# iTerm2 Configuration Script for Powerlevel10k
# This script configures iTerm2 with optimal settings for Powerlevel10k

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${BLUE}[STEP]${NC} $1"
}

print_status "Configuring iTerm2 for Powerlevel10k..."

# Check if iTerm2 is installed
if ! brew list --cask iterm2 &> /dev/null && [ ! -d "/Applications/iTerm.app" ]; then
    print_error "iTerm2 is not installed. Please run the main installation script first."
    exit 1
fi

# Create iTerm2 configuration directory if it doesn't exist
ITERM_CONFIG_DIR="$HOME/.config/iterm2"
mkdir -p "$ITERM_CONFIG_DIR"

# Step 1: Create iTerm2 color scheme for Powerlevel10k
print_step "1. Creating iTerm2 color scheme..."

cat > "$ITERM_CONFIG_DIR/Powerlevel10k.itermcolors" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Ansi 0 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.0</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 1 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.0</real>
		<key>Red Component</key>
		<real>0.80000000000000004</real>
	</dict>
	<key>Ansi 10 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.3333333432674408</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>0.3333333432674408</real>
	</dict>
	<key>Ansi 11 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.3333333432674408</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 12 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.3333333432674408</real>
		<key>Red Component</key>
		<real>0.3333333432674408</real>
	</dict>
	<key>Ansi 13 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.3333333432674408</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 14 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>0.3333333432674408</real>
	</dict>
	<key>Ansi 15 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Ansi 2 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.80000000000000004</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 3 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.80000000000000004</real>
		<key>Red Component</key>
		<real>0.80000000000000004</real>
	</dict>
	<key>Ansi 4 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.80000000000000004</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.0</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 5 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.80000000000000004</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.0</real>
		<key>Red Component</key>
		<real>0.80000000000000004</real>
	</dict>
	<key>Ansi 6 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.80000000000000004</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.80000000000000004</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Ansi 7 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.80000000000000004</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.80000000000000004</real>
		<key>Red Component</key>
		<real>0.80000000000000004</real>
	</dict>
	<key>Ansi 8 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.3333333432674408</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.3333333432674408</real>
		<key>Red Component</key>
		<real>0.3333333432674408</real>
	</dict>
	<key>Ansi 9 Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.3333333432674408</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.3333333432674408</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Background Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.12941177189350128</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.12941177189350128</real>
		<key>Red Component</key>
		<real>0.12941177189350128</real>
	</dict>
	<key>Badge Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.5</real>
		<key>Blue Component</key>
		<real>0.0</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.1491314172744751</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Bold Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Cursor Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.78104287385940552</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.78104287385940552</real>
		<key>Red Component</key>
		<real>0.78104287385940552</real>
	</dict>
	<key>Cursor Guide Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>0.25</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.9268307089805603</real>
		<key>Red Component</key>
		<real>0.70213186740875244</real>
	</dict>
	<key>Cursor Text Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>1</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>1</real>
		<key>Red Component</key>
		<real>1</real>
	</dict>
	<key>Foreground Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.86274510622024536</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.86274510622024536</real>
		<key>Red Component</key>
		<real>0.86274510622024536</real>
	</dict>
	<key>Link Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.73423302173614502</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.35916060209274292</real>
		<key>Red Component</key>
		<real>0.0</real>
	</dict>
	<key>Selected Text Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.86274510622024536</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.86274510622024536</real>
		<key>Red Component</key>
		<real>0.86274510622024536</real>
	</dict>
	<key>Selection Color</key>
	<dict>
		<key>Alpha Component</key>
		<real>1</real>
		<key>Blue Component</key>
		<real>0.35294118523597717</real>
		<key>Color Space</key>
		<string>sRGB</string>
		<key>Green Component</key>
		<real>0.27450981736183167</real>
		<key>Red Component</key>
		<real>0.26666668057441711</real>
	</dict>
</dict>
</plist>
EOF

print_status "iTerm2 color scheme created at $ITERM_CONFIG_DIR/Powerlevel10k.itermcolors"

# Step 2: Create iTerm2 profile configuration script
print_step "2. Creating iTerm2 profile configuration script..."

cat > "$ITERM_CONFIG_DIR/configure_profile.py" << 'EOF'
#!/usr/bin/env python3

import os
import subprocess
import sys

def run_applescript(script):
    """Run AppleScript and return the result"""
    try:
        result = subprocess.run(['osascript', '-e', script], capture_output=True, text=True)
        if result.returncode != 0:
            print(f"AppleScript error: {result.stderr}")
            return False
        return result.stdout.strip()
    except Exception as e:
        print(f"Error running AppleScript: {e}")
        return False

def configure_iterm_profile():
    """Configure iTerm2 profile for Powerlevel10k"""

    # Check if iTerm2 is running
    check_iterm = '''
    tell application "System Events"
        return (count of (every process whose name is "iTerm2")) > 0
    end tell
    '''

    iterm_running = run_applescript(check_iterm)
    if iterm_running == "false":
        print("Starting iTerm2...")
        subprocess.run(['open', '-a', 'iTerm'])
        import time
        time.sleep(3)

    # Create or modify the Powerlevel10k profile
    profile_script = '''
    tell application "iTerm2"
        tell current window
            set newProfile to (create profile with default profile "Powerlevel10k")
            tell newProfile
                set font to "Hack Nerd Font Mono"
                set font size to 14
                set cursor type to 2
                set cursor color to {0.78, 0.78, 0.78}
                set background color to {0.129, 0.129, 0.129}
                set foreground color to {0.863, 0.863, 0.863}
                set transparency to 0.05
                set blur to false
                set use cursor guide to true
                set cursor guide color to {0.702, 0.927, 1.0, 0.25}
                set use italic font to true
                set use bold font to true
                set vertical spacing to 1.0
                set horizontal spacing to 1.0
                set minimum contrast to 0.0
                set cursor boost to 0.0
                set blinking cursor to false
                set use underline color to false
                set smart cursor color to true
                set use tab color to false
                set use cursor guide to true
                set show mark indicators to true
                set cursor type to 2
                set option key sends to 2
                set right option key sends to 0
            end tell
        end tell
    end tell
    '''

    print("Configuring iTerm2 profile...")
    result = run_applescript(profile_script)

    if result is not False:
        print("✅ iTerm2 profile 'Powerlevel10k' created successfully!")
        print("📝 You can now switch to this profile in iTerm2 preferences")
        return True
    else:
        print("❌ Failed to create iTerm2 profile")
        return False

if __name__ == "__main__":
    print("🚀 Configuring iTerm2 for Powerlevel10k...")
    configure_iterm_profile()
EOF

chmod +x "$ITERM_CONFIG_DIR/configure_profile.py"

# Step 3: Create iTerm2-specific Powerlevel10k configuration
print_step "3. Creating iTerm2-optimized Powerlevel10k configuration..."

cat > "$HOME/.p10k-iterm2.zsh" << 'EOF'
# Configuration for iTerm2 - optimized for Nerd Fonts and better display
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'

# Instant prompt mode
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

# Character set and icon settings
typeset -g POWERLEVEL9K_LEGACY_ICON_SPACING=false

# Background Jobs
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false

# Context (user@host)
typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_CONTENT_EXPANSION='%n'
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# Directory
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=true

# Git
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=green
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=yellow
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=blue

# Command execution time
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=2
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

# Status
typeset -g POWERLEVEL9K_STATUS_OK=false
typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=red
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=white

# Time
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'

# Configure which elements appear on left and right
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
    newline
    status
    prompt_char
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time
    background_jobs
    time
)

# Prompt character with Nerd Font icons
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=green
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=red
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'

# iTerm2-specific icons (full Nerd Font support)
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=''
typeset -g POWERLEVEL9K_VCS_GIT_ICON=''
typeset -g POWERLEVEL9K_HOME_ICON=''
typeset -g POWERLEVEL9K_FOLDER_ICON=''
typeset -g POWERLEVEL9K_ETC_ICON=''

# Node.js
typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=green
typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=none
typeset -g POWERLEVEL9K_NODE_VERSION_ICON=''

# Python
typeset -g POWERLEVEL9K_PYTHON_ICON=''

# Better spacing and alignment for iTerm2
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=''
EOF

# Step 4: Update .zshrc for iTerm2 compatibility
print_step "4. Updating .zshrc for iTerm2 compatibility..."

if ! grep -q "iTerm2-specific" "$HOME/.zshrc"; then
    cat >> "$HOME/.zshrc" << 'EOF'

# iTerm2-specific Powerlevel10k configuration
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    [[ ! -f ~/.p10k-iterm2.zsh ]] || source ~/.p10k-iterm2.zsh
fi
EOF
    print_status "Added iTerm2-specific configuration to .zshrc"
fi

# Step 5: Run the profile configuration
print_step "5. Configuring iTerm2 profile..."
python3 "$ITERM_CONFIG_DIR/configure_profile.py"

# Step 6: Create manual configuration instructions
print_step "6. Creating manual configuration guide..."

cat > "$ITERM_CONFIG_DIR/manual_setup_instructions.md" << 'EOF'
# Manual iTerm2 Configuration for Powerlevel10k

If the automatic configuration didn't work, follow these manual steps:

## 1. Font Configuration

1. Open iTerm2
2. Go to **iTerm2 > Preferences** (⌘,)
3. Click on **Profiles** tab
4. Select your profile (or create a new one)
5. Go to **Text** tab
6. Set **Font** to one of these Nerd Fonts:
   - Hack Nerd Font Mono (Recommended)
   - MesloLGS NF
   - FiraCode Nerd Font Mono
   - JetBrainsMono Nerd Font Mono
7. Set **Size** to 14 or your preference
8. Check **Use ligatures** if using FiraCode

## 2. Color Scheme

1. In the same **Profiles** section
2. Go to **Colors** tab
3. Click on **Color Presets...** dropdown
4. Choose **Import...** and select the `Powerlevel10k.itermcolors` file
5. After importing, select **Powerlevel10k** from the presets

## 3. Terminal Behavior

1. Go to **Terminal** tab in Profiles
2. Set **Terminal Emulation** to `xterm-256color`
3. Check **Unlimited scrollback**

## 4. Window Settings

1. Go to **Window** tab
2. Set **Transparency** to around 5-10% (optional)
3. Adjust **Blur** if you like the effect

## 5. Advanced Settings

1. Go to **Advanced** tab (in main Preferences)
2. Search for "cursor"
3. Set cursor-related settings as preferred

## 6. Apply and Test

1. Create a new tab or window
2. The new settings should apply automatically
3. Run `p10k configure` to set up your prompt style
EOF

print_status "Manual configuration guide created at $ITERM_CONFIG_DIR/manual_setup_instructions.md"

print_status "iTerm2 configuration completed!"
print_warning "Please restart iTerm2 to ensure all settings take effect"

echo ""
print_status "To complete the setup:"
echo "1. Restart iTerm2"
echo "2. Create a new tab/window"
echo "3. Run 'p10k configure' to customize your prompt"
echo "4. If automatic profile creation failed, follow the manual instructions in:"
echo "   $ITERM_CONFIG_DIR/manual_setup_instructions.md"
