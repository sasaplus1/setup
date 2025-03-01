.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

root := $(makefile_dir)

gh ?= gh

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: extensions := $(root)/extensions.txt
setup: ## install extensions
	xargs -n 1 $(gh) extension install < '$(extensions)'

.PHONY: maintenance
maintenance: ## maintenance extensions
	$(gh) extension list
	$(gh) extension upgrade --all
