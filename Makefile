.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

os := $(subst darwin,macos,$(shell uname -s | tr 'A-Z' 'a-z'))

ifeq ($(os),macos)
  export PATH := /usr/local/Homebrew/bin:$(PATH)
else
  export PATH := /home/linuxbrew/.linuxbrew/bin:$(HOME)/.linuxbrew/bin:$(PATH)
endif

brew ?= $(shell type -tP brew)

#-------------------------------------------------------------------------------

# common {{{

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: homebrew-installed
homebrew-installed: ## check Homebrew installed
	type brew

# }}}

#-------------------------------------------------------------------------------

# setup {{{

.PHONY: setup
setup: setup-$(os) ## setup

.PHONY: setup-linux
setup-linux: install-homebrew ## setup Linux
	$(MAKE) -f $(makefile) update-homebrew
	$(MAKE) -f $(makefile) add-homebrew-taps install-fonts install-brews
	$(MAKE) -f $(makefile) install-apps
	$(MAKE) -f $(makefile) clone-urxvt-extension

.PHONY: setup-macos
setup-macos: install-homebrew ## setup macOS
	$(MAKE) -f $(makefile) update-homebrew
	$(MAKE) -f $(makefile) add-homebrew-taps install-fonts install-brews
	$(MAKE) -f $(makefile) install-apps
	$(MAKE) -f $(makefile) fetch-brew-casks set-defaults

# }}}

#-------------------------------------------------------------------------------

# install Homebrew {{{

.PHONY: install-homebrew
install-homebrew: install-homebrew-$(os) ## install Homebrew

.PHONY: install-homebrew-linux
install-homebrew-linux: ## install Homebrew for Linux
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

.PHONY: install-homebrew-macos
install-homebrew-macos: ## install Homebrew for macOS
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# }}}

#-------------------------------------------------------------------------------

# update Homebrew {{{

.PHONY: update-homebrew
update-homebrew: homebrew-installed
update-homebrew: ## update Homebrew
	brew update

# }}}

#-------------------------------------------------------------------------------

# add Homebrew taps {{{

.PHONY: add-homebrew-taps
add-homebrew-taps: homebrew-installed
add-homebrew-taps: add-homebrew-taps-$(os) ## add brew taps

.PHONY: add-homebrew-taps-linux
add-homebrew-taps-linux: ## add brew taps for Linux

.PHONY: add-homebrew-taps-macos
add-homebrew-taps-macos: ## add brew taps for macOS
	brew tap homebrew/cask-fonts
	brew tap homebrew/cask-versions

# }}}

#-------------------------------------------------------------------------------

# install fonts {{{

.PHONY: install-fonts
install-fonts: homebrew-installed
install-fonts: install-fonts-$(os) ## install fonts

.PHONY: install-fonts-linux
install-fonts-linux: ## install fonts for Linux

.PHONY: install-fonts-macos
install-fonts-macos: ## install fonts for macOS
	-brew cask install font-inconsolata
	-brew cask install font-migmix-1p

# }}}

#-------------------------------------------------------------------------------

# install brews {{{

.PHONY: install-brews
install-brews: homebrew-installed
install-brews: install-brews-$(os) ## install brews
	-brew install bash
	-brew install bash-completion
	-brew install bat
	#brew install bitwarden-cli
	#brew install ctags
	#brew install denji/nginx/nginx-full --with-subs-filter-module
	#brew install docker
	-brew install exa
	-brew install fd
	-brew install fzf
	-brew install ghq
	-brew install gibo
	-brew install git
	-brew install gh
	-brew install git-delta
	-brew install go
	#brew install hub
	-brew install itchyny/tap/mmv
	-brew install jq
	#brew install mercurial
	-brew install mitmproxy
	#brew install monochromegane/pt/pt
	-brew install mosh
	-brew install muesli/tap/duf
	#brew install neovim
	#brew install nodebrew
	#brew install peco
	-brew install procs
	#brew install pyenv
	#brew install ranger
	#brew install rbenv
	#brew install rbenv-default-gems
	#brew install redis
	-brew install ripgrep
	#brew install ruby-build
	#brew install sqlite
	#brew install textql
	#brew install the_silver_searcher
	-brew install tig
	-brew install tmux
	-brew install tree
	#brew install --HEAD universal-ctags/universal-ctags/universal-ctags
	#brew install vcprompt
	#brew install z

.PHONY: install-brews-linux
install-brews-linux: ## install brews for Linux

.PHONY: install-brews-macos
install-brews-macos: ## install brews for macOS
	-brew install fswatch
	#brew install mas
	#brew install reattach-to-user-namespace
	#brew install unar

# }}}

#-------------------------------------------------------------------------------

.PHONY: install-apps
install-apps: root := $$HOME/.ghq/github.com
install-apps: ## install apps
	-git clone --depth 1 https://github.com/rupa/z.git "$(root)/rupa/z"

#-------------------------------------------------------------------------------

# extra targets {{{

.PHONY: clone-urxvt-extension
clone-urxvt-extension: ## get urxvt extension
	git clone https://github.com/muennich/urxvt-perls.git $$HOME/.urxvt/urxvt-perls

.PHONY: fetch-brew-casks
fetch-brew-casks: homebrew-installed
fetch-brew-casks: ## install brew casks
	-brew cask fetch alacritty
	-brew cask fetch alfred
	-brew cask fetch android-platform-tools
	-brew cask fetch bitwarden
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
	#brew cask fetch delphinus/macvim-kaoriya/macvim-kaoriya
	-brew cask fetch ngrok
	-brew cask fetch safari-technology-preview
	#brew cask fetch send-to-kindle
	#brew cask fetch simple-comic
	-brew cask fetch skitch
	-brew cask fetch slate
	-brew cask fetch softu2f
	#brew cask fetch terminus
	#brew cask fetch vagrant
	-brew cask fetch virtualbox
	-brew cask fetch visual-studio-code

.PHONY: set-defaults
set-defaults: ## set defaults for macOS
	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults write com.apple.finder _FXShowPosixPathInTitle TRUE

# }}}

# vim:fdm=marker:
