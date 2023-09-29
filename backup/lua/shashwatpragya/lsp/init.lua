require("lspconfig")

require("shashwatpragya.lsp.mason")

-- local nlspsettings = require("nlspsettings")
-- nlspsettings.setup({
--   config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
--   local_settings_dir = ".nlsp-settings",
--   local_settings_root_markers = { '.git' },
--   append_default_schemas = true,
--   loader = 'json'
-- })
require("shashwatpragya.lsp.handlers").setup()
require("shashwatpragya.lsp.null-ls")
