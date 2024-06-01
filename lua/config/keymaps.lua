-- Keymaps that are sent to plugins during configuration
-- Return a module here so we can keep all keymap definitions
-- in the same place.
-- This is only for global keys, other contexts
-- (such as in the cmp selection menu) may be defined
-- in their respective files.
local M = {}
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Wrap it in a function to prevent requiring this file evaluates
-- global keymaps multiple times.
M.init = function()
  -- keep cursor in middle and modify cursor movement
  map('n', 'k', 'kzz', opts)
  map('n', 'j', 'jzz', opts)
  map('n', '<S-d>', '<C-d>zz', opts)
  map('n', '<S-u>', '<C-u>zz', opts)
  map('n', '(', '^zz', opts)
  map('n', ')', '$zz', opts)
  -- better window navigation
  map('n', '<leader>w', '<C-w>k', opts)
  map('n', '<leader>a', '<C-w>h', opts)
  map('n', '<leader>d', '<C-w>l', opts)
  map('n', '<leader>s', '<C-w>j', opts)
  -- press jk fast to <ESC> from insert mode
  map('i', 'jk', '<ESC>', opts)
  -- resizing windows
  map('n', '<S-Up>', '<CMD>resize +2<CR>', opts)
  map('n', '<S-Down>', '<CMD>resize -2<CR>', opts)
  map('n', '<S-Left>', '<CMD>vertical resize -2<CR>', opts)
  map('n', '<S-Right>', '<CMD>vertical resize +2<CR>', opts)
  map('c', 'git ', 'Git ', opts)
  -- shift indent of selection and keep selection
  map('v', '<', '<gv', opts)
  map('v', '>', '>gv', opts)



  -- PLUGIN KEYMAPS
  -- barbar
  map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
  map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
  map('n', '<leader>qt', '<Cmd>BufferClose<CR>', opts)
  map('n', '<C-<>', '<Cmd>BufferMovePrevious<CR>', opts)
  map('n', '<C->>', '<Cmd>BufferMoveNext<CR>', opts)
  --nvim-tree
  map('n', '<leader>tt', '<Cmd>NvimTreeToggle<Cr>', opts)
  map('n', '<leader>tclose', '<Cmd>NvimTreeCollapse<Cr>', opts)
  map('n', '<C-]>', require("nvim-tree.api").tree.change_root_to_node, opts)
  map('n', '<C-[>', require("nvim-tree.api").tree.change_root_to_parent, opts)
  -- telescope
  local builtin = require('telescope.builtin')
  map('n', '<leader>fg', builtin.live_grep, opts)
  -- trouble
  vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
  vim.keymap.set("n", "<leader>xg", function() require("trouble").toggle("workspace_diagnostics") end)
  vim.keymap.set("n", "<leader>xh", function() require("trouble").toggle("document_diagnostics") end)
  vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
  vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
  vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
  -- vim-commentary
  map('n', '<C-/>', '<Plug>CommentaryLine', opts)
  map('v', '<C-/>', '<Plug>Commentary', opts)
end

M.lspconfig = function()
  local lspconfigOpts = {}
  map('n', 'gD', vim.lsp.buf.declaration, lspconfigOpts)
  map('n', 'gd', vim.lsp.buf.definition, lspconfigOpts)
  map('n', 'K', vim.lsp.buf.hover, lspconfigOpts)
  map('n', 'gi', vim.lsp.buf.implementation, lspconfigOpts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, lspconfigOpts)
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, lspconfigOpts)
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, lspconfigOpts)
  map('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, lspconfigOpts)
  map('n', '<space>D', vim.lsp.buf.type_definition, lspconfigOpts)
  map('n', '<space>rn', vim.lsp.buf.rename, lspconfigOpts)
  map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, lspconfigOpts)
  map('n', 'gr', vim.lsp.buf.references, lspconfigOpts)
  map('n', '<space>f', function()
    vim.lsp.buf.format { async = false }
  end, lspconfigOpts)
end

return M
