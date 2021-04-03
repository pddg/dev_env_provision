PLAYBOOK_DIR := playbooks
PLAYBOOK_CMD := ansible-playbook

setup:
	$(PLAYBOOK_CMD) -K $(PLAYBOOK_DIR)/setup.yml $(args)

.PHONY: setup ;
