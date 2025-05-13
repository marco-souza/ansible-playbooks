# Dev Environment Setup with Ansible

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![License](https://img.shields.io/badge/license-MIT-blue)
![Dependencies](https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen)

This repository contains Ansible playbooks for setting up development environments on various operating systems, including macOS and Manjaro. It automates the installation of essential packages, configuration of dotfiles, and other setup tasks to get your system ready for development.

## Features

- **Cross-platform support**: Playbooks for macOS and Manjaro.
- **Automated setup**: Installs personal and development packages, configures dotfiles, and more.
- **Custom configurations**: Includes specific tweaks for each operating system, such as tiling window managers and interface customizations.

## Dependencies

Before running the playbooks, ensure you have the following installed:

- **Ansible**: Install it using your package manager or follow the [official installation guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
- **Make**: Required to use the provided `Makefile` for simplified commands.

For Manjaro users, you can install the dependencies using:

```sh
make deps-arch
```

## Usage

The `Makefile` provides convenient commands to run the playbooks. Use the following commands based on your operating system:

### macOS

```sh
make osx
```

This will:
- Install personal and development packages.
- Configure dotfiles.
- Install Amethyst as the tiling window manager.

### Manjaro

```sh
make manjaro
```

This will:
- Install personal and development packages.
- Configure dotfiles.

### Neovim

To set up Neovim with the required configurations:

```sh
make nvim
```

## Managing Sensitive Files

This repository uses Ansible Vault to encrypt and decrypt sensitive files, such as SSH keys and configuration files. Use the following commands to manage them:

### Decrypt Files

```sh
make decrypt
```

### Encrypt Files

```sh
make encrypt
```

## Linting

To ensure your Ansible playbooks follow best practices, run:

```sh
make lint
```

## Contributing

Feel free to submit issues or pull requests to improve the playbooks or add support for additional operating systems.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

