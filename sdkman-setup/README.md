# SDKMAN Setup

## Overview

SDKMAN (Software Development Kit Manager) is a tool for managing parallel versions of multiple Software Development Kits on most Unix-based systems. It's particularly useful for Java developers who need to work with different JDK versions and related tools.

## What is SDKMAN?

SDKMAN allows you to:
- Install and manage multiple JDK versions (Oracle, OpenJDK, Amazon Corretto, etc.)
- Manage Java-related tools (Maven, Gradle, Kotlin, Scala, etc.)
- Switch between different versions easily
- Set default versions globally or per-project
- Keep your development environment consistent across teams

## Installation

### Automated Installation

Run the installation script:

```bash
./install-sdkman.sh
```

### Manual Installation

```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Basic Usage

### Java Management

```bash
# List available Java versions
sdk list java

# Install specific Java version
sdk install java 21.0.1-tem      # Temurin (Eclipse Adoptium)
sdk install java 17.0.9-oracle   # Oracle JDK
sdk install java 11.0.21-amzn    # Amazon Corretto

# Switch Java version for current session
sdk use java 17.0.9-oracle

# Set default Java version
sdk default java 21.0.1-tem

# Show current Java version
sdk current java

# Uninstall Java version
sdk uninstall java 11.0.21-amzn
```

### Other Development Tools

```bash
# Maven
sdk list maven
sdk install maven
sdk install maven 3.9.5

# Gradle
sdk list gradle
sdk install gradle
sdk install gradle 8.4

# Kotlin
sdk list kotlin
sdk install kotlin

# Scala
sdk list scala
sdk install scala

# Spring Boot CLI
sdk list springboot
sdk install springboot

# Micronaut CLI
sdk list micronaut
sdk install micronaut
```

## Available SDKs

SDKMAN supports numerous SDKs and tools:

### JDK Distributions
- **Temurin** (Eclipse Adoptium) - Recommended
- **Oracle JDK** - Official Oracle distribution
- **Amazon Corretto** - Amazon's OpenJDK distribution
- **Zulu** - Azul's OpenJDK distribution
- **Liberica** - BellSoft's OpenJDK distribution
- **GraalVM** - High-performance JDK with ahead-of-time compilation

### Build Tools
- **Maven** - Project management and build tool
- **Gradle** - Build automation tool
- **SBT** - Scala build tool
- **Leiningen** - Clojure build tool

### Languages & Frameworks
- **Kotlin** - JetBrains' programming language
- **Scala** - Scalable programming language
- **Groovy** - Dynamic language for the JVM
- **Clojure** - Lisp dialect for the JVM

### Frameworks & Tools
- **Spring Boot** - Spring application framework
- **Micronaut** - Modern microservices framework
- **Quarkus** - Kubernetes-native Java framework
- **Vert.x** - Reactive application toolkit

## Advanced Usage

### Project-Specific Versions

Create a `.sdkmanrc` file in your project root:

```bash
# .sdkmanrc
java=17.0.9-tem
maven=3.9.5
gradle=8.4
```

Then use:
```bash
sdk env install  # Install all versions specified in .sdkmanrc
sdk env          # Switch to versions specified in .sdkmanrc
```

### Auto-switching

Enable automatic version switching:

```bash
# Add to ~/.zshrc or ~/.bash_profile
export SDKMAN_AUTO_ENV=true
```

Now SDKMAN will automatically switch versions when entering directories with `.sdkmanrc` files.

### Offline Mode

```bash
# Enable offline mode (use cached versions only)
sdk offline enable

# Disable offline mode
sdk offline disable
```

## Configuration

### SDKMAN Configuration

Edit `~/.sdkman/etc/config`:

```bash
# Auto-answer prompts
sdkman_auto_answer=true

# Auto-switch versions based on .sdkmanrc
sdkman_auto_env=true

# Enable colored output
sdkman_colour_enable=true

# Set auto-completion
sdkman_auto_complete=true

# Beta channel for early access
sdkman_beta_channel=false

# Selfupdate check frequency (in hours)
sdkman_selfupdate_delay=24
```

### Shell Integration

SDKMAN automatically adds configuration to your shell profile:

```bash
# Added to ~/.zshrc and ~/.bash_profile
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

## Best Practices

1. **Use LTS Versions**: Prefer LTS (Long Term Support) Java versions for production
2. **Project Configuration**: Always include `.sdkmanrc` in your projects
3. **Team Consistency**: Ensure all team members use the same SDK versions
4. **Regular Updates**: Keep SDKMAN and SDKs updated regularly
5. **Clean Up**: Remove unused SDK versions to save disk space

## Common Workflows

### New Java Project Setup

```bash
# Create project directory
mkdir myproject && cd myproject

# Create .sdkmanrc file
cat > .sdkmanrc << EOF
java=21.0.1-tem
maven=3.9.6
EOF

# Install and use specified versions
sdk env install
sdk env

# Verify versions
java -version
mvn -version
```

### Multi-Version Testing

```bash
# Test with different Java versions
sdk use java 11.0.21-tem
./gradlew test

sdk use java 17.0.9-tem
./gradlew test

sdk use java 21.0.1-tem
./gradlew test
```

## Troubleshooting

### Common Issues

1. **Installation Fails**: Check internet connection and firewall settings
2. **Command Not Found**: Restart terminal or source SDKMAN init script
3. **Version Conflicts**: Use `sdk current` to check active versions
4. **Path Issues**: Ensure SDKMAN is loaded after other PATH modifications

### Verification Commands

```bash
# Check SDKMAN installation
sdk version

# List installed SDKs
sdk current

# Show SDKMAN configuration
cat ~/.sdkman/etc/config

# Check Java installation
java -version
javac -version
echo $JAVA_HOME
```

### Reset SDKMAN

```bash
# Completely remove SDKMAN
rm -rf ~/.sdkman

# Reinstall
curl -s "https://get.sdkman.io" | bash
```

## IDE Integration

### IntelliJ IDEA

1. **File > Project Structure > SDKs**
2. **Add SDK > JDK**
3. **Navigate to**: `~/.sdkman/candidates/java/[version]`

### VS Code

Install Java Extension Pack and configure:

```json
{
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-11",
      "path": "~/.sdkman/candidates/java/11.0.21-tem"
    },
    {
      "name": "JavaSE-17",
      "path": "~/.sdkman/candidates/java/17.0.9-tem"
    },
    {
      "name": "JavaSE-21",
      "path": "~/.sdkman/candidates/java/21.0.1-tem"
    }
  ]
}
```

### Eclipse

1. **Window > Preferences > Java > Installed JREs**
2. **Add > Standard VM**
3. **JRE home**: `~/.sdkman/candidates/java/[version]`

## Performance Tips

### Faster Downloads

```bash
# Use parallel downloads
export SDKMAN_PARALLEL_DOWNLOAD=true

# Set download timeout
export SDKMAN_DOWNLOAD_TIMEOUT=300
```

### Disk Space Management

```bash
# List installed candidates with sizes
sdk list java | grep installed

# Remove old versions
sdk uninstall java 8.0.392-tem

# Clean temporary files
rm -rf ~/.sdkman/tmp/*
```

## Resources

- [Official SDKMAN Website](https://sdkman.io/)
- [SDKMAN GitHub Repository](https://github.com/sdkman/sdkman-cli)
- [Available Candidates](https://sdkman.io/sdks)
- [SDKMAN Usage Guide](https://sdkman.io/usage)
- [Java Version History](https://en.wikipedia.org/wiki/Java_version_history)
