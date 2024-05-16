-- DAP (Debug Adapter Protocol)
local M = {
  {
    'Weissle/persistent-breakpoints.nvim',
    event = 'VeryLazy',
    config = function()
      require('persistent-breakpoints').setup {
        load_breakpoints_event = { 'BufReadPost' },
      }
    end,
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    config = function()
      require('telescope').load_extension 'dap'
    end,
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'Weissle/persistent-breakpoints.nvim',
      'leoluz/nvim-dap-go',
      { 'rcarriga/nvim-dap-ui', dependencies = 'nvim-neotest/nvim-nio' },
      'theHamsta/nvim-dap-virtual-text',
    },
  },
}

return M
