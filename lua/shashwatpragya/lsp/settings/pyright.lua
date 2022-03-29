local util = require("lspconfig/util")

return {
	root_dir = function(fname)
		return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
			or util.path.dirname(fname)
	end,
	settings = {
		python = {
			analysis = {
				autoImportCompletions = true,
				typeCheckingMode = "off",
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				-- diagnosticSeverityOverrides = {
				-- 	reportGeneralTypeIssues = false,
				-- },
			},
		},
	},
}
