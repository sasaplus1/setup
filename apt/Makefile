.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

root := $(makefile_dir)

apt ?= sudo apt-get --yes

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: applications := $(root)/applications.txt
setup: ## install applications
	$(apt) update
	grep -v '^#' '$(applications)' | xargs $(apt) install

.PHONY: maintenance
maintenance: ## maintenance applications
	$(apt) update
	$(apt) upgrade
