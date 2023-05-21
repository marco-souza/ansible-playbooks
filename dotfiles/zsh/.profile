
export WORKSPACE=$HOME/workspace # user Workspace

export BROWSER="/usr/bin/google-chrome"
[[ -x google-chrome-stable ]] && export BROWSER=$(which google-chrome-stable)
[[ -x brave ]] && export BROWSER=$(which brave)

export SHELL=/bin/bash
[[ -x /bin/zsh ]] && export SHELL=/bin/zsh

export EDITOR="/usr/bin/vim"
[[ -x nvim ]] && export EDITOR=$(which nvim)

. "$HOME/.cargo/env"
