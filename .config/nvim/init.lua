vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({
  defaults = {
    version = "*",
  },

  spec = {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "latte",
          transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      event = "VeryLazy",
      opts = {
        options = {
          icons_enabled = false,
        },
      },
    },
    {
      "echasnovski/mini.nvim",
      event = "VeryLazy",
      config = function()
        require("mini.pairs").setup()
      end,
    },
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      opts = {},
    },
    {
      "Darazaki/indent-o-matic",
      opts = {},
    },
    {
      "stevearc/conform.nvim",
      event = "VeryLazy",
      opts = {
        format_on_save = true,
        formatters_by_ft = {
          css = { "prettierd" },
          fish = { "fish_indent" },
          javascript = { "prettierd" },
          javascriptreact = { "prettierd" },
          lua = { "stylua" },
          markdown = { "prettierd" },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          toml = { "taplo" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          yaml = { "prettierd" },
          zig = { "zigfmt" },
        },
      },
    },
  },
})

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.ignorecase = true
vim.opt.smartcase = true
