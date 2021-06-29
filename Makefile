.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

os := $(subst darwin,macos,$(shell uname -s | tr 'A-Z' 'a-z'))

#-------------------------------------------------------------------------------

# common {{{

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

# }}}

#-------------------------------------------------------------------------------

# setup {{{

.PHONY: setup
setup: setup-$(os) ## setup

.PHONY: setup-linux
setup-linux: ## setup Linux
	$(MAKE) -f $(makefile) install-scripts
	$(MAKE) -f $(makefile) clone-urxvt-extension

.PHONY: setup-macos
setup-macos: ## setup macOS
	$(MAKE) -f $(makefile) install-scripts
	$(MAKE) -f $(makefile) set-defaults

# }}}

#-------------------------------------------------------------------------------

# installation targets {{{

.PHONY: install-apt-packages
install-apt-packages: apt ?= sudo apt-get --yes
install-apt-packages: ## install apt packages for Ubuntu/Debian
	-$(apt) install bash
	-$(apt) install bash-completion
	-$(apt) install bat
	#$(apt) install duf # NOTE: Not found
	#$(apt) install exa
	-$(apt) install fd-find
	-$(apt) install fzf
	#$(apt) install gh # NOTE: Not found
	#$(apt) install ghq # NOTE: Not found
	-$(apt) install git
	#$(apt) install git-delta # NOTE: Not found
	#$(apt) install golang
	#$(apt) install mmv # NOTE: Isn't itchyny/mmv
	-$(apt) install jq
	#$(apt) install mitmproxy
	#$(apt) install mosh
	#$(apt) install procs # NOTE: Not found
	-$(apt) install ripgrep
	-$(apt) install tig
	-$(apt) install tmux

.PHONY: install-ports
install-ports: port ?= sudo port
install-ports: ## install ports for macOS
	-$(port) install bash
	-$(port) install bash-completion
	-$(port) install bat
	#$(port) install duf
	#$(port) install exa
	-$(port) install fd
	-$(port) install fswatch
	-$(port) install fzf
	-$(port) install gh
	#$(port) install ghq # NOTE: Not found
	-$(port) install git
	-$(port) install git-delta
	#$(port) install go
	-$(port) install go-mmv
	-$(port) install jq
	#$(port) install mosh
	#$(port) install procs
	#$(port) install py-mitmproxy
	-$(port) install ripgrep
	-$(port) install tig
	-$(port) install tmux

.PHONY: install-scripts
install-scripts: root := $$HOME/.ghq/github.com
install-scripts: ## install apps
	-git clone --depth 1 https://github.com/simonwhitaker/gibo "$(root)/simonwhitaker/gibo"
	-git clone --depth 1 https://github.com/rupa/z.git "$(root)/rupa/z"

# }}}

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
