ansible_path := "$(shell command -v ansible)"

manjaro: manjaro-setup.yml
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		sudo pacman -S ansible; \
	fi
	# install ansible if needed
	ansible-galaxy collection install kewlfft.aur
	ansible-playbook manjaro-setup.yml -i localhost --ask-become-pass --ask-vault-pass
	echo "Setup done! Please restart your Manjaro"

pop-os: pop-os-setup.yml
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		sudo apt install ansible; \
	fi
	ansible-playbook pop-os-setup.yml -i localhost --ask-become-pass --ask-vault-pass

osx: osx-setup.yml
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		brew install ansible; \
	fi
	ansible-playbook osx-setup.yml -i localhost --ask-become-pass --ask-vault-pass

