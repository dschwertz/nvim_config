local keymaps = {}
local ts_move_keys = {
    f = { query = "@function.outer", desc = "goto function" },
    a = { query = "@attribute.inner", desc = "goto attribute" },
    b = { query = "@block.inner", desc = "goto block" },
    c = { query = "@class.outer", desc = "goto class" },
    x = { query = "@comment.outer", desc = "goto comment" },
    g = { query = { "@class.outer", "@function.outer" }, desc = "goto major" },
}

keymaps.ts_goto_next_start = {}
keymaps.ts_goto_next_end = {}
keymaps.ts_goto_previous_start = {}
keymaps.ts_goto_previous_end = {}

for k, v in pairs(ts_move_keys) do
    keymaps.ts_goto_next_start["]" .. k] = v
    keymaps.ts_goto_next_end["]" .. string.upper(k)] = v
    keymaps.ts_goto_previous_start["[" .. k] = v
    keymaps.ts_goto_previous_end["[" .. string.upper(k)] = v
end

-- Some symbolic keymaps that don't have a string.upper()
keymaps.ts_goto_next_start["]="] = { query = "@statement.outer", desc = "goto statement" }
keymaps.ts_goto_previous_start["[="] = { query = "@statement.outer", desc = "goto statement" }
keymaps.ts_goto_next_start["],"] = { query = "@parameter.outer", desc = "goto parameter" }
keymaps.ts_goto_previous_start["[,"] = { query = "@parameter.outer", desc = "goto parameter" }

keymaps.ts_swap_next = {
    ["<leader>s"] = { query = "@parameter.inner", desc = "Swap next parameter" },
}
keymaps.ts_swap_previous = {
    ["<leader>S"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
}

keymaps.ts_select = {
    ["af"] = { query = "@function.outer", desc = "Select outer function" },
    ["if"] = { query = "@function.inner", desc = "Select inner function" },
    ["ac"] = { query = "@class.outer", desc = "Select outer class" },
    ["ic"] = { query = "@class.inner", desc = "Select inner class" },
    ["aB"] = { query = "@block.outer", desc = "Select outer block" },
    ["iB"] = { query = "@block.inner", desc = "Select inner block" },
    ["aa"] = { query = "@attribute.outer", desc = "Select outer attribute" },
    ["ia"] = { query = "@attribute.inner", desc = "Seect inner attribute" },
    ["ax"] = { query = "@comment.outer", desc = "Select outer comment" },
    ["ix"] = { query = "@comment.inner", desc = "Select inner comment" },
    ["a="] = { query = "@statement.outer", desc = "Select outer statement" },
    ["i="] = { query = "@statement.inner", desc = "Select inner statement" },
    ["a,"] = { query = "@parameter.outer", desc = "Select outer parameter" },
    ["i,"] = { query = "@parameter.inner", desc = "Select inner parameter" },
}
local config = function()

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"awk",
			"bash",
			"beancount",
			"c",
			"cmake",
			"cpp",
			"css",
			"csv",
			"diff",
			"dockerfile",
			"dot",
			"eex",
			"elixir",
			"fish",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"gpg",
			"heex",
			"html",
			"http",
			"javascript",
			"jq",
			"json",
			"jsonc",
			"lua",
			"luap",
			"make",
			"markdown",
			"markdown_inline",
			"norg",
			"python",
			"query",
			"regex",
			"ruby",
			"rust",
			"scheme",
			"scss",
			"sql",
			"toml",
			"typescript",
			"vim",
			"vue",
			"xml",
			"yaml",
		},
    indent = {
      enable = true,
      disable = { 'python', 'c' }
    },
		highlight = {
			enable = true,
		},
		matchup = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		endwise = {
			enable = true,
		},
		textobjects = {
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = keymaps.ts_goto_next_start,
				goto_next_end = keymaps.ts_goto_next_end,
				goto_previous_start = keymaps.ts_goto_previous_start,
				goto_previous_end = keymaps.ts_goto_previous_end,
			},
			swap = {
				enable = true,
				swap_next = keymaps.ts_swap_next,
				swap_previous = keymaps.ts_swap_previous,
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = keymaps.ts_select,
			},
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25,
			persist_queries = true,
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	})

	-- NOTE that this interferes with flash f/t
	-- Make movements repeatable with ; and ,
	-- local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
	-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
	-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
	-- vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
	-- vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
	-- vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
	-- vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = config,
		build = ":TSUpdate",
		cmd = { "TSUpdate" },
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"RRethy/nvim-treesitter-endwise",
		},
	},
	{
		"nvim-treesitter/playground",
		cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
