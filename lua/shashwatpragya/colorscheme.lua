vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
-- require('onedark').setup {
--     style = 'warm'
-- }
-- require('onedark').load()
-- vim.g.vscode_style = "dark"
-- vim.g.vscode_italic_comment = 1
-- vim.cmd([[colorscheme darkplus]])
vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
vim.cmd([[colorscheme catppuccin]])
