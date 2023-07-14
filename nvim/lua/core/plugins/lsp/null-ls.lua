local nls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

nls.setup {
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
  sources = {
    nls.builtins.code_actions.shellcheck, -- https://www.shellcheck.net/
    nls.builtins.diagnostics.checkmake, -- https://github.com/mrtazz/checkmake
    nls.builtins.diagnostics.codespell, -- https://github.com/codespell-project/codespell
    nls.builtins.diagnostics.golangci_lint, -- https://github.com/golangci/golangci-lint (~/.golangci.yml)
    nls.builtins.diagnostics.staticcheck, -- https://github.com/dominikh/go-tools
    nls.builtins.diagnostics.write_good, -- https://github.com/btford/write-good
    nls.builtins.diagnostics.zsh, -- https://www.zsh.org/ (uses zsh command's -n option to evaluate code, not execute it)
    nls.builtins.formatting.black, -- https://github.com/psf/black
    nls.builtins.formatting.autopep8, -- https://github.com/hhatto/autopep8
    -- DISABLED: Because it auto-formats code and ends up breaking code.
    -- nls.builtins.formatting.codespell,                   -- https://github.com/codespell-project/codespell
    nls.builtins.formatting.fixjson, -- https://github.com/rhysd/fixjson
    nls.builtins.formatting.goimports_reviser, -- https://pkg.go.dev/github.com/incu6us/goimports-reviser
    --   nls.builtins.formatting.goimports, -- https://pkg.go.dev/golang.org/x/tools/cmd/goimports
    nls.builtins.formatting.isort, -- https://github.com/PyCQA/isort
    nls.builtins.formatting.lua_format, -- https://github.com/Koihik/LuaFormatter
    nls.builtins.formatting.markdown_toc, -- https://github.com/jonschlinkert/markdown-toc
    nls.builtins.formatting.mdformat, -- https://github.com/executablebooks/mdformat
    nls.builtins.formatting.ocdc, -- https://github.com/mdwint/ocdc
    nls.builtins.formatting.shfmt, -- https://github.com/mvdan/sh
    nls.builtins.formatting.taplo, -- https://taplo.tamasfe.dev/
    nls.builtins.formatting.terraform_fmt, -- https://www.terraform.io/docs/cli/commands/fmt.html
    nls.builtins.formatting.yamlfmt, -- https://github.com/google/yamlfmt
    nls.builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua
    nls.builtins.diagnostics.eslint_d, -- https://github.com/mantoni/eslint_d.js/
    nls.builtins.formatting.prettier, -- https://prettier.io/
    nls.builtins.formatting.gofumpt, -- https://github.com/mvdan/gofumpt
    nls.builtins.code_actions.gitsigns, -- https://github.com/lewis6991/gitsigns.nvim
    nls.builtins.diagnostics.ruff, -- https://github.com/astral-sh/ruff
    nls.builtins.formatting.rustfmt, -- https://github.com/rust-lang/rustfmt
  },
  on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>tF', "<cmd>lua require('core.plugins.lsp.utils').toggle_autoformat()<cr>", { desc = 'Toggle format on save' })

    -- Configure to auto-format on saving a file
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if AUTOFORMAT_ACTIVE then -- global var defined in functions.lua
            vim.lsp.buf.format { bufnr = bufnr }
          end
        end,
      })
    end
  end,
}
