-- RipGrep (text search tool)
local M = {
  'jremmen/vim-ripgrep',
  event = 'VeryLazy',
  init = function()
    -- allow hidden files to be searched and smart case
    vim.g.rg_command = 'rg --vimgrep --hidden --smart-case'
    vim.g.rg_highlight = 1
  end,
  config = function()
    --  alias for above
    --  Grep project for selection with Rg
    vim.keymap.set('v', '<leader>rg', 'y :Rg "<CR>', { desc = '[R]ip[G]rep selection' })
    --  Grep project for word under the cursor with Rg
    vim.keymap.set('n', '<Leader>rg', ':Rg <C-r><C-w><CR>', { desc = '[R]ip[G]rep word under cursor' })

    --  Grep selection with Rg (excluding tests and migrations)
    vim.keymap.set('v', '<leader>rt', "y :Rg \" -g '!*/**/test/*' -g '!*/**/migrations/*'<CR>", { desc = 'Rip[G]rep excluding test files' })
    vim.keymap.set('n', '<Leader>rt', ":Rg <C-r><C-w> -g '!*/**/test/*' -g '!*/**/migrations/*'<CR>", { desc = 'Rip[G]rep excluding test files' })
  end,
}

return M
