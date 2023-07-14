-- Highlight and search for todo comments like TODO, HACK, BUG in the code base
local M = {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    -- Using default configurations
  },
}

return M
