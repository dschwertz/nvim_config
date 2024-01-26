return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		opts = function()
			local dashboard = require("alpha.themes.dashboard")
			local logo = [[
███████╗████████╗███████╗██╗     ██╗      █████╗ ███████╗
██╔════╝╚══██╔══╝██╔════╝██║     ██║     ██╔══██╗██╔════╝
███████╗   ██║   █████╗  ██║     ██║     ███████║███████╗
╚════██║   ██║   ██╔══╝  ██║     ██║     ██╔══██║╚════██║
███████║   ██║   ███████╗███████╗███████╗██║  ██║███████║
╚══════╝   ╚═╝   ╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝
                                                         
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗   
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║   
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║   
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║   
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║   
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝   
                                                         
]]
			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.buttons.val = {
				dashboard.button("f", "󰍉 " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", " " .. " Nvim config", ":lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('~/.config/nvim') })<CR>"),
				dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}
			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.opts.layout[1].val = 6
			return dashboard
		end,
		config = function(_, dashboard)
			require("alpha").setup(dashboard.opts)
		end,
	},
}
