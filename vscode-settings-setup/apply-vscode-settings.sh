#!/bin/bash

# VSCode Settings Installer
# This script applies comprehensive VSCode settings for optimal development experience

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if VSCode is installed
check_vscode_installation() {
    if command -v code >/dev/null 2>&1; then
        print_success "VSCode CLI found"
        return 0
    elif [ -d "/Applications/Visual Studio Code.app" ]; then
        print_warning "VSCode app found but CLI not in PATH"
        print_status "Adding VSCode CLI to PATH..."

        # Add VSCode CLI to PATH if not already there
        if ! grep -q 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' ~/.zshrc; then
            echo 'export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zshrc
            export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
            print_success "VSCode CLI added to PATH"
        fi
        return 0
    else
        print_error "VSCode is not installed. Please install Visual Studio Code first."
        print_status "You can install it via: brew install --cask visual-studio-code"
        return 1
    fi
}

# Function to get VSCode settings directory
get_vscode_settings_dir() {
    local settings_dir="$HOME/Library/Application Support/Code/User"

    if [ ! -d "$settings_dir" ]; then
        print_status "Creating VSCode settings directory..."
        mkdir -p "$settings_dir"
    fi

    echo "$settings_dir"
}

# Function to backup existing settings
backup_existing_settings() {
    local settings_dir="$1"
    local settings_file="$settings_dir/settings.json"

    if [ -f "$settings_file" ]; then
        local backup_file="$settings_dir/settings.json.backup.$(date +%Y%m%d_%H%M%S)"
        print_status "Backing up existing settings to: $backup_file"
        cp "$settings_file" "$backup_file"
        print_success "Backup created successfully"
    else
        print_status "No existing settings file found"
    fi
}

# Function to apply VSCode settings
apply_vscode_settings() {
    local settings_dir="$1"
    local settings_file="$settings_dir/settings.json"

    print_status "Writing VSCode settings to: $settings_file"

    cat > "$settings_file" << 'EOF'
{
  "editor.lightbulb.enabled": "off",
  "editor.cursorBlinking": "solid",
  "editor.cursorStyle": "line",
  "editor.cursorWidth": 2,
  "window.titleBarStyle": "native",
  "window.customTitleBarVisibility": "never",
  "window.title": "${activeEditorMedium}",
  "files.trimTrailingWhitespace": true,
  "explorer.confirmDelete": false,
  "explorer.compactFolders": false,
  "workbench.sideBar.location": "right",
  "workbench.startupEditor": "none",
  "workbench.statusBar.visible": true,
  "workbench.editor.enablePreview": false,
  "workbench.editor.restoreViewState": true,
  "workbench.activityBar.location": "hidden",
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
EOF

    print_success "VSCode settings applied successfully"
}

# Function to suggest font installation
suggest_font_installation() {
    print_status "Checking for required fonts..."

    if ! fc-list | grep -q "Hack Nerd Font"; then
        print_warning "Hack Nerd Font not found"
        print_status "To install Hack Nerd Font, run:"
        echo "  brew tap homebrew/cask-fonts"
        echo "  brew install --cask font-hack-nerd-font"
        echo ""
        print_status "After installing the font, restart VSCode to see the changes"
    else
        print_success "Hack Nerd Font is already installed"
    fi
}

# Function to suggest essential extensions
suggest_extensions() {
    print_status "Consider installing these essential VSCode extensions:"
    echo ""
    echo "Core Development:"
    echo "  • GitLens"
    echo "  • ESLint"
    echo "  • Prettier - Code formatter"
    echo "  • GitHub Copilot"
    echo "  • Docker"
    echo ""
    echo "Language Support:"
    echo "  • Python"
    echo "  • Pylance"
    echo "  • JavaScript and TypeScript Nightly"
    echo ""
    echo "Themes:"
    echo "  • GitHub Theme"
    echo "  • Material Icon Theme"
    echo ""
    print_status "You can install extensions using: code --install-extension <extension-id>"
}

# Main execution
main() {
    echo "=================================="
    echo "   VSCode Settings Installer"
    echo "=================================="
    echo ""

    # Check if VSCode is installed
    if ! check_vscode_installation; then
        exit 1
    fi

    # Get settings directory
    local settings_dir
    settings_dir=$(get_vscode_settings_dir)

    # Backup existing settings
    backup_existing_settings "$settings_dir"

    # Apply new settings
    apply_vscode_settings "$settings_dir"

    # Suggest font installation
    suggest_font_installation

    # Suggest extensions
    suggest_extensions

    echo ""
    print_success "VSCode settings installation completed!"
    print_status "Please restart VSCode to apply all changes"

    # Ask if user wants to restart VSCode
    echo ""
    read -p "Would you like to restart VSCode now? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_status "Restarting VSCode..."
        osascript -e 'quit app "Visual Studio Code"' 2>/dev/null || true
        sleep 2
        code . 2>/dev/null || open -a "Visual Studio Code" . 2>/dev/null || true
        print_success "VSCode restarted"
    fi
}

# Run the main function
main "$@"
