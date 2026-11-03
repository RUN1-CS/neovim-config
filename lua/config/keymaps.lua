local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Quit Neovim" })

map("n", "<leader>e", "<cmd>Oil<CR>", { desc = "File explorer" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fp", "<cmd>Telescope git_files<CR>", { desc = "Git files" })

map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
map("n", "<leader>xt", "<cmd>TodoTelescope<CR>", { desc = "TODO comments" })

map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "Floating terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("t", "<Esc>", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
