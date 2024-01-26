local opts = {
  filters = {
    git_ignored = false,
  }
}

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = opts,
  config = true,
}