ansible_path := "$(shell command -v ansible)"

manjaro:
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		sudo pacman -S ansible; \
	fi
	# install ansible if needed
	ansible-galaxy install -r requirements.arch.yml
	ansible-playbook playbooks/manjaro.yml --ask-become-pass
	echo "Setup done! Please restart your Manjaro"

pop-os:
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		sudo apt install ansible; \
	fi
	ansible-playbook playbooks/pop-os.yml -i localhost --ask-become-pass

osx:
	# install ansible if needed
	if [ ! -x $(ansible_path) ]; then \
		brew install ansible; \
	fi
	ansible-playbook playbooks/osx.yml -i localhost --ask-become-pass

decrypt:
	ansible-vault decrypt dotfiles/ssh/id_rsa dotfiles/ssh/id_rsa.pub dotfiles/wakatime/.wakatime.cfg

encrypt:
	ansible-vault encrypt dotfiles/ssh/id_rsa dotfiles/ssh/id_rsa.pub dotfiles/wakatime/.wakatime.cfg
