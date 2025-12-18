vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 3
vim.opt.softtabstop = 2
vim.g.mapleader = " "

vim.o.list = true
vim.o.listchars = 'space:·,tab:→ ,trail:~'

vim.opt.number = true
-- vim.opt.relativenumber = true

vim.g.default_settings = { noremap = true, silent = true }

-- Move lines up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", vim.g.default_settings)
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", vim.g.default_settings)
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", vim.g.default_settings)
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", vim.g.default_settings)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", vim.g.default_settings)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", vim.g.default_settings)

vim.keymap.set('n', '<leader>a', 'ggVG', { desc = 'Select all' })

-- Remap Ctrl+Z to undo
vim.keymap.set('n', '<C-z>', 'u', vim.g.defautl_settings)

-- Remap Ctrl+Y to redo
vim.keymap.set('n', '<C-y>', '<C-r>', vim.g.default_settings)

