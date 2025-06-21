return {
  "rose-pine/neovim",
  name = "rose-pine", -- optional, helps resolve name conflicts
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "moon",
      dark_variant = "moon",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
    })
    vim.cmd.colorscheme("rose-pine") -- ✅ apply *after* setup
  end,
}