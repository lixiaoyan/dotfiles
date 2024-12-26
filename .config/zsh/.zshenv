typeset -U PATH path
path+=(~/.local/bin)

if [[ -x /opt/homebrew/bin/brew ]]; then
  source <(/opt/homebrew/bin/brew shellenv)
fi

function try_source() {
  if [[ -f $1 ]]; then
    source $1
  fi
}

try_source ~/.cargo/env
try_source ~/.orbstack/shell/init.zsh

# https://moonrepo.dev/proto
path+=(
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
)

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
  export VISUAL='vim'
fi

export NODE_OPTIONS='--max-old-space-size=8192'
