-- FIletype configs
vim.opt["colorcolumn"] = "120"
-- get home directory path
local home = os.getenv("HOME")

WORKSPACE_PATH = home .. "/workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local workspace_dir = WORKSPACE_PATH .. project_name
-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

-- Progress report function for fidget plugin
local function progress_report(_, result, ctx)
	local lsp = vim.lsp
	local info = {
		client_id = ctx.client_id,
	}

	local kind = "report"
	if result.complete then
		kind = "end"
	elseif result.workDone == 0 then
		kind = "begin"
	elseif result.workDone > 0 and result.workDone < result.totalWork then
		kind = "report"
	else
		kind = "end"
	end

	local percentage = 0
	if result.totalWork > 0 and result.workDone >= 0 then
		percentage = result.workDone / result.totalWork * 100
	end

	local msg = {
		token = result.id,
		value = {
			kind = kind,
			percentage = percentage,
			title = result.task,
			message = result.subTask,
		},
	}
	-- print(vim.inspect(result))

	lsp.handlers["$/progress"](nil, msg, info)
end

local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"java", -- or '/path/to/java11_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/lsp_servers/jdtls/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		home .. "/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		home .. "/.local/share/nvim/lsp_servers/jdtls/config_linux",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	on_attach = require("shashwatpragya.lsp.handlers").on_attach,
	capabilities = require("shashwatpragya.lsp.handlers").capabilities,

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		["java.format.settings.url"] = home .. "/.config/nvim/language-servers/eclipse-java-google-style.xml",
		["java.format.settings.profile"] = "GoogleStyle",
		java = {
			referencesCodeLens = {
				enabled = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				-- settings = {
				--   profile = "asdf"
				-- }
			},
			signatureHelp = { enabled = true },
		},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {},
	},

	handlers = {
		-- Progress report handler takes the custom progress report function for
		-- fidget. This makes jdtls work with fidget.
		["language/progressReport"] = progress_report,
	},
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
