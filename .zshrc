HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors $LS_COLORS

(( $+commands[starship] )) && source <(starship init zsh)

if (( $+commands[sheldon] )); then
  source <(sheldon source)
else
  autoload -Uz compinit && compinit
  autoload -Uz bashcompinit && bashcompinit
fi

(( $+commands[fzf] )) && source <(fzf --zsh)
(( $+commands[zoxide] )) && source <(zoxide init zsh)

export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config

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

function _precmd() {
  print -n '\e[?25h'
}
add-zsh-hook precmd _precmd

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source $GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration
fi
