.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

root := $(makefile_dir)

sh ?= bash

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: scripts := $(wildcard $(root)/*.sh)
setup: ## install scripts
	find '$(root)' -name '*.sh' -print | xargs -n 1 $(sh)

.PHONY: maintenance
maintenance: setup ## maintenance scripts
