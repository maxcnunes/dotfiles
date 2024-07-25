-- DAP (Debug Adapter Protocol)
local M = {
  {
    'nvim-telescope/telescope-dap.nvim',
    config = function()
      require('telescope').load_extension 'dap'
    end,
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      { 'rcarriga/nvim-dap-ui', dependencies = 'nvim-neotest/nvim-nio' },
      'theHamsta/nvim-dap-virtual-text',
      'Weissle/persistent-breakpoints.nvim',
    },
    event = 'VeryLazy',
    ft = { 'c', 'go' }, -- Only load it for these file types
    config = function(self)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = self.ft,
        callback = function()
          require('persistent-breakpoints').setup {
            load_breakpoints_event = { 'BufReadPost' },
          }

          require('core.plugins.dap.dap').setup()
        end,
      })
    end,
  },
}

return M
