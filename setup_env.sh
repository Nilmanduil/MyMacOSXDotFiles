#!/bin/bash

# Ask for the administrator password upfront.
sudo -v

# Mac defaults
# Show the ~/Library folder.
chflags nohidden ~/Library
# Show hidden files
defaults write com.apple.Finder AppleShowAllFiles true
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Brew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Brew formulae
brew update
brew upgrade --all
brew install android-sdk fortune cowsay libsass coreutils moreutils findutils cmatrix wget m-cli fd shellcheck osquery
brew cleanup

# NVM + Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
nvm install stable
nvm use stable

# Node global modules
npm install -g ionic cordova lolcatjs bower ios-deploy ios-sim taskbook fx typed-install

# SUPER folders
mkdir ~/super
mkdir ~/super/toTest
mkdir ~/super/jars
mkdir ~/super/dists
mkdir ~/super/results
mkdir ~/super/tested

sudo softwareupdate -ir
xcode-select --install
