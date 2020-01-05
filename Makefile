.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

os := $(subst darwin,macos,$(shell uname -s | tr 'A-Z' 'a-z'))

homebrew_dir := $(HOME)/Homebrew

.PHONY: add-homebrew-taps
add-homebrew-taps: add-homebrew-taps-$(os) ## add brew taps

.PHONY: add-homebrew-taps-macos
add-homebrew-taps-macos: ## add brew taps for macOS
	brew tap delphinus/macvim-kaoriya
	brew tap homebrew/cask-fonts
	brew tap homebrew/cask-versions
	brew tap universal-ctags/universal-ctags

.PHONY: add-homebrew-taps-linux
add-homebrew-taps-linux: ## add brew taps for Linux

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: clone-urxvt-extension
clone-urxvt-extension: ## get urxvt extension
	git clone https://github.com/muennich/urxvt-perls.git $$HOME/.urxvt/urxvt-perls

.PHONY: install-brews
install-brews: install-brews-$(os) ## install brews
	-brew install bash-completion
	#brew install ctags
	#brew install docker
	-brew install fd
	-brew install fzf
	-brew install ghq
	-brew install gibo
	-brew install git
	-brew install go
	-brew install hub
	-brew install jq
	#brew install mercurial
	#brew install mitmproxy
	-brew install monochromegane/pt/pt
	#brew install neovim
	-brew install denji/nginx/nginx-full --with-subs-filter-module
	#brew install nodebrew
	-brew install peco
	-brew install pyenv
	-brew install ranger
	-brew install rbenv
	-brew install rbenv-default-gems
	#brew install redis
	-brew install ripgrep
	-brew install ruby-build
	#brew install sqlite
	#brew install textql
	#brew install the_silver_searcher
	-brew install tig
	-brew install tmux
	-brew install tree
	-brew install universal-ctags
	#brew install vcprompt
	-brew install z

.PHONY: install-brews-linux
install-brews-linux: ## install brews for Linux
	-brew install pkg-config

.PHONY: install-brews-macos
install-brews-macos: ## install brews for macOS
	#brew install android-platform-tools
	#brew install fswatch
	-brew install mas
	#brew install reattach-to-user-namespace
	#brew install unar

# apt-install:
#   - { name: 'build-essential'   }
#   - { name: 'curl'              }
#   - { name: 'git'               }
#   - { name: 'python-setuptools' }
#   - { name: 'ruby'              }

.PHONY: fetch-brew-casks
fetch-brew-casks: ## install brew casks
	#brew cask fetch alacritty
	-brew cask fetch alfred
	#brew cask fetch chromium
	-brew cask fetch docker
	#brew cask fetch dropbox
	-brew cask fetch firefox --language=ja
	-brew cask fetch firefox-developer-edition --language=ja
	-brew cask fetch google-chrome
	-brew cask fetch google-chrome-canary
	#brew cask fetch gyazo
	#brew cask fetch hyper
	#brew cask fetch insomnia
	#brew cask fetch iterm2
	-brew cask fetch kap
	-brew cask fetch macvim-kaoriya
	-brew cask fetch ngrok
	-brew cask fetch safari-technology-preview
	#brew cask fetch send-to-kindle
	#brew cask fetch simple-comic
	-brew cask fetch slate
	-brew cask fetch softu2f
	#brew cask fetch terminus
	#brew cask fetch vagrant
	-brew cask fetch virtualbox
	-brew cask fetch visual-studio-code

.PHONY: install-fonts
install-fonts: ## install fonts
	-brew cask install font-inconsolata
	-brew cask install font-migmix-1p

define __install_homebrew_script
  case '$(os)' in
    macos)
      tarball=https://github.com/Homebrew/homebrew/tarball/master
      ;;
    linux)
      tarball=https://github.com/Linuxbrew/brew/tarball/master
      ;;
    *)
      printf -- '%s\n' 'do not support this platform.' 1>&2
      exit 1
      ;;
  esac

  if [ -e '$(homebrew_dir)/bin/brew' ]
  then
    printf -- '%s\n' 'Homebrew is already installed.'
  else
    mkdir -p '$(homebrew_dir)'
    curl -fsSL $$tarball | tar xz --strip 1 -C '$(homebrew_dir)'
  fi
endef
export __install_homebrew_script

.PHONY: install-homebrew
install-homebrew: ## install Homebrew
	$(SHELL) -c "$$__install_homebrew_script"
	brew update

.PHONY: set-defaults
set-defaults: ## set defaults for macOS
	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults write com.apple.finder _FXShowPosixPathInTitle TRUE

.PHONY: setup
setup: setup-$(os) ## setup

.PHONY: setup-linux
setup-linux: install-homebrew add-homebrew-taps install-fonts install-brews
setup-linux: clone-urxvt-extension ## setup Linux

.PHONY: setup-macos
setup-macos: install-homebrew add-homebrew-taps install-fonts install-brews
setup-macos: fetch-brew-casks set-defaults ## setup macOS
