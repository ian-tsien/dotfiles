-- Only pure Neovim built-in mappings.
-- No plugin mappings here.

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit
map("i", "jk", "<Esc>", opts)

-- Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Save / Quit
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":confirm q<CR>", opts)

-- Clear search
map("n", "<leader>nh", ":nohlsearch<CR>", opts)

-- Keep cursor centered when jumping
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Move lines up/down like VSCode
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Split
map("n", "<leader>sv", "<C-w>v", opts) -- split vertical
map("n", "<leader>sh", "<C-w>s", opts) -- split horizontal
map("n", "<leader>se", "<C-w>=", opts) -- equalize
map("n", "<leader>sx", "<cmd>close<CR>", opts)
