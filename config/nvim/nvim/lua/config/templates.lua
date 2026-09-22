--Date
vim.keymap.set('n', '<leader>d', ':%s/\\({{date}}\\|Date Last Modified: \\zs.*\\)/\\=strftime("%m\\/%d\\/%Y")<CR>')

--CPP Templates
vim.keymap.set('n', 'tcppm', ':0r ~/dotfiles/nvim/nvim/templates/main.cpp<CR>', { silent = true })
vim.keymap.set('n', 'tcpph', ':0r ~/dotfiles/nvim/nvim/templates/header.cpp<CR>', { silent = true })
vim.keymap.set('n', 'tcppf', ':.-1r ~/dotfiles/nvim/nvim/templates/function.cpp<CR>', { silent = true })
