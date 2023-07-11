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

  -- -- print('lsp_servers ' .. lsp)
  -- local filetypes = {}
  -- if lsp == 'typescript' then
  --   print('SETUP ' .. lsp)
  --   filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
  -- end

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
      -- flow = {
      --   cmd = { 'yarn', 'flow', 'lsp' },
      -- },
    },
  }
  ::continue::
end

nvim_lsp.flow.setup {
  -- cmd = { 'yarn', 'flow', 'lsp' },
  capabilities = capabilities,
  -- on_attach = on_attach,
}

vim.filetype.add {
  pattern = {
    ['.*.js'] = {
      priority = math.huge,
      function(_, bufnr)
        -- TODO: Keep looking until there are not more lines commented out
        local content = vim.filetype.getlines(bufnr, 1)
        -- print '****filetype check content' .. content
        if vim.filetype.matchregex(content, '^// @flow') then
          print '****filetype flow'
          return 'javascriptreact'
        else
          print '****filetype js'
          return 'javascript'
        end
      end,
    },
  },
}

vim.treesitter.language.register('tsx', 'javascriptreact')
-- vim.treesitter.language.register('js', 'javascriptreact')
