local M = {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()

    -- Fix comments for assembly language
    local ft = require 'Comment.ft'
    ft.asm = '//%s'
  end,
}

return M
