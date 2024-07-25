-- Super fast git decorations implemented purely in Lua.
local M = {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local function mappings()
      local wk = require 'which-key'
      local default_options = { silent = true }
      local gs = package.loaded.gitsigns
      local map = require('core.utils.functions').map

      -- wk.add({
      --   g = {
      --     name = 'Git',
      --     M = { 'Hydra move' },
      --     ['<Enter>'] = { "<cmd>lua require('neogit').open()<cr>", 'Neogit' },
      --     c = { '<cmd>G commit %<cr>', 'Commit buffer' },
      --     P = { '<cmd>G push<cr>', 'Push' },
      --     S = { gs.stage_buffer, 'Stage buffer' },
      --     u = { gs.undo_stage_hunk, 'Undo stage hunk' },
      --     r = {
      --       name = 'Reset',
      --       R = { gs.reset_buffer, 'Reset buffer' },
      --     },
      --     p = { gs.preview_hunk, 'Preview hunk' },
      --     B = {
      --       function()
      --         gs.blame_line { full = true }
      --       end,
      --       'Blame full',
      --     },
      --     b = { gs.toggle_current_line_blame, 'Blame line' },
      --     D = { gs.diffthis, 'Diff' },
      --     d = { gs.toggle_deleted, 'Show deleted' },
      --   },
      -- }, { prefix = '<leader>', mode = 'n', default_options })

      wk.add {
        { '<leader>g', group = 'Git' },
        { '<leader>g<Enter>', "<cmd>lua require('neogit').open()<cr>", desc = 'Neogit' },
        {
          '<leader>gB',
          function()
            gs.blame_line { full = true }
          end,
          desc = 'Blame full',
        },
        { '<leader>gD', gs.diffthis, desc = 'Diff' },
        { '<leader>gM', desc = 'Hydra move' },
        { '<leader>gP', '<cmd>G push<cr>', desc = 'Push' },
        { '<leader>gS', gs.stage_buffer, desc = 'Stage buffer' },
        { '<leader>gb', gs.toggle_current_line_blame, desc = 'Blame line' },
        { '<leader>gc', '<cmd>G commit %<cr>', desc = 'Commit buffer' },
        { '<leader>gd', gs.toggle_deleted, desc = 'Show deleted' },
        { '<leader>gp', gs.preview_hunk, desc = 'Preview hunk' },
        { '<leader>gr', group = 'Reset' },
        { '<leader>grR', gs.reset_buffer, desc = 'Reset buffer' },
        { '<leader>gu', gs.undo_stage_hunk, desc = 'Undo stage hunk' },
      }

      -- TODO: with german qwertz this bindings are awful
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { desc = 'Next hunk', expr = true })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { desc = 'Previous hunk', expr = true })

      map({ 'n', 'v' }, '<leader>grr', '<cmd>Gitsigns reset_hunk<cr>', { desc = 'Reset hunk' })
      map({ 'n', 'v' }, '<leader>gs', '<cmd>Gitsigns stage_hunk<cr>', { desc = 'Stage hunk' })
      map({ 'o', 'x' }, 'gH', '<cmd><C-U>Gitsigns select_hunk<cr>', { desc = 'Select hunk' })
    end
    require('gitsigns').setup {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    }
    mappings()
  end,
}

return M
