HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

(( $+commands[sheldon] )) && source <(sheldon source)
(( $+commands[starship] )) && source <(starship init zsh)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Key bindings

bindkey -v

# Aliases

alias ls='ls --color=auto'
(( $+commands[nvim] )) && alias vim='nvim'
(( $+commands[eza] )) && alias tree='eza --tree'
(( $+commands[unar] )) && alias unar='unar -forks skip'

function x-upgrade() {
  set -x
  brew upgrade
  sheldon lock --update
  nvim --headless '+Lazy! sync' '+quitall'
  rustup update
  cargo install-update --all
}

# Shell integration

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source $GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration
fi
