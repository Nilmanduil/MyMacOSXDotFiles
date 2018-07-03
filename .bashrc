# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Android SDK
export userName=$(whoami)

export OLD_ANDROID_HOME=/Users/$userName/Documents/android-sdk/24.3.2
export NEW_ANDROID_HOME=/Users/$userName/Library/Android/sdk

export ANDROID_HOME=$NEW_ANDROID_HOME
export GRADLE_VERSION=4.1
export GRADLE_HOME=/Applications/Android\ Studio.app/Contents/gradle/gradle-$GRADLE_VERSION

export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools:ANDROID_HOME/tools:$GRADLE_HOME/bin:$PATH

# General Aliases
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias quote="fortune -l | cowthink -W 60 | lolcatjs"
alias clean="rm -rf node_modules && npm install"
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias refreshbash="source ~/.bashrc"

# Project aliases (source project aliases files)

# Customization
nvm use latest
quote
