.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

os := $(subst darwin,macos,$(shell uname -s | tr 'A-Z' 'a-z'))

homebrew_dir := $(HOME)/Homebrew
homebrew_bin := $(homebrew_dir)/bin/brew

.PHONY: add-homebrew-taps
add-homebrew-taps: add-homebrew-taps-$(os) ## add brew taps

.PHONY: add-homebrew-taps-macos
add-homebrew-taps-macos: ## add brew taps for macOS
	$(homebrew_bin) tap delphinus/macvim-kaoriya
	$(homebrew_bin) tap homebrew/cask-fonts
	$(homebrew_bin) tap homebrew/cask-versions
	$(homebrew_bin) tap universal-ctags/universal-ctags

.PHONY: add-homebrew-taps-linux
add-homebrew-taps-linux: ## add brew taps for Linux

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: clone-urxvt-extension
clone-urxvt-extension: ## get urxvt extension
	git clone https://github.com/muennich/urxvt-perls.git $$HOME/.urxvt/urxvt-perls

.PHONY: fetch-brew-casks
fetch-brew-casks: ## install brew casks
	#$(homebrew_bin) cask fetch alacritty
	-$(homebrew_bin) cask fetch alfred
	#$(homebrew_bin) cask fetch chromium
	-$(homebrew_bin) cask fetch docker
	#$(homebrew_bin) cask fetch dropbox
	-$(homebrew_bin) cask fetch firefox --language=ja
	-$(homebrew_bin) cask fetch firefox-developer-edition --language=ja
	-$(homebrew_bin) cask fetch google-chrome
	-$(homebrew_bin) cask fetch google-chrome-canary
	#$(homebrew_bin) cask fetch gyazo
	#$(homebrew_bin) cask fetch hyper
	#$(homebrew_bin) cask fetch insomnia
	#$(homebrew_bin) cask fetch iterm2
	-$(homebrew_bin) cask fetch kap
	-$(homebrew_bin) cask fetch macvim-kaoriya
	-$(homebrew_bin) cask fetch ngrok
	-$(homebrew_bin) cask fetch safari-technology-preview
	#$(homebrew_bin) cask fetch send-to-kindle
	#$(homebrew_bin) cask fetch simple-comic
	-$(homebrew_bin) cask fetch slate
	-$(homebrew_bin) cask fetch softu2f
	#$(homebrew_bin) cask fetch terminus
	#$(homebrew_bin) cask fetch vagrant
	-$(homebrew_bin) cask fetch virtualbox
	-$(homebrew_bin) cask fetch visual-studio-code

.PHONY: install-brews
install-brews: install-brews-$(os) ## install brews
	-$(homebrew_bin) install bash-completion
	#$(homebrew_bin) install ctags
	#$(homebrew_bin) install docker
	-$(homebrew_bin) install fd
	-$(homebrew_bin) install fzf
	-$(homebrew_bin) install ghq
	-$(homebrew_bin) install gibo
	-$(homebrew_bin) install git
	-$(homebrew_bin) install go
	-$(homebrew_bin) install hub
	-$(homebrew_bin) install jq
	#$(homebrew_bin) install mercurial
	#$(homebrew_bin) install mitmproxy
	-$(homebrew_bin) install monochromegane/pt/pt
	#$(homebrew_bin) install neovim
	-$(homebrew_bin) install denji/nginx/nginx-full --with-subs-filter-module
	#$(homebrew_bin) install nodebrew
	-$(homebrew_bin) install peco
	-$(homebrew_bin) install pyenv
	-$(homebrew_bin) install ranger
	-$(homebrew_bin) install rbenv
	-$(homebrew_bin) install rbenv-default-gems
	#$(homebrew_bin) install redis
	-$(homebrew_bin) install ripgrep
	-$(homebrew_bin) install ruby-build
	#$(homebrew_bin) install sqlite
	#$(homebrew_bin) install textql
	#$(homebrew_bin) install the_silver_searcher
	-$(homebrew_bin) install tig
	-$(homebrew_bin) install tmux
	-$(homebrew_bin) install tree
	-$(homebrew_bin) install universal-ctags
	#$(homebrew_bin) install vcprompt
	-$(homebrew_bin) install z

.PHONY: install-brews-linux
install-brews-linux: ## install brews for Linux
	-$(homebrew_bin) install pkg-config

.PHONY: install-brews-macos
install-brews-macos: ## install brews for macOS
	#$(homebrew_bin) install android-platform-tools
	#$(homebrew_bin) install fswatch
	-$(homebrew_bin) install mas
	#$(homebrew_bin) install reattach-to-user-namespace
	#$(homebrew_bin) install unar

# apt-install:
#   - { name: 'build-essential'   }
#   - { name: 'curl'              }
#   - { name: 'git'               }
#   - { name: 'python-setuptools' }
#   - { name: 'ruby'              }

.PHONY: install-fonts
install-fonts: ## install fonts
	-$(homebrew_bin) cask install font-inconsolata
	-$(homebrew_bin) cask install font-migmix-1p

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
	$(homebrew_bin) update

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
