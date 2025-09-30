#!/bin/bash

# NPM Reset Function
# This function removes node_modules, package-lock.json, and reinstalls dependencies

npmreset() {
  # Check if -c flag is provided for comments
  if [[ "$1" == "-c" ]]; then
    echo "🔥 rm -rf node_modules" &&
    rm -rf node_modules &&
    echo "🔥 rm package-lock.json" &&
    rm package-lock.json &&
    echo "⚡️ npm i" &&
    npm i
  else
    # Run commands without comments
    rm -rf node_modules &&
    rm package-lock.json &&
    npm i
  fi
}

# Make the function available when script is sourced
# Check if we're in bash or zsh and export accordingly
if [[ -n "$BASH_VERSION" ]]; then
    export -f npmreset
fi

# If script is run directly (not sourced), execute the function
# Only execute if running the script directly, not when sourcing it
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    npmreset "$@"
fi