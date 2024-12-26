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

export EDITOR='nvim'
export VISUAL='nvim'

export NODE_OPTIONS='--max-old-space-size=8192'
