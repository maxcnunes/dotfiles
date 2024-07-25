-- Plugin for Go language development
local M = {
  'ray-x/go.nvim',
  dependencies = {
    'ray-x/guihua.lua',
  },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  config = function()
    local icons = require 'core.utils.icons'
    require('go').setup {
      -- NOTE: all LSP and formatting related options are disabeld.
      -- NOTE: is not related to core.plugins.lsp
      -- NOTE: manages LSP on its own
      go = 'go', -- go command, can be go[default] or go1.18beta1
      goimports = 'gopls', -- goimport command, can be gopls[default] or goimport
      fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
      gofmt = 'gopls', -- gofmt cmd,
      max_line_len = 0, -- max line length in goline format
      tag_transform = false, -- tag_transfer  check gomodifytags for details
      test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
      test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
      comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. ﳑ       
      icons = { breakpoint = icons.ui.Yoga, currentpos = icons.ui.RunningMan },
      verbose = false, -- output loginf in messages
      lsp_cfg = true, -- true: use non-default gopls setup specified in go/lsp.lua
      -- false: do nothing
      -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
      --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
      lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = function(client, bufnr)
        -- attach my LSP configs keybindings
        require('core.plugins.lsp.keys').on_attach(client, bufnr)
        local wk = require 'which-key'
        wk.add {
          { '<leader>c', group = 'Coding' },
          { '<leader>ca', '<cmd>GoCodeAction<cr>', desc = 'Code action' },
          { '<leader>ce', '<cmd>GoIfErr<cr>', desc = 'Add if err' },
          { '<leader>ch', group = 'Helper' },
          { '<leader>cha', '<cmd>GoAddTag<cr>', desc = 'Add tags to struct' },
          { '<leader>chc', '<cmd>GoCoverage<cr>', desc = 'Test coverage' },
          { '<leader>chg', "<cmd>lua require('go.comment').gen()<cr>", desc = 'Generate comment' },
          { '<leader>chi', '<cmd>GoModInit<cr>', desc = 'Go mod init' },
          { '<leader>chr', '<cmd>GoRMTag<cr>', desc = 'Remove tags to struct' },
          { '<leader>cht', '<cmd>GoModTidy<cr>', desc = 'Go mod tidy' },
          { '<leader>chv', '<cmd>GoVet<cr>', desc = 'Go vet' },
          { '<leader>ci', '<cmd>GoToggleInlay<cr>', desc = 'Toggle inlay' },
          { '<leader>cl', '<cmd>GoLint<cr>', desc = 'Run linter' },
          { '<leader>co', '<cmd>GoPkgOutline<cr>', desc = 'Outline' },
          { '<leader>cr', '<cmd>GoRun<cr>', desc = 'Run' },
          { '<leader>cs', '<cmd>GoFillStruct<cr>', desc = 'Autofill struct' },
          { '<leader>ct', group = 'Tests' },
          { '<leader>cta', '<cmd>GoAlt!<cr>', desc = 'Open alt file' },
          { '<leader>ctf', '<cmd>GoTestFile<cr>', desc = 'Run test for current file' },
          { '<leader>ctr', '<cmd>GoTest<cr>', desc = 'Run tests' },
          { '<leader>cts', '<cmd>GoAltS!<cr>', desc = 'Open alt file in split' },
          { '<leader>ctu', '<cmd>GoTestFunc<cr>', desc = 'Run test for current func' },
          { '<leader>ctv', '<cmd>GoAltV!<cr>', desc = 'Open alt file in vertical split' },
          { '<leader>cx', group = 'Code Lens' },
          { '<leader>cxa', '<cmd>GoCodeAction<cr>', desc = 'Code Action' },
          { '<leader>cxl', '<cmd>GoCodeLenAct<cr>', desc = 'Toggle Lens' },
        }
        wk.add {
          { '<leader>cj', "<cmd>'<,'>GoJson2Struct<cr>", desc = 'Json to struct', mode = 'v' },
        }
      end, -- nil: use on_attach function defined in go/lsp.lua,
      --      when lsp_cfg is true
      -- if lsp_on_attach is a function: use this function as on_attach function for gopls
      lsp_codelens = true, -- set to false to disable codelens, true by default
      lsp_keymaps = false, -- set to false to disable gopls/lsp keymap
      diagnostic = { -- set diagnostic to false to disable vim.diagnostic setup
        hdlr = true, -- hook lsp diag handler
        underline = true,
        -- virtual text setup
        virtual_text = { space = 0, prefix = icons.arrows.Diamond },
        signs = true,
        update_in_insert = false,
      },
      lsp_document_formatting = false,
      -- set to true: use gopls to format
      -- false if you want to use other formatter tool(e.g. efm, nulls)
      lsp_inlay_hints = {
        enable = false,
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refersh of the inlay hints.
        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
        -- not that this may cause higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = 'CursorHold',
        -- whether to show variable name before type hints with the inlay hints or not
        -- default: false
        show_variable_name = true,
        -- prefix for parameter hints
        -- parameter_hints_prefix = ' ',
        show_parameter_hints = true,
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = '=> ',
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 6,
        -- The color of the hints
        highlight = 'Comment',
      },
      gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
      gopls_remote_auto = true, -- add -remote=auto to gopls
      gocoverage_sign = '█',
      dap_debug = false, -- set to false to disable dap
      dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
      -- false: do not use keymap in go/dap.lua.  you must define your own.
      dap_debug_gui = false, -- set to true to enable dap gui, highly recommended
      dap_debug_vt = false, -- set to true to enable dap virtual text
      build_tags = '', -- set default build tags
      textobjects = true, -- enable default text jobects through treesittter-text-objects
      test_runner = 'go', -- richgo, go test, richgo, dlv, ginkgo
      run_in_floaterm = false, -- set to true to run in float window.
      -- float term recommended if you use richgo/ginkgo with terminal color
      luasnip = true,
    }
  end,
}

return M
