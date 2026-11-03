return {
  { "lewis6991/gitsigns.nvim", event = { "BufReadPre", "BufNewFile" }, opts = {} },
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
