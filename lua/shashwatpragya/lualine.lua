local custom_gruvbox = require("lualine.themes.gruvbox")
local custom_dracula = require("lualine.themes.dracula")
local custom_tokyonight = require("lualine.themes.tokyonight")
local custom_darkplus = require("lualine.themes.darkplus")
local custom_onedark = require("lualine.themes.onedark")
local custom_kanagawa = require("lualine.themes.kanagawa")
-- local custom_onedarker = require("lualine.themes.onedarker")
local navic = require("nvim-navic")

-- Change the background of lualine_c section for normal mode
custom_darkplus.normal.c.bg = "#112233"

return require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = custom_darkplus,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				colored = false, -- Displays a colored diff status if set to true
			},
			"diagnostics",
		},
		lualine_c = {
			{ navic.get_location, cond = navic.is_available },
		},
		lualine_x = {
			"encoding",
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "",
				},
			},
			"filetype",
		},
	},
})
