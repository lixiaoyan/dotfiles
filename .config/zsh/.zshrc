HISTFILE=~/.local/state/zsh/.zsh_history
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

(( $+commands[nvim] )) && alias vim='nvim'
(( $+commands[jless] )) && alias jless='jless --mode=line'
(( $+commands[eza] )) && alias tree='eza --tree'
(( $+commands[unar] )) && alias unar='unar -forks skip'
