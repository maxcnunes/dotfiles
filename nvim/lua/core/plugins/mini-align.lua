local M = {
  'echasnovski/mini.align',
  event = { 'BufReadPre', 'BufNewFile' },
  -- is not loaded without explicitly saying it
  config = true,
}

return M
