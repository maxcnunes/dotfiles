local settings = require 'core.settings'
local nvim_lsp = require 'lspconfig'
local utils = require 'core.plugins.lsp.utils'
local lsp_settings = require 'core.plugins.lsp.settings'

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- enable autoclompletion via nvim-cmp
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('core.utils.functions').on_attach(function(client, buffer)
  -- disable formatting for LSP clients as this is handled by null-ls
  -- TODO: not required anymore?
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false
  require('core.plugins.lsp.keys').on_attach(client, buffer)
end)

for _, lsp in ipairs(settings.lsp_servers) do
  if lsp == 'rust_analyzer' then
    vim.notify('rust_analyzer is managed by rust-tools', vim.log.levels.INFO, { title = 'LSP config' })
    goto continue
  end

  -- NOTE: It uses the default configuration for each server from nvim-lspconfig.
  nvim_lsp[lsp].setup {
    before_init = function(_, config)
      if lsp == 'pyright' then
        config.settings.python.pythonPath = utils.get_python_path(config.root_dir)
      end
    end,
    -- filetypes = filetypes,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
      json = lsp_settings.json,
      Lua = lsp_settings.lua,
      ltex = lsp_settings.ltex,
      redhat = { telemetry = { enabled = false } },
      texlab = lsp_settings.tex,
      yaml = lsp_settings.yaml,
    },
  }
  ::continue::
end

nvim_lsp.flow.setup {
  capabilities = capabilities,
}

-- NOTE: In order to support Flow language properly, it needs to use jsx filetype.
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3350
vim.filetype.add {
  pattern = {
    ['.*.js'] = {
      priority = math.huge,
      function(_, bufnr)
        -- Check the top 10 commented lines if there is any with a Flow annotation
        -- which determines it is a Javascript file with Flow type checking support.
        local isFlowFile = false

        local lines = vim.filetype.getlines(bufnr, 1, 10)

        for _, content in pairs(lines) do
          if content ~= '' then
            if vim.filetype.matchregex(content, '^// @flow') or vim.filetype.matchregex(content, '^/* @flow') then
              isFlowFile = true
              break
            end

            if vim.filetype.matchregex(content, '^// @noflow') or vim.filetype.matchregex(content, '^/* @noflow') then
              break
            end
          end
        end

        if isFlowFile then
          return 'javascriptreact'
        else
          return 'javascript'
        end
      end,
    },
  },
}

vim.treesitter.language.register('tsx', 'javascriptreact')
