# Setup user profile
# ======================
  # a If you come from bash you might have to change your $PATH.
  export LOCAL_BIN=$HOME/.local/bin
  export PATH=$PATH:$LOCAL_BIN:/usr/local/bin
  export ARCHFLAGS="-arch x86_64"
  export SSH_KEY_PATH="~/.ssh/rsa_id"
  export WORKSPACE=$HOME/workspace # user Workspace

  [[ -x firefox ]] && export BROWSER=$(which firefox)
  [[ -x google-chrome-stable ]] && export BROWSER=$(which google-chrome-stable)
  [[ -x brave ]] && export BROWSER=$(which brave)
  [[ -x zsh ]] && export SHELL=$(which zsh)

  export EDITOR="/usr/bin/vim"
  [[ -x nvim ]] && export EDITOR=$(which nvim)


# System Setup
# ===================
  ## Setup env language: https://wiki.archlinux.org/index.php/Locale
  # export LANG=en_US.UTF-8
  # export LC_ALL=en_US.UTF-8
  # export LANGUAGE=en_US.UTF-8
  # export LC_ALL=en_US.UTF-8
  # export LC_ADDRESS=en_US.UTF-8
  # export LC_NAME=en_US.UTF-8
  # export LC_MONETARY=en_US.UTF-8
  # export LC_PAPER=en_US.UTF-8
  # export LC_IDENTIFICATION=en_US.UTF-8
  # export LC_TELEPHONE=en_US.UTF-8
  # export LC_MEASUREMENT=en_US.UTF-8
  # export LC_TIME=en_US.UTF-8
  # export LC_NUMERIC=en_US.UTF-8
  # export LANG=en_US.UTF-8

source ~/.devrc
