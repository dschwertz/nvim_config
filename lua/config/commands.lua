local cmd = require("util").create_cmd

cmd("UpdateAll", function()
	vim.cmd("TSUpdate")
	vim.cmd("MasonUpdate")
	vim.cmd("Lazy sync")
end)
