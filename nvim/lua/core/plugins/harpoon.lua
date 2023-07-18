return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      local harpoon = require 'harpoon'

      harpoon.setup {}

      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      vim.keymap.set('n', '<leader>hm', ui.toggle_quick_menu, { desc = '[H]arpoon [M]enu' })
      -- vim.keymap.set('n', '<leader>hm', '<Cmd>Telescope harpoon marks<CR>', { desc = '[H]arpoon [M]arked files' })
      vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = '[H]arpoon [A]dd file' })
      vim.keymap.set('n', '<leader>hr', mark.rm_file, { desc = '[H]arpoon [R]emove file' })
      vim.keymap.set('n', '<leader>hc', mark.clear_all, { desc = '[H]arpoon [C]lear all files' })
      vim.keymap.set('n', '<leader>hn', ui.nav_next, { desc = '[H]arpoon go to next' })
      vim.keymap.set('n', '<leader>hp', ui.nav_prev, { desc = '[H]arpoon go to preview' })

      for i = 1, 5 do
        vim.keymap.set('n', string.format('<leader>h%s', i), function()
          ui.nav_file(i)
        end, { desc = string.format('.Go to %s', i) })
      end
    end,
  },
}
