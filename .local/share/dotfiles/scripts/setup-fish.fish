#!/usr/bin/env fish

if ! test -e ~/.config/fish/functions/fisher.fish
    curl --fail --silent --show-error --location https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    if test -e ~/.config/fish/fish_plugins
        fisher update
    else
        fisher install jorgebucaran/fisher
    end
end
