#!/bin/sh

# Mac defaults
# Show the ~/Library folder.
chflags nohidden ~/Library
# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew formulae
brew install fortune cowsay libsass coreutils cmatrix wget m-cli fd

# NVM + Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install stable
nvm use stable

# Node global modules
npm install -g ionic cordova lolcatjs bower ios-deploy ios-sim taskbook shellcheck

# SUPER folders
mkdir ~/super
mkdir ~/super/toTest
mkdir ~/super/jars
mkdir ~/super/dists
mkdir ~/super/results
mkdir ~/super/tested
