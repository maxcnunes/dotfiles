-- File browser tree view
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
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle Explorer' },
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
      on_attach = function(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Helper function to copy file.
        -- The default copy action for the nvim-tree just copy the file content,
        -- and this custom action copy it to path directly.
        local function copy_file_to(node)
          node = node or require('nvim-tree.lib').get_node_at_cursor()
          local file_src = node.absolute_path
          -- The args of input are {prompt}, {default}, {completion}
          -- Read in the new file path using the existing file's path as the baseline.
          local file_out = vim.fn.input('Copy to: ', file_src, 'file')
          -- Create any parent dirs as required
          local dir = vim.fn.fnamemodify(file_out, ':h')
          vim.fn.system { 'mkdir', '-p', dir }
          -- Copy the file
          vim.fn.system { 'cp', file_src, file_out }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts 'Up')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', 'c', copy_file_to, opts 'Copy file')
      end,
    }
  end,
}

return M
