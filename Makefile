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
	-$(apt) update
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
	-$(apt) install vifm
	-$(apt) install zoxide

.PHONY: install-ports
install-ports: commands :=
install-ports: commands += bash
install-ports: commands += bash-completion
install-ports: commands += bat
install-ports: commands += direnv
#install-ports: commands += duf
#install-ports: commands += exa
install-ports: commands += fd
install-ports: commands += fswatch
install-ports: commands += fzf
install-ports: commands += gh
# install-ports: commands += ghq # NOTE: Not found
install-ports: commands += git
install-ports: commands += git-delta
install-ports: commands += go
install-ports: commands += go-mmv
install-ports: commands += jq
#install-ports: commands += mosh
#install-ports: commands += procs
#install-ports: commands += py-mitmproxy
install-ports: commands += ripgrep
install-ports: commands += tig
install-ports: commands += tmux
#install-ports: commands += vifm
install-ports: commands += zoxide
install-ports: port ?= sudo port -N
install-ports: ## install ports for macOS
	-$(port) selfupdate
	-printf -- 'install %s\n' $(commands) | $(port) -F -

.PHONY: install-scripts
install-scripts: root := $$HOME/.ghq/github.com
install-scripts: ## install apps
	-git clone https://github.com/simonwhitaker/gibo "$(root)/simonwhitaker/gibo"

# }}}

#-------------------------------------------------------------------------------

# extra targets {{{

.PHONY: clone-urxvt-extension
clone-urxvt-extension: ## get urxvt extension
	git clone https://github.com/muennich/urxvt-perls.git $$HOME/.urxvt/urxvt-perls

.PHONY: set-defaults
set-defaults: ## set defaults for macOS
	defaults write com.apple.desktopservices DSDontWriteNetworkStores TRUE
	defaults write com.apple.finder AppleShowAllFiles TRUE
	defaults write com.apple.finder _FXShowPosixPathInTitle TRUE

# }}}

# vim:fdm=marker:
