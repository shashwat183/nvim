local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

local sources

if pcall(require, "shashwatpragya.lsp.local-null-ls-sources") then
	-- Locally defined formatting sources and configurations
	sources = require("shashwatpragya.lsp.local-null-ls-sources")
else
	-- Default formatting sources with configurations
	sources = {
		formatting.stylua,
		formatting.black.with({
			extra_args = { "--line-length", "79", "--fast" },
		}),
		formatting.google_java_format,
		formatting.eslint_d,
		diagnostics.eslint_d,
		formatting.gofmt,
		diagnostics.flake8,
		diagnostics.golangci_lint,
		diagnostics.gitlint,
	}
end

null_ls.setup({
	sources = sources,
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
	            augroup LspFormatting
	                autocmd! * <buffer>
	                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	            augroup END
	            ]])
		end
	end,
})
