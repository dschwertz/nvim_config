local opts = {
	ensure_installed = {
		"clangd",
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"lua_ls",
		"marksman",
		"pylsp",
		"rust_analyzer",
		"tsserver",
		"vimls",
		-- "yamlls",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "williamboman/mason.nvim",
}