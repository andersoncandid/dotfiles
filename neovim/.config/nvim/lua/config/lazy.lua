local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- [[ Core plugins from Kickstart ]]
  -- https://github.com/nvim-lua/kickstart.nvim
  { import = 'plugins.core.which-key' },
  { import = 'plugins.core.telescope' },
  { import = 'plugins.core.lazydev' },
  { import = 'plugins.core.lspconfig' },
  { import = 'plugins.core.conform' },
  { import = 'plugins.core.blink' },
  { import = 'plugins.core.colorschemes' },
  { import = 'plugins.core.todo-comments' },
  { import = 'plugins.core.mini' },
  { import = 'plugins.core.treesitter' },

  -- [[ Kickstart plugins ]]
  -- { import = 'plugins.kickstart.debug' },
  -- { import = 'plugins.kickstart.indent_line' },
  -- { import = 'plugins.kickstart.lint' },
  { import = 'plugins.kickstart.autopairs' },
  { import = 'plugins.kickstart.neo-tree' },
  { import = 'plugins.kickstart.gitsigns' }, -- adds gitsigns recommend keymaps

  -- [[ Other Plugins ]]
  { import = 'plugins.ui.lualine' },
  { import = 'plugins.ui.tmux-navigation' },
  -- { import = 'plugins.ui.barbar' },
  { import = 'plugins.coding.autotag' },
  { import = 'plugins.coding.treesitter-context' },
  { import = 'plugins.coding.trouble' },
  { import = 'plugins.coding.emmet' },
  -- { import = 'plugins.coding.deadcolumn'},
  { import = 'plugins.be-good' },
  --
}, {
  ui = {
    -- Set icons if don`t have nerd font
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
