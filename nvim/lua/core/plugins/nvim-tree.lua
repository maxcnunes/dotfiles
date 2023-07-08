local M = {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- To install the font with the icons used by tree view:
    -- brew tap homebrew/cask-fonts
    -- brew install --cask font-fira-mono-nerd-font
  },
  config = function()
   require('nvim-tree').setup {
     sort_by = 'case_sensitive',
     view = {
       width = 30,
     },
     renderer = {
       group_empty = true,
     },
     filters = {
       dotfiles = true,
     },
     -- on_attach = function(bufnr)
     --   local api = require 'nvim-tree.api'
   
     --   local function opts(desc)
     --     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
     --   end
   
     --   -- default mappings
     --   api.config.mappings.default_on_attach(bufnr)
   
     --   -- custom mappings
     --   vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts 'Up')
     --   vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
     -- end,
   }
  end,
}

return M

