#!/bin/bash
set -eo pipefail

if [[ ! -e ~/.local/share/nvim/lazy/lazy.nvim ]]; then
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
  nvim --headless '+Lazy! sync' '+quitall'
fi
