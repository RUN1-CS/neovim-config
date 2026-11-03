return {
  { "folke/tokyonight.nvim", priority = 1000, opts = { style = "night", transparent = false } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
  { "folke/which-key.nvim", event = "VeryLazy", opts = {} },
  { "numToStr/Comment.nvim", keys = { "gc", "gb" }, opts = {} },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "folke/flash.nvim", event = "VeryLazy", opts = {} },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
  { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
}
