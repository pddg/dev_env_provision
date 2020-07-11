SHELL := /bin/bash

PLAYBOOK_DIR := playbooks
PLAYBOOK_CMD := pipenv run ansible-playbook

xcode:
	xcode-select --install

zlib_mojave:
	sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

brew:
	bash scripts/install_brew.sh

ansible:
	bash scripts/install_ansible.sh

macos: xcode brew ansible
ubuntu: ansible

init:
	$(PLAYBOOK_CMD) -K $(PLAYBOOK_DIR)/init.yml $(args)

tools:
	$(PLAYBOOK_CMD) -K $(PLAYBOOK_DIR)/tools.yml $(args)

.PHONY: xcode zlib_mojave brew ansible macos ubuntu init tools ;
