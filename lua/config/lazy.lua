local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local output = vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error("Failed to clone lazy.nvim:\n" .. output)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  checker = { enabled = false }, -- Update deliberately with :Lazy update.
  change_detection = { notify = false },
  install = { colorscheme = { "tokyonight", "habamax" } },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
