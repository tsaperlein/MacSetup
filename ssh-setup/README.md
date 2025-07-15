# SSH Key Setup

## Overview

This guide covers generating and configuring SSH keys for secure Git operations. SSH keys provide a more secure and convenient way to authenticate with Git hosting platforms like GitHub, GitLab, and others without needing to enter passwords.

## What are SSH Keys?

SSH keys are a pair of cryptographic keys used for secure authentication:
- **Private Key**: Kept secret on your machine
- **Public Key**: Shared with Git hosting platforms

This setup eliminates the need for password authentication and provides better security.

## Installation

### Automated Setup

Run the SSH setup script:

```bash
./setup-ssh.sh
```

This script will:
- ✅ Create SSH directory with proper permissions
- ✅ Generate SSH keys (Ed25519 format for better security)
- ✅ Configure SSH agent
- ✅ Create optimized SSH config file
- ✅ Display public keys for copying to platforms
- ✅ Provide platform-specific instructions

### Manual Setup

If you prefer manual setup:

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your@email.com"

# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to SSH agent
ssh-add ~/.ssh/id_ed25519
```

## Key Types and Options

### Key Type Selection

The script uses **Ed25519** keys by default (recommended):
- **Ed25519**: Modern, secure, fast (recommended)
- **RSA 4096**: Traditional, widely supported
- **ECDSA**: Good security, but Ed25519 is preferred

### Generation Options

1. **Default Key**: Single key for all platforms
2. **Platform-specific Keys**: Separate keys for GitHub, GitLab, etc.
3. **Both**: Default key plus platform-specific keys

## SSH Configuration

### SSH Config File

The script creates an optimized `~/.ssh/config`:

```bash
# Default settings
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentitiesOnly yes
    ServerAliveInterval 60
    ServerAliveCountMax 30

# GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_ed25519

# GitLab
Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/gitlab_ed25519
```

### Configuration Benefits

- **AddKeysToAgent**: Automatically loads keys
- **UseKeychain**: Stores passphrase in macOS Keychain
- **IdentitiesOnly**: Only use specified identity files
- **ServerAlive**: Prevents connection timeouts

## Adding Keys to Platforms

### GitHub

1. Copy your public key:
   ```bash
   pbcopy < ~/.ssh/github_ed25519.pub
   ```

2. Go to GitHub Settings:
   - Visit: https://github.com/settings/ssh
   - Click "New SSH key"
   - Give it a descriptive title
   - Paste the key content
   - Click "Add SSH key"

3. Test the connection:
   ```bash
   ssh -T git@github.com
   ```

### GitLab

1. Copy your public key:
   ```bash
   pbcopy < ~/.ssh/gitlab_ed25519.pub
   ```

2. Go to GitLab SSH Keys:
   - Visit: https://gitlab.com/-/profile/keys
   - Click "Add SSH key"
   - Paste the key content
   - Add a title and set expiration (optional)
   - Click "Add key"

3. Test the connection:
   ```bash
   ssh -T git@gitlab.com
   ```

### Other Platforms

For other Git hosting platforms:
1. Copy the default public key: `pbcopy < ~/.ssh/id_ed25519.pub`
2. Find the SSH keys section in platform settings
3. Add the public key with a descriptive title

## Using SSH with Git

### Clone Repositories

```bash
# Use SSH URL instead of HTTPS
git clone git@github.com:username/repository.git

# Instead of:
git clone https://github.com/username/repository.git
```

### Convert HTTPS to SSH

```bash
# Check current remote
git remote -v

# Change to SSH
git remote set-url origin git@github.com:username/repository.git
```

### SSH URL Formats

- **GitHub**: `git@github.com:username/repository.git`
- **GitLab**: `git@gitlab.com:username/repository.git`
- **Bitbucket**: `git@bitbucket.org:username/repository.git`

## SSH Agent Management

### Start SSH Agent

```bash
# Start SSH agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Add all keys
ssh-add ~/.ssh/id_*
```

### List Loaded Keys

```bash
# List keys in SSH agent
ssh-add -l

# List with fingerprints
ssh-add -l -E sha256
```

### Remove Keys

```bash
# Remove specific key
ssh-add -d ~/.ssh/id_ed25519

# Remove all keys
ssh-add -D
```

## Advanced Configuration

### Multiple GitHub Accounts

```bash
# ~/.ssh/config
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_work_ed25519

Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_personal_ed25519
```

Usage:
```bash
# Clone with specific account
git clone git@github-work:company/repository.git
git clone git@github-personal:username/repository.git
```

### SSH Key Passphrases

For additional security, use passphrases:

```bash
# Generate key with passphrase
ssh-keygen -t ed25519 -C "your@email.com"
# (Enter passphrase when prompted)

# Use macOS Keychain to store passphrase
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

### Conditional SSH Config

```bash
# Use different keys based on directory
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_work_ed25519
    IdentitiesOnly yes
    # Only for work projects in ~/work/
```

## Troubleshooting

### Common Issues

1. **Permission Denied**: Check key is added to platform
2. **Authentication Failed**: Verify SSH agent has key loaded
3. **Wrong Key Used**: Check SSH config and IdentitiesOnly setting
4. **Connection Timeout**: Check ServerAlive settings

### Verification Commands

```bash
# Test SSH connection
ssh -T git@github.com

# Debug SSH connection
ssh -vT git@github.com

# Check SSH agent
ssh-add -l

# Verify key permissions
ls -la ~/.ssh/
```

### Fix Permission Issues

```bash
# Fix SSH directory permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub
chmod 600 ~/.ssh/config
```

### Reset SSH Setup

```bash
# Remove all SSH keys and config
rm -rf ~/.ssh

# Regenerate
ssh-keygen -t ed25519 -C "your@email.com"
```

## Security Best Practices

### Key Management
1. **Use Ed25519 keys**: More secure than RSA
2. **Use passphrases**: Add extra layer of security
3. **Rotate keys regularly**: Generate new keys periodically
4. **Remove unused keys**: Clean up old keys from platforms
5. **Secure storage**: Never share private keys

### Platform Security
1. **Enable 2FA**: Use two-factor authentication on platforms
2. **Review SSH keys**: Regularly audit keys in platform settings
3. **Set key expiration**: Use expiring keys when possible
4. **Monitor usage**: Check for unauthorized access

### Backup and Recovery
1. **Backup keys**: Store private keys securely
2. **Document setup**: Keep notes on key purposes
3. **Recovery plan**: Know how to regenerate and reconfigure

## Performance Tips

### SSH Connection Multiplexing

Add to SSH config for faster connections:

```bash
Host *
    ControlMaster auto
    ControlPath ~/.ssh/control-%h-%p-%r
    ControlPersist 600
```

### Persistent Connections

```bash
Host github.com
    ServerAliveInterval 60
    ServerAliveCountMax 30
    TCPKeepAlive yes
```

## Integration with Development Tools

### VS Code Integration

SSH keys work automatically with VS Code's Git integration and remote development features.

### Terminal Integration

Add SSH agent to shell startup:

```bash
# Add to ~/.zshrc
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519 2>/dev/null
fi
```

## Resources

- [GitHub SSH Documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [GitLab SSH Documentation](https://docs.gitlab.com/ee/ssh/)
- [SSH.com Guide](https://www.ssh.com/academy/ssh)
- [OpenSSH Manual](https://man.openbsd.org/ssh)
- [SSH Best Practices](https://stribika.github.io/2015/01/04/secure-secure-shell.html)
