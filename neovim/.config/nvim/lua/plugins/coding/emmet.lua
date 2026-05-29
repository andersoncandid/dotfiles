return {
  'olrtg/nvim-emmet',
  config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>ea', require('nvim-emmet').wrap_with_abbreviation, { desc = 'Wrap with [A]bbreviation' })
  end,
}
