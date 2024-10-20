-- NOTE: This is currently broken https://github.com/ThePrimeagen/harpoon/issues/622
return {
  {
    'ThePrimeagen/harpoon',
    -- branch = 'harpoon2',
    commit = 'e76cb03',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {}

      vim.keymap.set('n', '<leader>hm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon [M]enu' })
      -- vim.keymap.set('n', '<leader>hm', '<Cmd>Telescope harpoon marks<CR>', { desc = '[H]arpoon [M]arked files' })
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [A]dd file' })
      -- vim.keymap.set('n', '<leader>hr', mark.rm_file, { desc = '[H]arpoon [R]emove file' })
      -- vim.keymap.set('n', '<leader>hc', mark.clear_all, { desc = '[H]arpoon [C]lear all files' })
      vim.keymap.set('n', '<leader>hn', function()
        harpoon:list():next()
      end, { desc = '[H]arpoon go to next' })
      vim.keymap.set('n', '<leader>hp', function()
        harpoon:list():prev()
      end, { desc = '[H]arpoon go to previous' })

      for i = 1, 5 do
        vim.keymap.set('n', string.format('<leader>h%s', i), function()
          harpoon:list():select(i)
        end, { desc = string.format('.Go to %s', i) })
      end
    end,
  },
}
