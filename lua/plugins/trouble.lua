local opts = {
  severity = "ERROR"
}

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
  opts = opts,
}
