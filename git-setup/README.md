# Git Setup

## Overview

This guide covers installing and configuring Git via Homebrew for optimal development workflow. Git is the most widely used version control system and is essential for modern software development.

## Why Git via Homebrew?

1. **Latest Version**: Homebrew provides more recent Git versions than macOS system Git
2. **Better Features**: Access to latest Git features and improvements
3. **Easy Updates**: Simple updates via Homebrew package management
4. **Consistency**: Same installation method as other development tools

## Prerequisites

**Homebrew must be installed first!**

If you haven't installed Homebrew yet:
```bash
cd ../homebrew-setup && ./install-homebrew.sh
```

## Installation

### Automated Installation

Run the installation script:

```bash
./install-git.sh
```

This script will:
- ✅ Verify Homebrew installation
- ✅ Install/update Git via Homebrew
- ✅ Configure user identity (name and email)
- ✅ Apply essential Git configurations
- ✅ Set up useful aliases
- ✅ Create and configure global gitignore
- ✅ Configure VS Code as default editor

### Manual Installation

If you prefer manual installation:

```bash
# Install Git
brew install git

# Basic configuration
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
git config --global init.defaultBranch main
```

## Configuration Details

### User Identity

Essential for commit attribution:

```bash
git config --global user.name "Your Full Name"
git config --global user.email "your@email.com"
```

### Core Settings

```bash
# Default branch name
git config --global init.defaultBranch main

# Auto-setup remote tracking
git config --global push.autoSetupRemote true

# Line ending handling
git config --global core.autocrlf input

# Default editor (VS Code)
git config --global core.editor "code --wait"

# Enable colored output
git config --global color.ui auto
```

### Branch Configuration

```bash
# Auto-setup merge for new branches
git config --global branch.autosetupmerge always

# Auto-setup rebase for new branches
git config --global branch.autosetuprebase always

# Default pull behavior (merge, not rebase)
git config --global pull.rebase false
```

### Security and Performance

```bash
# Use macOS Keychain for credentials
git config --global credential.helper osxkeychain

# Handle Unicode properly
git config --global core.precomposeunicode true

# Don't escape non-ASCII characters in filenames
git config --global core.quotepath false
```

## Useful Aliases

The setup script configures these helpful aliases:

```bash
# Basic shortcuts
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit

# Utility aliases
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"
git config --global alias.lg "log --oneline --graph --decorate --all"
git config --global alias.undo "reset --soft HEAD~1"
```

Usage examples:
```bash
git st              # Instead of git status
git lg              # Pretty log with graph
git undo            # Undo last commit (keeping changes)
git unstage file.js # Unstage a file
```

## Global Gitignore

The setup creates a comprehensive global gitignore at `~/.gitignore`:

### macOS Files
```
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
```

### IDE Files
```
.vscode/
.idea/
*.swp
*.swo
*~
```

### Log Files
```
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
```

### Dependencies
```
node_modules/
jspm_packages/
```

### Environment Files
```
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
```

## Essential Git Commands

### Repository Management

```bash
# Initialize new repository
git init

# Clone existing repository
git clone <repository-url>

# Add remote repository
git remote add origin <repository-url>

# Check remote repositories
git remote -v
```

### Daily Workflow

```bash
# Check status
git status          # or git st

# Add changes
git add .           # Add all changes
git add file.js     # Add specific file

# Commit changes
git commit -m "Your commit message"
git commit -am "Add and commit in one step"

# Push changes
git push
git push origin main

# Pull changes
git pull
git pull origin main
```

### Branch Management

```bash
# Create and switch to new branch
git checkout -b feature-branch
git switch -c feature-branch    # Git 2.23+

# Switch branches
git checkout main
git switch main                 # Git 2.23+

# List branches
git branch                      # Local branches
git branch -r                   # Remote branches
git branch -a                   # All branches

# Delete branch
git branch -d feature-branch    # Safe delete
git branch -D feature-branch    # Force delete
```

### Viewing History

```bash
# View commit history
git log
git log --oneline
git lg                          # Using alias

# View changes
git diff                        # Unstaged changes
git diff --staged               # Staged changes
git diff HEAD~1                 # Compare with previous commit
```

### Undoing Changes

```bash
# Unstage changes
git unstage file.js             # Using alias
git reset HEAD file.js          # Standard command

# Discard unstaged changes
git checkout -- file.js
git restore file.js             # Git 2.23+

# Undo last commit (keep changes)
git undo                        # Using alias
git reset --soft HEAD~1         # Standard command

# Undo last commit (discard changes)
git reset --hard HEAD~1
```

## Advanced Configuration

### Conditional Configuration

Set different configurations for different directories:

```bash
# ~/.gitconfig
[includeIf "gitdir:~/work/"]
    path = ~/.gitconfig-work
[includeIf "gitdir:~/personal/"]
    path = ~/.gitconfig-personal
```

### Custom Merge Tools

```bash
# Configure VS Code as merge tool
git config --global merge.tool vscode
git config --global mergetool.vscode.cmd 'code --wait $MERGED'
```

### GPG Signing

```bash
# Configure GPG signing (if you have GPG set up)
git config --global user.signingkey <your-gpg-key-id>
git config --global commit.gpgsign true
```

## Best Practices

### Commit Messages
1. **Use imperative mood**: "Add feature" not "Added feature"
2. **Keep first line under 50 characters**
3. **Provide detailed description** if needed
4. **Reference issues**: "Fix #123: Resolve login bug"

### Branching Strategy
1. **Use descriptive branch names**: `feature/user-authentication`
2. **Keep branches focused**: One feature per branch
3. **Delete merged branches**: Clean up regularly
4. **Use pull requests**: For code review and collaboration

### Repository Hygiene
1. **Commit frequently**: Small, focused commits
2. **Review before committing**: Use `git diff --staged`
3. **Write meaningful commit messages**
4. **Use .gitignore**: Keep repository clean
5. **Tag releases**: Use semantic versioning

## Troubleshooting

### Common Issues

1. **Permission Denied**: Check SSH key setup
2. **Merge Conflicts**: Use merge tools or manual resolution
3. **Large Files**: Use Git LFS for files >100MB
4. **Authentication**: Configure SSH keys or use credential helper

### Verification Commands

```bash
# Check Git installation
git --version
which git

# Check configuration
git config --list
git config --global --list

# Test repository access
git clone git@github.com:github/docs.git test-repo
rm -rf test-repo
```

### Reset Configuration

```bash
# Remove all global Git configuration
rm ~/.gitconfig

# Reconfigure
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

## IDE Integration

### VS Code Integration

Git is built into VS Code with features like:
- **Source Control panel**: Stage, commit, push/pull
- **GitLens extension**: Enhanced Git capabilities
- **Diff viewer**: Visual file comparisons
- **Merge conflict resolution**: Built-in tools

### Terminal Integration

Add Git status to your shell prompt:

```bash
# For Zsh (add to ~/.zshrc)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f%F{yellow}${vcs_info_msg_0_}%f $ '
```

## Security Considerations

### SSH vs HTTPS
- **SSH**: More secure, no password prompts after setup
- **HTTPS**: Easier setup, works with all firewalls

### Credential Storage
```bash
# Store credentials securely on macOS
git config --global credential.helper osxkeychain

# Clear stored credentials if needed
git credential-osxkeychain erase
```

### Sensitive Data
1. **Never commit secrets**: API keys, passwords, etc.
2. **Use environment variables**: For configuration
3. **Use .gitignore**: Prevent accidental commits
4. **Audit repositories**: Check for sensitive data

## Resources

- [Official Git Documentation](https://git-scm.com/doc)
- [Pro Git Book](https://git-scm.com/book)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Atlassian Git Tutorials](https://www.atlassian.com/git/tutorials)
- [GitHub Git Handbook](https://guides.github.com/introduction/git-handbook/)
