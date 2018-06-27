# Project variables
export APP_NAME=
export APP_VERSION=
export APK_FOLDER=
export KEYSTORE_PATH=
export KEY_ALIAS=
export KEYSTORE_PASSWORD=
export IPA_FOLDER=
export IOS_CONFIG_FOLDER=

alias cordova7="npm uninstall -g cordova && npm install -g cordova@7.0.0"
alias cordova8="npm uninstall -g cordova && npm install -g cordova@8.0.0"
alias clean-android="ionic platform rm android && ionic platform add android@7.1.0"
alias clean-ios="ionic platform rm ios && ionic platform add ios@4.5.4"

alias clean="rm -rf node_modules && npm install"
alias rmbin="rm -rf $APK_FOLDER && rm -rf $IPA_FOLDER 2> /dev/null"

alias rmrelease="rm -f $APK_FOLDER/$APP_NAME-release-$APP_VERSION.apk"
alias jarrelease="jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $KEYSTORE_PATH -tsa http://timestamp.comodoca.com/rfc3161 $APK_FOLDER/$APP_NAME-release-unsigned-$APP_VERSION.apk $KEY_ALIAS -storepass $KEYSTORE_PASSWORD"
alias ziprelease="zipalign -v 4 $APK_FOLDER/$APP_NAME-release-unsigned-$APP_VERSION.apk $APK_FOLDER/$APP_NAME-release-$APP_VERSION.apk"
alias sign="rmrelease; jarrelease && ziprelease"

alias installdebug="adb install -r $APK_FOLDER/$APP_NAME-debug-unaligned-$APP_VERSION.apk"
alias installrelease="adb install -r $APK_FOLDER/$APP_NAME-release-$APP_VERSION.apk"

alias archiveipa="xcodebuild archive -project ./platforms/ios/$APP_NAME.xcodeproj -scheme $APP_NAME -archivePath $IPA_FOLDER/$APP_NAME-$APP_VERSION.xcarchive"
alias compiledebugipa="xcodebuild -exportArchive -archivePath $IPA_FOLDER/$APP_NAME-$APP_VERSION.xcarchive -exportPath $IPA_FOLDER/$APP_NAME-$APP_VERSION-debug.ipa -exportOptionsPlist $IOS_CONFIG_FOLDER/ExportOptionsAdHoc.plist"
alias compilereleaseipa="xcodebuild -exportArchive -archivePath $IPA_FOLDER/$APP_NAME-$APP_VERSION.xcarchive -exportPath $IPA_FOLDER/$APP_NAME-$APP_VERSION-release.ipa -exportOptionsPlist $IOS_CONFIG_FOLDER/ExportOptionsAppStore.plist"
alias cleanarchive="rm -rf $IPA_FOLDER/$APP_NAME-$APP_VERSION.xcarchive"
alias ipadebug="archiveipa && compiledebugipa && cleanarchive"
alias iparelease="archiveipa && compilereleaseipa && cleanarchive"
