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
	$(MAKE) -f $(makefile) add-homebrew-taps install-fonts
	$(MAKE) -f $(makefile) install-apps
	$(MAKE) -f $(makefile) clone-urxvt-extension

.PHONY: setup-macos
setup-macos: install-homebrew ## setup macOS
	$(MAKE) -f $(makefile) update-homebrew
	$(MAKE) -f $(makefile) add-homebrew-taps install-fonts
	$(MAKE) -f $(makefile) install-apps
	$(MAKE) -f $(makefile) set-defaults

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

.PHONY: set-defaults
set-defaults: ## set defaults for macOS
	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults write com.apple.finder _FXShowPosixPathInTitle TRUE

# }}}

# vim:fdm=marker:
