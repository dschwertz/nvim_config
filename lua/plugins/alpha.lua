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
        dashboard.button("n", " " .. " New markdown file", ":cd ~/Desktop <CR> :e ~/Desktop/untitled.md <CR>"),
        dashboard.button("fdesk", "󰍉 " .. " Find desktop file",
          ":lua require('telescope.builtin').find_files({ cwd = '~/Desktop' })<CR>"),
        dashboard.button("fgit", "󰍉 " .. " Find github file",
          ":lua require('telescope.builtin').find_files({ cwd = '~/github' })<CR>"),
        dashboard.button("fdoc", "󰍉 " .. " Find documents file",
          ":lua require('telescope.builtin').find_files({ cwd = '~/Documents' })<CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Nvim config",
          ":lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('~/.config/nvim') })<CR>"),
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