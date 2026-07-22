---------------------
----- TAB-WIDTH -----
---------------------
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

---------------------
----- CLIPBOARD -----
---------------------
vim.opt.clipboard = "unnamedplus"

---------------------
---- LINENUMBERS ----
---------------------
vim.o.number = true
vim.o.relativenumber = true

---------------------
------- THEME -------
---------------------
vim.cmd("colorscheme onedark_dark")

---------------------
---- MULTIPLEXER ----
---------------------
vim.opt.splitright = true
vim.opt.splitbelow = true

---------------------
----- SCROLLOFF -----
---------------------
vim.opt.scrolloff = 10

---------------------
-- PERSISTENT UNDO --
---------------------
vim.opt.undofile=true
