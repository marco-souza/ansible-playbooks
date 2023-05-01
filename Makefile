laptop-setup: laptop-setup.yml
	ansible-playbook laptop-setup.yml -i localhost #--ask-become-pass
