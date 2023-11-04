ansible_path := "$(shell command -v ansible)"

deps:
	ansible-galaxy install -r requirements.yml

hypr: deps
	ansible-playbook playbooks/hyprland.yml --ask-become-pass
	echo "Setup done! Please restart your Manjaro"

manjaro: deps
	ansible-playbook playbooks/manjaro.yml --ask-become-pass
	echo "Setup done! Please restart your Manjaro"

pop-os: deps
	ansible-playbook playbooks/pop-os.yml -i localhost --ask-become-pass
	echo "Setup done! Please restart your Pop-OS!"

osx: deps
	ansible-playbook playbooks/osx.yml -i localhost --ask-become-pass
	echo "Setup done! Please restart your Mac OS"

decrypt:
	ansible-vault decrypt dotfiles/ssh/id_rsa dotfiles/ssh/id_rsa.pub dotfiles/wakatime/.wakatime.cfg

encrypt:
	ansible-vault encrypt dotfiles/ssh/id_rsa dotfiles/ssh/id_rsa.pub dotfiles/wakatime/.wakatime.cfg

lint:
	ansible-lint --write
