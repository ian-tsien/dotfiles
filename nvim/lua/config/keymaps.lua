-- Only pure Neovim built-in mappings.
-- No plugin mappings here.

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Save / Quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Clear search
map("n", "<leader>nh", ":nohlsearch<CR>", opts)
