local opts = {
  s = { -- example of a custom action that toggles the severity
    action = function(view)
      local f = view:get_filter("severity")
      local severity = ((f and f.filter.severity or 0) + 1) % 5
      view:filter({ severity = severity }, {
        id = "severity",
        template = "{hl:Title}Filter:{hl} {severity}",
        del = severity == 0,
      })
    end,
    desc = "Toggle Severity Filter",
  },
}

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
  opts = opts,
}
