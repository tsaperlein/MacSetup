#!/bin/bash

# MacBook Pro Hidden Files Hide Script
# This script disables the display of hidden files and folders in Finder

echo "🙈 MacBook Pro Hidden Files Hide Script"
echo "======================================="
echo ""

echo "📁 Hiding Library folder..."
chflags hidden ~/Library
echo "✅ Library folder is now hidden"
echo ""

echo "👁️  Disabling hidden files in Finder..."
defaults write com.apple.finder AppleShowAllFiles NO
echo "✅ Hidden files are now hidden in Finder"
echo ""

echo "📍 Disabling path bar in Finder..."
defaults write com.apple.finder ShowPathbar -bool false
echo "✅ Path bar disabled"
echo ""

echo "📊 Disabling status bar in Finder..."
defaults write com.apple.finder ShowStatusBar -bool false
echo "✅ Status bar disabled"
echo ""

echo "🔄 Restarting Finder to apply changes..."
killall Finder
echo "✅ Finder restarted"
echo ""

echo "🎉 All changes applied successfully!"
echo "💡 Hidden files and folders are now hidden in Finder"
echo ""
echo "To show hidden files again, run: show-hidden-files.sh"