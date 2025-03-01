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

set --local less_version (less --version | string match --regex --groups-only 'less (\d+)')
if test "$less_version" -ge 608
    set --global --export BAT_PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
    set --global --export DELTA_PAGER 'less --RAW-CONTROL-CHARS --quit-if-one-screen --redraw-on-quit'
end

set --global --export NODE_OPTIONS --max-old-space-size=8192

set --global --export GOPATH ~/.local/share/go

if status is-interactive
    set --global fish_greeting
    if contains 'Catppuccin Latte' (fish_config theme list | string split '\n')
        fish_config theme choose 'Catppuccin Latte'
    end

    function fish_hybrid_key_bindings
        for mode in default insert visual
            fish_default_key_bindings --mode $mode
        end
        fish_vi_key_bindings --no-erase
    end
    set --global fish_key_bindings fish_hybrid_key_bindings

    if command --query starship
        starship init fish | source
        enable_transience
    end

    command --query fzf && fzf --fish | source
    command --query zoxide && zoxide init fish | source

    set --global --export FZF_DEFAULT_OPTS '--prompt=\'❯ \' --style=full --no-color'

    command --query nvim && alias vim nvim
    command --query eza && alias tree 'eza --tree'
    command --query unar && alias unar 'unar -forks skip'

    function x-upgrade
        brew upgrade
        fisher update
        nvim --headless '+Lazy! sync' '+quitall'
        rustup update
        cargo install-update --all
    end
end
