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

  export SHELL=$(which zsh)

  export EDITOR="/usr/bin/vim"
  [[ -x nvim ]] && export EDITOR=$(which nvim)



# System Setup
# ===================
  ## Settup env language: https://wiki.archlinux.org/index.php/Locale
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


# Go Setup
# ===============
  export GOPATH=$WORKSPACE/go
  export GO_BIN=$HOME/.local/share
  export GO_GLOBAL=$GO_BIN/go/bin
  export PATH=$PATH:$GOPATH/bin:$GO_GLOBAL
  export GO_DOWNLOAD_URL="https://go.dev/dl/go1.19.4.linux-amd64.tar.gz"
  [ ! -e $GOPATH ] && mkdir -p $GOPATH
  [ ! -x "$(command -v go)" ] && \
    wget -c $GO_DOWNLOAD_URL -O - | tar -xz -C $GO_BIN


# Rust Setup
# =================
  export RUST_HOME="$HOME/.cargo"
  export RUST_BIN="$RUST_HOME/bin"
  export PATH=$PATH:$RUST_BIN
  # install rust
  [ ! -e $RUST_HOME ] && mkdir -p $RUST_HOME
  [ ! -x "$(command -v cargo)" ] || [ ! -x "$(command -v rustc)" ] && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  # install rust-analyzer
  [ ! -f $RUST_BIN/rust-analyzer ] && 
    rustup component add rust-analyzer && \
    ln -s $(rustup which --toolchain stable rust-analyzer) $RUST_BIN
  [ ! -e $RUST_HOME/env ] && source "$RUST_HOME/env"


# Deno Setup
# =================
  export DENO_HOME="$HOME/.deno"
  export PATH=$PATH:$DENO_HOME/bin
  [ ! -e $DENO_HOME ] && mkdir -p $DENO_HOME
  [ ! -x "$(command -v deno)" ] && cargo install deno


# Node Setup
# =================
  ## npm
  export NPM_HOME=$HOME/.npm-global
  export PATH=$PATH:$NPM_HOME/bin
  npm config set prefix $NPM_HOME
  [ ! -e $NPM_HOME ] && mkdir -p $NPM_HOME

  ## yarn
  export YARN_HOME=$HOME/.config/yarn
  export PATH=$PATH:$YARN_HOME/global/node_modules/.bin
  if [ ! -e $YARN_HOME ]; then
    npm i -g yarn
    mkdir -p $YARN_HOME
  fi

  ## pnpm
  export PNPM_HOME=$HOME/.local/share/pnpm
  export PATH=$PATH:$PNPM_HOME
  if [ ! -e $PNPM_HOME ]; then
    npm i -g pnpm pnpx
    mkdir -p $PNPM_HOME
  fi

# Python Setup
# ===================
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if [ -x "$(command -v pyenv)" ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    eval "$(pyenv init --path)"
 
    # pyenv virtualenv
    VIRTUALENV_PLUGIN=$(pyenv root)/plugins/pyenv-virtualenv
    [ ! -e $VIRTUALENV_PLUGIN ] && \
      git clone https://github.com/pyenv/pyenv-virtualenv.git \
      $VIRTUALENV_PLUGIN
    eval "$(pyenv virtualenv-init -)"
  fi

