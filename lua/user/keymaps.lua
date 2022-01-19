local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap comma as leader key
keymap("", ",", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Create splits easily
keymap("n", "vv", "<C-w>v", opts)
keymap("n", "ss", "<C-w>s", opts)

keymap("n", "<leader>d", ":CHADopen<cr>", opts)

-- clear current highlight
keymap("n", "//", ":nohlsearch<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<D-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<D-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Run tests
keymap("n", "<leader>t", ":UltestNearest", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<D-j>", ":m .+1<CR>==", opts)
keymap("v", "<D-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<D-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<D-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-t><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-t><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-t><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-t><C-N><C-w>l", term_opts)
