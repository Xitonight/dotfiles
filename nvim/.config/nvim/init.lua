vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.o.number = true -- Enable absolute line numbers
vim.o.relativenumber = false -- Enable relative line numbers

require("config.lazy")
