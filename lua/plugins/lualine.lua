local config = function()
  local lualine = require("lualine")

  lualine.setup({
    options = {
      theme = "auto",
    },
    sections = {
      lualine_c = {"diff"},
      lualine_x = {},
      lualine_y = {"filetype"},
      lualine_z = { {"progress"}, {"location"}}
    }
  })
end
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/lsp-status.nvim",
	},
	config = config,
	event = { "BufReadPre", "BufNewFile" },
}
