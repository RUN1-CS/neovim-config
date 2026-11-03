local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.laststatus = 3
opt.showmode = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.splitkeep = "screen"

-- Keep indentation aligned with common project conventions.
vim.filetype.add({
  extension = {
    mdx = "markdown",
    tf = "terraform",
  },
})
