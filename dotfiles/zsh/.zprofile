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

# Go Setup
# ===============
  # export GOROOT=/usr/lib/go
  export GOPATH=$HOME/.local/share/go/
  export PATH=$PATH:$GOPATH/bin:$GOPATH/bin/darwin_arm64/
  [ ! -e $GOPATH ] && mkdir -p $GOPATH


# Rust Setup
# =================
  export RUST_HOME="$HOME/.cargo"
  export RUST_BIN="$RUST_HOME/bin"
  export PATH=$PATH:$RUST_BIN

  # install rust
  [ ! -e $RUST_HOME ] && mkdir -p $RUST_HOME
  [ ! -e $RUST_BIN ] && mkdir -p $RUST_BIN
  [ -e $RUST_HOME/env ] && source $RUST_HOME/env


# Deno Setup
# =================
  export DENO_HOME="$HOME/.deno"
  export PATH=$PATH:$DENO_HOME/bin
  [ ! -e $DENO_HOME ] && mkdir -p $DENO_HOME


# Node Setup
# =================
  ## volta
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
  # install
  [ ! -e $VOLTA_HOME ] && mkdir -p $VOLTA_HOME

  ## npm
  export NPM_HOME=$HOME/.npm-global
  export PATH=$PATH:$NPM_HOME/bin
  # install
  [ ! -e $NPM_HOME ] && mkdir -p $NPM_HOME

  ## n
  export N_PREFIX=$HOME/.local/share
  export N_HOME=$N_PREFIX/n
  export PATH=$PATH:$N_PREFIX/bin
  [ ! -e $N_HOME ] && mkdir -p $N_HOME

  ## yarn
  export YARN_HOME=$HOME/.config/yarn
  export PATH=$PATH:$YARN_HOME/global/node_modules/.bin
  if [ ! -e $YARN_HOME ]; then
    mkdir -p $YARN_HOME
  fi

  ## pnpm
  export PNPM_HOME=$HOME/.local/share/pnpm
  export PATH=$PATH:$PNPM_HOME
  if [ ! -e $PNPM_HOME ]; then
    mkdir -p $PNPM_HOME
  fi


# Source
# =================
  # homebrew
    export BREW_HOME="/opt/homebrew"
    if [[ $(uname -s) = "Linux" ]]; then
      export BREW_HOME="/home/linuxbrew/.linuxbrew"
    fi

    export BREW_BIN="$BREW_HOME/bin/"
    export PATH=$PATH:$BREW_BIN
    [ ! -x "$(command -v brew)" ] && \
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(brew shellenv)"


  # pkgx.sh
    [ ! -x "$(command -v pkgx)" ] && curl -fsS https://pkgx.sh | sh
    source <(pkgx --shellcode)  # docs.pkgx.sh/shellcode
    # add packages
    env +deno +rust +neofetch +volta
    volta install node npm pnpm yarn

  # nvim version manager
    export BOB_HOME="$HOME/.local/share/bob/nvim-bin"
    export PATH=$PATH:$BOB_HOME
    [ ! -x "$(command -v bob)" ] && \
      cargo install bob-nvim && \
      bob install 0.10.0 && \
      bob use 0.10.0


neofetch
