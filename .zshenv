typeset -U PATH path

if [[ -x /opt/homebrew/bin/brew ]]; then
  source <(/opt/homebrew/bin/brew shellenv)
fi

if [[ -f ~/.cargo/env ]]; then
  source ~/.cargo/env
fi

path=(
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
  $path
)

if [[ -f ~/.orbstack/shell/init.zsh ]]; then
  source ~/.orbstack/shell/init.zsh
fi

path=(~/.local/bin $path)

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif (( $+commands[vim] )); then
  export EDITOR='vim'
  export VISUAL='vim'
fi

export NODE_OPTIONS='--max-old-space-size=8192'
