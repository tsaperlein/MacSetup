#!/bin/bash

# MacBook Pro Hidden Files Display Script
# This script enables the display of hidden files and folders in Finder

echo "🔍 MacBook Pro Hidden Files Display Script"
echo "=========================================="
echo ""

echo "📁 Showing Library folder..."
chflags nohidden ~/Library
echo "✅ Library folder is now visible"
echo ""

echo "👁️  Enabling hidden files in Finder..."
defaults write com.apple.finder AppleShowAllFiles YES
echo "✅ Hidden files will now be visible in Finder"
echo ""

echo "📍 Enabling path bar in Finder..."
defaults write com.apple.finder ShowPathbar -bool true
echo "✅ Path bar enabled"
echo ""

echo "📊 Enabling status bar in Finder..."
defaults write com.apple.finder ShowStatusBar -bool true
echo "✅ Status bar enabled"
echo ""

echo "🔄 Restarting Finder to apply changes..."
killall Finder
echo "✅ Finder restarted"
echo ""

echo "🎉 All changes applied successfully!"
echo "💡 Your hidden files and folders are now visible in Finder"
echo ""
echo "To reverse these changes, run the companion script: hide-hidden-files.sh"