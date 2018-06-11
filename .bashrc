# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Android SDK
export userName=$(whoami)

export OLD_ANDROID_HOME=/Users/$userName/Documents/android-sdk/24.3.2
export NEW_ANDROID_HOME=/Users/$userName/Library/Android/sdk

export ANDROID_HOME=$NEW_ANDROID_HOME

export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools:ANDROID_HOME/tools:/Applications/Android\ Studio.app/Contents/gradle/gradle-4.1/bin:$PATH

# Aliases
alias quote="fortune -l | cowthink -W 60 | lolcatjs"
alias cordova7="npm uninstall -g cordova && npm install -g cordova@7.0.0"
alias cordova8="npm uninstall -g cordova && npm install -g cordova@8.0.0"
alias clean-android="ionic platform rm android && ionic platform add android@7.1.0"
alias clean="rm -rf node_modules && npm install"

# Customization
nvm use latest
quote
