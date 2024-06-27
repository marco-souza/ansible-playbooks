# Setup user profile
# ======================
  # a If you come from bash you might have to change your $PATH.
  export LOCAL_BIN=$HOME/.local/bin
  export PATH=$PATH:$LOCAL_BIN:/usr/local/bin:/opt/homebrew/bin
  export ARCHFLAGS="-arch x86_64"
  export SSH_KEY_PATH="~/.ssh/rsa_id"
  export WORKSPACE=$HOME/workspace # user Workspace

  ensure_path() {
    dir_path=$1
    [ ! -e $dir_path ] && mkdir -p $dir_path
    export PATH=$PATH:$dir_path:$dir_path/bin
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

#
# Go Setup
# ===============
  # export GOROOT=/usr/lib/go
  export GOPATH=$HOME/.local/share/go/
  export PATH=$PATH:$GOPATH/bin:$GOPATH/bin/darwin_arm64/

  ensure_path $GOPATH

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

  ensure_path $RUST_HOME

  # install rust
  ensure_installed rustup 'source $RUST_HOME/env'
  ensure_installed rustup "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"


# Deno Setup
# =================
  export DENO_HOME="$HOME/.deno"

  ensure_path $DENO_HOME

  ensure_installed deno 'curl -fsSL https://deno.land/install.sh | sh'


# Node Setup
# =================
  ## volta
    export VOLTA_HOME="$HOME/.volta"

    ensure_path $VOLTA_HOME

    ensure_installed volta 'curl https://get.volta.sh | bash'

  ## npm
    export NPM_HOME=$HOME/.npm-global

    ensure_path $NPM_HOME

    ensure_installed node 'volta install node npm'

  ## yarn
    export YARN_HOME=$HOME/.config/yarn
    export PATH=$PATH:$YARN_HOME/global/node_modules/.bin

    ensure_path $YARN_HOME

    ensure_installed yarn 'volta install yarn'

  ## pnpm
    export PNPM_HOME=$HOME/.local/share/pnpm

    ensure_path $PNPM_HOME

    ensure_installed pnpm 'volta install pnpm'


# Nvim version manager
# =================
  # nvim version manager
    export BOB_HOME="$HOME/.local/share/bob/nvim-bin"
    export PATH=$PATH:$BOB_HOME

    ensure_installed bob 'cargo install bob-nvim && bob install 0.10.0 && bob use 0.10.0'


# Tools
# =====
  # direnv
    ensure_installed direnv 'curl -sfL https://direnv.net/install.sh | bash'

