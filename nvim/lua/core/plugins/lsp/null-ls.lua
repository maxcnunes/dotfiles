local nls = require 'null-ls'
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

vim.cmd "command! NulllLsToggleEslint lua require('null-ls.sources').toggle('eslint_d')"
vim.cmd "command! NulllLsToggleCodespell lua require('null-ls.sources').toggle('codespell')"

nls.setup {
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
  sources = {
    -- Shell
    nls.builtins.code_actions.shellcheck, -- https://www.shellcheck.net/
    nls.builtins.diagnostics.zsh, -- https://www.zsh.org/ (uses zsh command's -n option to evaluate code, not execute it)

    -- Golang
    nls.builtins.diagnostics.golangci_lint, -- https://github.com/golangci/golangci-lint (~/.golangci.yml)
    nls.builtins.diagnostics.staticcheck, -- https://github.com/dominikh/go-tools
    -- nls.builtins.formatting.goimports_reviser, -- https://pkg.go.dev/github.com/incu6us/goimports-reviser
    -- nls.builtins.formatting.goimports, -- https://pkg.go.dev/golang.org/x/tools/cmd/goimports
    -- nls.builtins.formatting.shfmt, -- https://github.com/mvdan/sh
    -- nls.builtins.formatting.gofumpt, -- https://github.com/mvdan/gofumpt

    -- Makefile
    nls.builtins.diagnostics.checkmake, -- https://github.com/mrtazz/checkmake

    -- Writing
    nls.builtins.diagnostics.codespell, -- https://github.com/codespell-project/codespell
    nls.builtins.diagnostics.write_good, -- https://github.com/btford/write-good

    -- Python
    -- nls.builtins.formatting.black, -- https://github.com/psf/black
    -- nls.builtins.formatting.autopep8, -- https://github.com/hhatto/autopep8

    -- JSON
    -- nls.builtins.formatting.fixjson, -- https://github.com/rhysd/fixjson

    -- nls.builtins.formatting.isort, -- https://github.com/PyCQA/isort

    -- Markdown
    -- nls.builtins.formatting.markdown_toc, -- https://github.com/jonschlinkert/markdown-toc
    -- nls.builtins.formatting.mdformat, -- https://github.com/executablebooks/mdformat

    -- CHANGELOG.md
    -- nls.builtins.formatting.ocdc, -- https://github.com/mdwint/ocdc

    -- TOML
    -- nls.builtins.formatting.taplo, -- https://taplo.tamasfe.dev/

    -- YAML
    -- nls.builtins.formatting.yamlfmt, -- https://github.com/google/yamlfmt

    -- Lua
    -- nls.builtins.formatting.stylua, -- https://github.com/JohnnyMorganz/StyLua

    -- Javascript
    nls.builtins.diagnostics.eslint_d, -- https://github.com/mantoni/eslint_d.js/
    nls.builtins.formatting.prettier, -- https://prettier.io/

    -- Git
    nls.builtins.code_actions.gitsigns, -- https://github.com/lewis6991/gitsigns.nvim

    -- Rust
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
