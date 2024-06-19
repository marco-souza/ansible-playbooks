# Setup user profile
# ======================
  # a If you come from bash you might have to change your $PATH.
  export LOCAL_BIN=$HOME/.local/bin
  export PATH=$PATH:$LOCAL_BIN:/usr/local/bin
  export ARCHFLAGS="-arch x86_64"
  export SSH_KEY_PATH="~/.ssh/rsa_id"
  export WORKSPACE=$HOME/workspace # user Workspace

  ensure_path() {
    path=$1
    cmd=${2:-"make -p $path"}

    [ ! -e $path ] && eval $cmd

    echo $path:$path/bin
  }

  ensure_installed() {
    pkg=$1
    install_cmd=$2
    [ ! -x "$(command -v $pkg)" ] && eval $install_cmd
  }

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

  export PATH=$PATH:$(ensure_path $GOPATH)

  ensure_installed go '
    if [ -x "$(command -v yay)" ]; then
      yay -Syu go
    elif [ -x "$(command -v pamac)" ]; then
      pamac install go
    elif [ -x "$(command -v brew)" ]; then
      pamac install go
    fi
  '


# Rust Setup
# =================
  export RUST_HOME="$HOME/.cargo"
  export RUST_BIN="$RUST_HOME/bin"

  # install rust
  export PATH=$PATH:$(ensure_path $RUST_HOME)
  export PATH=$PATH:$(ensure_path $RUST_HOME/env 'source $RUST_HOME/env')

  ensure_installed cargo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"


# Deno Setup
# =================
  export DENO_HOME="$HOME/.deno"
  export PATH=$PATH:$(ensure_path $DENO_HOME)

  ensure_installed deno 'curl -fsSL https://deno.land/install.sh | sh'


# Node Setup
# =================
  ## volta
    export VOLTA_HOME="$HOME/.volta"
    export PATH=$PATH:$(ensure_path $VOLTA_HOME)

    ensure_installed volta 'curl https://get.volta.sh | bash'

  ## npm
    export NPM_HOME=$HOME/.npm-global
    export PATH=$PATH:$(ensure_path $NPM_HOME)

    ensure_installed node 'volta install node npm'

  ## yarn
    export YARN_HOME=$HOME/.config/yarn
    export PATH=$PATH:$(ensure_path $YARN_HOME)
    export PATH=$PATH:$YARN_HOME/global/node_modules/.bin

    ensure_installed yarn 'volta install yarn'

  ## pnpm
    export PNPM_HOME=$HOME/.local/share/pnpm
    export PATH=$PATH:$(ensure_path $PNPM_HOME)

    ensure_installed pnpm 'volta install pnpm'


# Nvim version manager
# =================
  # nvim version manager
    export BOB_HOME="$HOME/.local/share/bob/nvim-bin"
    export PATH=$PATH:$BOB_HOME

    ensure_installed bob 'cargo install bob-nvim && bob install 0.10.0 && bob use 0.10.0'

