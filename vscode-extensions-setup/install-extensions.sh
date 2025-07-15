#!/bin/bash

# VSCode Extensions Installation Script
# This script installs all the essential VSCode extensions for development

echo "🚀 Starting VSCode Extensions Installation..."
echo "================================================"

# Function to install extension with error handling
install_extension() {
    local extension_id=$1
    local extension_name=$2
    
    echo "📦 Installing: $extension_name ($extension_id)"
    if code --install-extension "$extension_id" --force; then
        echo "✅ Successfully installed: $extension_name"
    else
        echo "❌ Failed to install: $extension_name"
    fi
    echo ""
}

# Check if VSCode is installed
if ! command -v code &> /dev/null; then
    echo "❌ VSCode CLI is not available. Please make sure:"
    echo "   1. VSCode is installed"
    echo "   2. 'code' command is available in PATH"
    echo "   3. In VSCode: Cmd+Shift+P → 'Shell Command: Install code command in PATH'"
    exit 1
fi

echo "✅ VSCode CLI detected. Starting installation..."
echo ""

# Core Development Extensions
echo "🔧 Installing Core Development Extensions..."
install_extension "eamodio.gitlens" "GitLens"
install_extension "dbaeumer.vscode-eslint" "ESLint"
install_extension "esbenp.prettier-vscode" "Prettier"
install_extension "GitHub.copilot" "GitHub Copilot"
install_extension "ms-azuretools.vscode-docker" "Docker"
install_extension "mhutchie.git-graph" "Git Graph"

# Language Support Extensions
echo "💻 Installing Language Support Extensions..."
install_extension "ms-python.python" "Python"
install_extension "ms-python.vscode-pylance" "Pylance"
install_extension "mathiasfrohlich.Kotlin" "Kotlin Language"
install_extension "ms-vscode.cpptools" "C/C++"
install_extension "ms-vscode.vscode-typescript-next" "JavaScript and TypeScript"

# React Development Extensions
echo "⚛️ Installing React Development Extensions..."
install_extension "dsznajder.es7-react-js-snippets" "ES7+ React/Redux/React-Native snippets"
install_extension "burkeholland.simple-react-snippets" "Simple React Snippets"
install_extension "xabikos.ReactSnippets" "React-Native/React/Redux snippets"

# Themes and Icons Extensions
echo "🎨 Installing Themes and Icons Extensions..."
install_extension "taniarascia.new-moon-vscode" "New Moon Theme"
install_extension "zhuangtongfa.material-theme" "One Dark Pro"
install_extension "Equinusocio.vsc-material-theme" "Material Theme"
install_extension "GitHub.github-vscode-theme" "GitHub Theme"
install_extension "PKief.material-icon-theme" "Material Icon Theme"
install_extension "vscode-icons-team.vscode-icons" "vscode-icons"

# Productivity Extensions
echo "⚡ Installing Productivity Extensions..."
install_extension "formulahendry.auto-close-tag" "Auto Close Tag"
install_extension "formulahendry.auto-rename-tag" "Auto Rename Tag"
install_extension "streetsidesoftware.code-spell-checker" "Code Spell Checker"
install_extension "ritwickdey.LiveServer" "Live Server"
install_extension "ms-vscode.live-server" "Live Preview"
install_extension "formulahendry.code-runner" "Code Runner"

# Jupyter and Notebooks Extensions
echo "📓 Installing Jupyter and Notebooks Extensions..."
install_extension "ms-toolsai.jupyter" "Jupyter"
install_extension "ms-toolsai.vscode-jupyter-cell-tags" "Jupyter Cell Tags"
install_extension "ms-toolsai.jupyter-keymap" "Jupyter Keymap"
install_extension "ms-toolsai.jupyter-renderers" "Jupyter Notebook Renderers"
install_extension "ms-toolsai.vscode-jupyter-slideshow" "Jupyter Slide Show"

# Specialized Tools Extensions
echo "🛠️ Installing Specialized Tools Extensions..."
install_extension "James-Yu.latex-workshop" "LaTeX Workshop"
install_extension "yzhang.markdown-all-in-one" "Markdown All in One"
install_extension "bierner.markdown-preview-github-styles" "Markdown Preview GitHub Styling"
install_extension "figma.figma-vscode-extension" "Figma for VS Code"
install_extension "GitHub.vscode-github-actions" "GitHub Actions"
install_extension "ms-vscode-remote.remote-ssh" "Remote - SSH"
install_extension "ms-vsliveshare.vsliveshare" "Live Share"

# Secondary Extensions
echo "🔧 Installing Secondary Extensions..."
install_extension "ms-vscode-remote.vscode-remote-extensionpack" "Remote Development"
install_extension "ms-vscode-remote.remote-containers" "Dev Containers"
install_extension "ms-azuretools.vscode-docker" "Docker"
install_extension "christian-kohler.npm-intellisense" "npm Intellisense"

echo ""
echo "🎉 VSCode Extensions Installation Complete!"
echo "================================================"
echo "📝 Summary:"
echo "   • All essential development extensions have been installed"
echo "   • Restart VSCode to ensure all extensions are properly loaded"
echo "   • Some extensions may require additional configuration"
echo ""
echo "💡 Next Steps:"
echo "   1. Restart VSCode"
echo "   2. Configure GitHub Copilot (if you have access)"
echo "   3. Set up your preferred theme and icon pack"
echo "   4. Configure language-specific settings as needed"
echo ""
echo "✅ Your development environment is now ready!"
