-- flash.nvim lets you navigate your code with search labels,
-- enhanced character motions, and Treesitter integration.
return {
  'folke/flash.nvim',
  enabled = false, -- Temporary disabled, it wasn't so pleasant using it
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'o', 'x' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
  },
}
