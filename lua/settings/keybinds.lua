vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected block down a line' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move selected block down a line' })
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { desc = 'Open :Ex file explorer' })
vim.keymap.set('n', '<leader>h', '^', { desc = 'Move to beginning of line' })
vim.keymap.set('n', '<leader>l', '$', { desc = 'Move to end of line' })
vim.keymap.set('n', '<leader>j', '10j', { desc = 'Move down 10 lines' })
vim.keymap.set('n', '<leader>k', '10k', { desc = 'Move up 10 lines' })

