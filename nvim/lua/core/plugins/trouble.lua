return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.keymap.set('n', '<leader>xx', '<cmd>lua require("trouble").open()<cr>', { desc = 'Full diagnostics' })
      vim.keymap.set('n', '<leader>xw', '<cmd>lua  require("trouble").open("workspace_diagnostics")<cr>', { desc = 'Workspace diagnostics' })
      vim.keymap.set('n', '<leader>xd', '<cmd>lua  require("trouble").open("document_diagnostics")<cr>', { desc = 'Document diagnostics' })
      vim.keymap.set('n', '<leader>xq', '<cmd>lua  require("trouble").open("quickfix")<cr>', { desc = 'Quickfix diagnostics' })
      vim.keymap.set('n', '<leader>xl', '<cmd>lua  require("trouble").open("loclist")<cr>', { desc = 'Loclist diagnostics' })
      vim.keymap.set('n', 'gR', '<cmd>lua  require("trouble").open("lsp_references")<cr>', { desc = 'LSP references' })
    end,
  },
}
