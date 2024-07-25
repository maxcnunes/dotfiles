-- Algin plugin
-- Usage: to align all columns in csv use "<leader>gas,"
local M = {
  'echasnovski/mini.align',
  event = { 'BufReadPre', 'BufNewFile' },
  -- is not loaded without explicitly saying it
  config = function()
    require('mini.align').setup {}
  end,
}

return M
