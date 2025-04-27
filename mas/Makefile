.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

root := $(makefile_dir)

mas ?= mas

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: applications := $(root)/applications.txt
setup: ## install applications
	awk '{ !/^#/ { print $1 } }' '$(applications)' | xargs $(mas) install

.PHONY: maintenance
maintenance: applications := $(root)/applications.txt
maintenance: ## maintenance applications
	$(mas) list
	awk '{ !/^#/ { print $1 } }' '$(applications)' | xargs $(mas) upgrade
