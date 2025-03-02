#!/bin/bash

# ネットワークドライブで.DS_Storeを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores TRUE

# Finderで隠しファイルを表示
defaults write com.apple.finder AppleShowAllFiles TRUE

# Finderでファイルのパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle TRUE

# ダークモードにする
defaults write -globalDomain AppleInterfaceStyle Dark
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to 1'
