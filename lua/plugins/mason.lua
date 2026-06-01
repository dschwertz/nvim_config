vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = { callSnippet = 'Replace' },
      diagnostics = { disable = { 'missing-fields' } },
    },
  },
})

vim.lsp.enable { 'lua_ls', 'ts_ls' }

return {
  {
    'mason-org/mason.nvim',
    opts = {},
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'lua-language-server',
        'typescript-language-server',
        'stylua',
      },
    },
  },
}
