# History

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# Completion

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true

# Plugins

source <(sheldon source)

autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

source <(starship init zsh)

# Key bindings

bindkey -v

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Aliases

alias tree='eza --tree'
alias unar='unar -forks skip'
alias vim='nvim'
alias jless='jless --mode=line'
