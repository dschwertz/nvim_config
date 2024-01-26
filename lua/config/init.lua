-- Setup <leader> and <localleader> before loading plugins
require("config.leader")

-- Use lazy.nvim for plugin management
require("config.lazy")

-- Continue with the configuration, possibly overriding settings that some
-- plugins might set.
require("config.options")
require("config.colorscheme")
require("config.keymaps").init()
require("config.commands")