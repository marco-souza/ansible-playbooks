manjaro: manjaro-setup.yml
	sudo pacman-mirrors --fasttrack
	sudo pacman -S ansible
	ansible-playbook manjaro-setup.yml -i localhost --ask-become-pass

pop-os: pop-os-setup.yml
	sudo apt install ansible
	ansible-playbook pop-os-setup.yml -i localhost --ask-become-pass

