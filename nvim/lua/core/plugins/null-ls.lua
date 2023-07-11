-- Plugin to handle formatting
local M = {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require 'core.plugins.lsp.null-ls'
  end,
}

return M
