-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
local opts = {
  cmd = { 'lua-language-server' },
  format = {
    enable = false, -- let the plugin used for formatting to handle it
  },
  filetypes = { 'lua' },
  runtime = {
    version = 'LuaJIT',
    path = vim.split(package.path, ';'),
  },
  completion = { enable = true, callSnippet = 'Replace' },
  diagnostics = {
    -- enable = true,
    -- globals = { "vim", "describe" },
    globals = {
      'vim',
      'nnoremap',
      'vnoremap',
      'inoremap',
      'tnoremap',
      'use',
    },
  },
  workspace = {
    library = {
      vim.api.nvim_get_runtime_file('', true),
      vim.fn.expand '$VIMRUNTIME/lua',
      vim.fn.expand '$VIMRUNTIME/lua/vim/lsp',
      '${3rd}/luv/library',
    },
    -- adjust these two values if your performance is not optimal
    maxPreload = 2000,
    preloadFileSize = 1000,
  },
  telemetry = { enable = false },
}

return opts
