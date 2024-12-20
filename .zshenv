typeset -U PATH path
path+=(
  ~/.local/bin
  ~/.proto/shims
  ~/.proto/tools/node/globals/bin
)

export EDITOR="nvim"
export VISUAL="nvim"

export LESS="-RF"

export NODE_OPTIONS="--max-old-space-size=8192"
