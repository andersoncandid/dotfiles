-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- [[ Diagnostic keymaps ]]

-- Uncomment if don`t` use Trouble plugin
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable or enable diagnostic for current buffer
vim.keymap.set('n', '<leader>td', function()
  local bf = vim.api.nvim_get_current_buf()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled({ bufnr = bf }), { bufnr = bf })
end, { desc = '[T]oggle [D]iagnostics' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Enter terminal mode: split below
vim.keymap.set('n', '<leader>tt', function()
  -- calculates the split height (30% of total rows, rounded down)
  local h = math.floor(vim.o.lines * 0.2)
  vim.cmd('split')
  -- resizes to desired height
  vim.cmd('resize ' .. h)
  vim.cmd('terminal')
end, { silent = true, desc = 'Enter terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--[[ Esc Alternative]]
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

--[[ Buffer Keymaps ]]

-- Move to previous/next
vim.api.nvim_set_keymap('n', '<A-,>', '<Cmd>bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-.>', '<Cmd>bnext<CR>', { noremap = true, silent = true })

-- Close buffer
vim.api.nvim_set_keymap('n', '<A-c>', '<Cmd>bdelete<CR>', { noremap = true, silent = true })
