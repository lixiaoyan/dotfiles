if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

fish_add_path ~/.proto/shims ~/.proto/tools/node/globals/bin

try_source ~/.cargo/env.fish
try_source ~/.orbstack/shell/init.fish

fish_add_path ~/.local/bin

if command -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
else if command -q vim
    set -gx EDITOR vim
    set -gx VISUAL vim
end

set -gx NODE_OPTIONS --max-old-space-size=8192

if status is-interactive
    fish_config theme choose "Catppuccin Latte"

    starship init fish | source

    command -q fzf && fzf --fish | source
    command -q zoxide && zoxide init fish | source

    set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

    command -q nvim && alias vim nvim
    command -q eza && alias tree 'eza --tree'
    command -q unar && alias unar 'unar -forks skip'
end
