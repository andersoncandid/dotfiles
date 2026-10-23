return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        -- Load LÖVE types when the `love` word is found
        { path = '${3rd}/love2d/library', words = { 'love%.' } },
      },
    },
  },
}
