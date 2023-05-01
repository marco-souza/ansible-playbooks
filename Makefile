install: deps laptop-setup

deps:
	sudo pacman -Syu ansible

laptop-setup: laptop-setup.yml
	ansible-playbook laptop-setup.yml -i localhost --ask-become-pass
