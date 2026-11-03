return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- stable legacy branch for Neovim 0.11.x
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash", "c", "cpp", "css", "diff", "dockerfile", "go", "html",
          "javascript", "json", "lua", "markdown", "markdown_inline", "nix",
          "php", "query", "rust", "sql", "toml", "tsx", "typescript",
          "vim", "vimdoc", "vue", "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
