.DEFAULT_GOAL := all

SHELL := /bin/bash

makefile := $(abspath $(lastword $(MAKEFILE_LIST)))
makefile_dir := $(dir $(makefile))

root := $(makefile_dir)

port ?= sudo port -N

.PHONY: all
all: ## output targets
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(makefile) | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'

.PHONY: setup
setup: install-bootstrap install-applications ## install ports

.PHONY: maintenance
maintenance: uninstall-inactive upgrade-outdated ## maintenance ports

.PHONY: install-applications
install-applications: cmdfile := $(root)/applications.txt
install-applications: ## [subtarget] install applications
	printf -- 'install %s' "$$(awk 'BEGIN { ORS=" " } /^install/ { print $$2 }' '$(cmdfile)')" | $(port) -F -

.PHONY: install-bootstrap
install-bootstrap: cmdfile := $(root)/bootstrap.txt
install-bootstrap: ## [subtarget] install bootstrap applications
	printf -- 'install %s' "$$(awk 'BEGIN { ORS=" " } /^install/ { print $$2 }' '$(cmdfile)')" | $(port) -F -

.PHONY: uninstall-inactive
uninstall-inactive: ## [subtarget] uninstall inactive ports
	$(port) uninstall inactive

.PHONY: upgrade-outdated
upgrade-outdated: ## [subtarget] upgrade outdated ports
	$(port) upgrade outdated
