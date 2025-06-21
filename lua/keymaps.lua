local map = vim.keymap.set
local opts = { noremap = true, silent = true }
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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
-- map('n', '<C-]>', require("nvim-tree.api").tree.change_root_to_node, opts)
-- map('n', '<C-[>', require("nvim-tree.api").tree.change_root_to_parent, opts)
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

