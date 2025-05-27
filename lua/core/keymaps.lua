vim.g.mapleader = " "

local setKeymap = vim.keymap.set
local opts = { noremap = true, silent = true }

setKeymap("n", "<leader>pv", vim.cmd.Ex)

setKeymap("n", "d", '"_d', opts)
setKeymap("v", "d", '"_d', opts)
--setKeymap('n', 'x', '"_x', opts)
--setKeymap('v', 'x', '"_x', opts)

setKeymap("v", "<leader>y", '"+y', opts)
setKeymap("n", "<leader>y", '"+y', opts)
setKeymap("v", "<leader>x", '"+x', opts)
setKeymap("v", "<leader>d", '"+d', opts)
setKeymap("v", "<leader>p", '"+p', opts)
setKeymap("n", "<leader>p", '"+p', opts)

setKeymap("n", "<leader><Tab>", ":tabnext<CR>")
setKeymap("n", "<leader><S-Tab>", ":tabprev<CR>")
setKeymap("n", "<leader>tn", ":tabnew<CR>")
setKeymap("n", "<leader>tc", ":tabclose<CR>")

setKeymap("n", "<leader><leader>", ":nohlsearch<CR>")
