---------------------
------ KEYMAPS ------
---------------------

---- CLEARSEARCH ----
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

------ BUFFERS ------
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>w', ':bdelete!<CR>', opts) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts) -- new buffer

----- TERMINAL ------
vim.keymap.set('n', '<leader>t', function()
vim.cmd('belowright split')
vim.cmd('resize 15')
vim.cmd('terminal')
vim.cmd('startinsert')
end, { silent = true })
-- Exit terminal mode with Esc
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { silent = true })

---- MULTIPLEXER ----
vim.keymap.set('n', '<A-S-v>', ':vsplit<CR>', {silent = true, desc = 'Split window vertical'})
vim.keymap.set('n', '<A-S-s>', ':split<CR>', {silent = true,desc = 'Split window horizontal'})
--move around panes using alt +hjkl
vim.keymap.set('n', '<A-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').move_cursor_right)
-- Resize splits using alt + Arrow keys
vim.keymap.set('n', '<A-S-Up>', ':resize +2<CR>', {silent = true, desc = 'Increase window height' })
vim.keymap.set('n', '<A-S-Down>', ':resize -2<CR>', {silent = true, desc = 'Decrease window height' })
vim.keymap.set('n', '<A-S-Left>', ':vertical resize +2<CR>', {silent = true, desc = 'Decrease window width' })
vim.keymap.set('n', '<A-S-Right>', ':vertical resize -2<CR>', {silent = true, desc = 'Increase window width' })
-- Close the current split pane
vim.keymap.set('n', '<A-S-q>', ':close<CR>', { desc = 'Close current split' })
--zoom in and out
vim.keymap.set('n', '<A-S-p>', '<cmd>ZoomToggle<cr>')

----- TELESCOPE -----
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
--no work need to install dependencies
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

------ NEOTREE ------
vim.keymap.set('n', '<C-t>', ':Neotree filesystem toggle left<CR>', { silent = true })

------ AERIAL -------
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<C-e>", "<cmd>AerialToggle right<CR>")


