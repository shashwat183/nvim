local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

local sources = {
	formatting.stylua,
	formatting.black.with({
		extra_args = { "--line-length", "79", "--fast" },
	}),
	diagnostics.flake8,
}

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
