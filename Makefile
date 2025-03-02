.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

os := $(subst darwin,macos,$(shell uname -s | tr 'A-Z' 'a-z'))

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: setup-$(os) ## setup

.PHONY: setup-macos
setup-macos: ## setup macOS
	$(MAKE) install-bootstrap -C macports
	$(MAKE) install-applications -C macports
	$(MAKE) setup -C gh
	$(MAKE) setup -C ghq
	$(MAKE) setup -C sh
	$(MAKE) setup -C defaults

.PHONY: setup-linux
setup-linux: ## setup Linux
	$(MAKE) setup -C apt
	$(MAKE) setup -C gh
	$(MAKE) setup -C ghq
	$(MAKE) setup -C sh
