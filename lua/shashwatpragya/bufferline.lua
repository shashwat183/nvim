vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
		separator_style = "slant",
		show_tab_indicators = true,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
