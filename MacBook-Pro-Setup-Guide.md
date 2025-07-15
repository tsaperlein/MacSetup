# MacBook Pro Developer Setup Guide

This comprehensive guide will help you set up a new MacBook Pro for development work, including essential tools, applications, and configurations.

## Core Development Tools

### Essential Package Managers and Version Control

1. **Install Homebrew** - The missing package manager for macOS
2. **Install NVM** - Node Version Manager for handling different Node.js versions
3. **Install pyenv** - Python version management
4. **Install SDKMAN** - Java version management
5. **Install Node.js using NVM** (not Homebrew)
6. **Install and configure Git** (using Homebrew)
7. **Enable SSH** - Generate new SSH key for secure connections

### Additional Development Features

- **Powerlevel10k** - Enhanced Zsh theme for better terminal experience

## Applications to Install

### Essential Development Tools

1. **Visual Studio Code** - Primary code editor
2. **Docker Desktop** - Containerization platform
3. **Android Studio** - Android development IDE
4. **Xcode** - iOS development IDE (includes Command Line Tools)
5. **iTerm2** - Enhanced terminal application
6. **Google Chrome**

- Adblock for YouTube
- Adblocker for YouTube
- Google Translate
- Grammarly
- Dark Reader

### Productivity Applications

1. **Obsidian** - Note-taking and knowledge management
2. **Figma** - Design and prototyping tool
3. **Raycast** - Enhanced Spotlight replacement
4. **Zoom** - Video conferencing
5. **Google Drive** - Cloud storage
6. **Microsoft Office** - Office suite
7. **Discord** - Communication platform
8. **Spotify** - Music streaming

### Additional Developer Tools

- **Joplin** - Note-taking application
  ```bash
  brew install --cask joplin
  ```
- **LibreOffice** - Open-source office suite
  ```bash
  brew install --cask libreoffice
  ```

## System Settings Configuration

### General Settings

- Set **Google Chrome** as default browser

### Dock Configuration

- **Automatically hide and show Dock**
- **Show indicators for open applications**

### Keyboard Settings

- **Key Repeat** → Fast
- **Delay Until Repeat** → Short
- **Disable** "Correct spelling automatically"
- **Disable** "Capitalize words automatically"
- **Disable** "Add period with double-space"
- **Disable** "Use smart quotes and dashes"

### Security and Privacy

- **Allow apps** downloaded from App Store and identified developers
- **Turn FileVault On** (ensures SSD encryption)

### Sharing Settings

- **Change computer name** to desired name
- **Ensure all file sharing is disabled**

## Development Environment Setup

### Directory Structure

Create a **"Repositories"** folder as the parent directory for all development projects.

### Environment Variables

- Set **VSCode** as the default text editor (EDITOR environment variable)
- Enable **auto-completion of commands**

### Global Git Configuration

```bash
# Configure git user
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Set upstream tracking for new branches
git config --global push.autoSetupRemote true

# Set default branch name
git config --global init.defaultBranch main

# Apply global gitignore
git config --global core.excludesfile ~/.gitignore
```

## Visual Studio Code Configuration

### Essential Extensions

#### Core Development

1. **GitLens** - Git integration
2. **ESLint** - JavaScript linting
3. **Prettier** - Code formatting
4. **GitHub Copilot** - AI code assistance
5. **Docker** - Container support
6. **Git Graph** - Git visualization

#### Language Support

7. **Python** - Python language support
8. **Pylance** - Python language server
9. **Kotlin Language** - Kotlin support
10. **C/C++** - C/C++ support
11. **JavaScript and TypeScript** - Enhanced JS/TS support

#### React Development

12. **ES7+ React** - React snippets
13. **Simple React Snippets** - Additional React snippets
14. **React-Native/React/Redux snippets** - Extended React support

#### Themes and Icons

15. **New Moon Theme** - Color theme
16. **One Dark Pro** - Popular dark theme
17. **Material Theme** - Material design theme
18. **GitHub Theme** - GitHub-inspired theme
19. **Material Icon Theme** - File icons
20. **vscode-icons** - Alternative file icons

#### Productivity

21. **Auto Close Tag** - HTML tag completion
22. **Auto Rename Tag** - Synchronized tag editing
23. **Code Spell Checker** - Spell checking
24. **Live Server** - Local development server
25. **Live Preview** - Real-time preview
26. **Code Runner** - Run code snippets

#### Jupyter and Notebooks

27. **Jupyter** - Jupyter notebook support
28. **Jupyter Cell Tags** - Cell organization
29. **Jupyter Keymap** - Jupyter shortcuts
30. **Jupyter Notebook Renderers** - Enhanced rendering
31. **Jupyter Slide Show** - Presentation mode

#### Specialized Tools

32. **LaTeX Workshop** - LaTeX support
33. **Markdown All In One** - Markdown tools
34. **Markdown Preview GitHub Styling** - GitHub-style markdown
35. **Figma for VS Code** - Figma integration
36. **GitHub Actions** - CI/CD workflow support
37. **Remote SSH** - Remote development
38. **Live Share** - Collaborative editing

#### Secondary Extensions

39. **Container Tools** - Container development
40. **Dev Containers** - Development containers
41. **Docker DX** - Enhanced Docker experience
42. **NPM Intellisense** - NPM package intelligence

### VSCode JSON Settings

The following settings optimize the development environment:

```json
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
```

## Additional Tools to Consider

- **GitHub CLI** (via Homebrew) - Command-line interface for GitHub
- **Netlify CLI** (via NPM) - Deploy and manage Netlify sites

## Conclusion

This setup guide provides a comprehensive foundation for MacBook Pro development. After following these steps, you'll have a fully configured development environment optimized for modern software development workflows.

Remember to restart your terminal and applications after making configuration changes to ensure all settings take effect.
