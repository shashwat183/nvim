local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = {
  "jsonls",
  "lua_ls",
  "jdtls",
  "pyright",
  "yamlls",
  "gopls",
  "asm_lsp",
  "tsserver",
  "html",
  "cssls"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("shashwatpragya.lsp.handlers").on_attach,
    capabilities = require("shashwatpragya.lsp.handlers").capabilities,
  }

	if server == "jsonls" then
		local jsonls_opts = require("shashwatpragya.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server == "lua_ls" then
		local lua_ls_opts = require("shashwatpragya.lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end

	-- if server == "jdtls" then
	-- 	return
	-- end

	if server == "pyright" then
		local pyright_opts = require("shashwatpragya.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "html" then
		local html_opts = require("shashwatpragya.lsp.settings.html")
		opts = vim.tbl_deep_extend("force", html_opts, opts)
	end

	if server == "cssls" then
		local cssls_opts = require("shashwatpragya.lsp.settings.cssls")
		opts = vim.tbl_deep_extend("force", cssls_opts, opts)
	end

	if server == "gopls" then
		local gopls_opts = require("shashwatpragya.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end

	if server == "yamlls" then
		local yamlls_opts = require("shashwatpragya.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

  lspconfig[server].setup(opts)

end

-- local lsp_installer = require("nvim-lsp-installer")
--
-- -- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- -- or if the server is already installed).
-- lsp_installer.on_server_ready(function(server)
-- 	-- (optional) Customize the options passed to the server
-- 	-- if server.name == "tsserver" then
-- 	--     opts.root_dir = function() ... end
-- 	-- end
-- 	local opts = {
-- 		on_attach = require("shashwatpragya.lsp.handlers").on_attach,
-- 		capabilities = require("shashwatpragya.lsp.handlers").capabilities,
-- 	}
--
-- 	if server.name == "jsonls" then
-- 		local jsonls_opts = require("shashwatpragya.lsp.settings.jsonls")
-- 		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	end
--
-- 	if server.name == "sumneko_lua" then
-- 		local sumneko_opts = require("shashwatpragya.lsp.settings.sumneko_lua")
-- 		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	end
--
-- 	if server.name == "jdtls" then
-- 		return
-- 	end
--
-- 	if server.name == "pyright" then
-- 		local pyright_opts = require("shashwatpragya.lsp.settings.pyright")
-- 		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	end
--
-- 	if server.name == "gopls" then
-- 		local gopls_opts = require("shashwatpragya.lsp.settings.gopls")
-- 		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
-- 	end
--
-- 	if server.name == "yamlls" then
-- 		local yamlls_opts = require("shashwatpragya.lsp.settings.yamlls")
-- 		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
-- 	end
--
-- 	-- This setup() function will take the provided server configuration and decorate it with the necessary properties
-- 	-- before passing it onwards to lspconfig.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
