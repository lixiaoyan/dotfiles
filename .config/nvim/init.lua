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
        require("mini.surround").setup()
      end,
    },
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      opts = {},
    },
    {
      "NMAC427/guess-indent.nvim",
      lazy = false,
      opts = {},
    },
    {
      "stevearc/conform.nvim",
      event = "VeryLazy",
      opts = {
        format_on_save = true,
        formatters_by_ft = {
          sh = { "shfmt" },
          lua = { "stylua" },
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
