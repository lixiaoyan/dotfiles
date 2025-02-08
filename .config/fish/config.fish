if test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

fish_add_path --global ~/.proto/bin
fish_add_path --global ~/.proto/shims
fish_add_path --global ~/.proto/tools/node/globals/bin

try_source ~/.cargo/env.fish
try_source ~/.orbstack/shell/init.fish

fish_add_path --global ~/.local/bin

if command --query nvim
    set --global --export EDITOR nvim
    set --global --export VISUAL nvim
else if command --query vim
    set --global --export EDITOR vim
    set --global --export VISUAL vim
end

set --global --export NODE_OPTIONS --max-old-space-size=8192

if status is-interactive
    set --global fish_greeting
    fish_config theme choose "Catppuccin Latte"

    function fish_hybrid_key_bindings
        for mode in default insert visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end
    set --global fish_key_bindings fish_hybrid_key_bindings

    starship init fish | source
    enable_transience

    command --query fzf && fzf --fish | source
    command --query zoxide && zoxide init fish | source

    set --global --export FZF_DEFAULT_OPTS_FILE ~/.config/fzf/config

    command --query nvim && alias vim nvim
    command --query eza && alias tree 'eza --tree'
    command --query unar && alias unar 'unar -forks skip'

    function x-upgrade
        set --function fish_trace 1
        brew upgrade
        nvim --headless '+Lazy! sync' '+quitall'
        rustup update
        cargo install-update --all
    end
end
