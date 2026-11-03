return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    build = "make",
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "➜ ",
        path_display = { "smart" },
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
      },
      pickers = { find_files = { hidden = true } },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")
    end,
  },
}
