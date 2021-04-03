SHELL := /bin/bash

PLAYBOOK_DIR := playbooks
PLAYBOOK_CMD := ansible-playbook

xcode:
	xcode-select --install

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

.PHONY: xcode brew ansible macos ubuntu init tools ;
