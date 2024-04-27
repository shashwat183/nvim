local mason_lspconfig = require('mason-lspconfig')
local M = {}

--  This function gets run when an LSP connects to a particular buffer.
M.on_attach = function(_, bufnr)
  require('shashwatpragya.lsp.keymaps').lsp_keymaps(bufnr)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    require("conform").format({ bufnr = bufnr, lsp_fallback = true })
  end, { desc = 'Format current buffer with LSP' })
end

-- codelens refresh autocmd when lsp attaches, only runs once
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  once = true,
  callback = vim.lsp.codelens.refresh,
})

M.on_attach_with_codelens = function(_, bufnr)
  M.on_attach(nil, bufnr)

  -- autocmd for buffer to refresh codelens on TextChanged and InsertLeave as well
  vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })

  -- trigger codelens refresh when lsp is attached to buffer
  vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
end

local servers = {
  gopls = {
    gopls = {
      codelenses = {
        generate = true,
      },
      hints = {
        assignVariableTypes = false,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      }
    },
  },
  pyright = {
    python = {
      analysis = {
        autoImportCompletions = true,
        typeCheckingMode = "on",
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = true,
        }
      },
    },
  },
  jdtls = {},
  -- jdtls = {
  --   settings = {
  --     java = {
  --       implementationsCodeLens = {
  --         enabled = true,
  --       },
  --       referencesCodeLens = {
  --         enabled = true,
  --       },
  --       inlayHints = { parameterNames = { enabled = "all" } },
  --       signatureHelp = { enabled = true },
  --       format = {
  --         settings = {
  --           url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
  --         },
  --         enabled = true,
  --       },
  --       completion = {
  --         favoriteStaticMembers = {
  --           "org.hamcrest.MatcherAssert.assertThat",
  --           "org.hamcrest.Matchers.*",
  --           "org.hamcrest.CoreMatchers.*",
  --           "org.junit.jupiter.api.Assertions.*",
  --           "java.util.Objects.requireNonNull",
  --           "java.util.Objects.requireNonNullElse",
  --           "org.mockito.Mockito.*",
  --           "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
  --           "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*"
  --         },
  --       },
  --     },
  --   },
  --   handlers = {
  --     ['language/status'] = do_nothing,
  --     ['$/progress'] = vim.lsp.handlers["$/progress"],
  --   },
  -- },
  -- java_language_server = {},
  tsserver = {},
  lemminx = {
    redhat = {
      telemetry = { enabled = false }
    }
  },
  -- Settings - https://www.npmjs.com/package/vscode-json-languageserver
  jsonls = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    }
  },
  yamlls = {
    yaml = {
      schemaStore = {
        enable = true,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
      customTags = {
        "!GetAtt",
      },
    },
  },
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = { enable = true },
    },
  },
  html = {
    filetypes = { "html", "templ" },
  },
  templ = {},
  cssls = {},
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(M.capabilities)

mason_lspconfig.setup_handlers {
  -- default handler
  function(server_name)
    local non_codelens_server = {
      "tsserver",
      "jsonls",
      "pyright",
    }
    local attach_func = M.on_attach_with_codelens
    for _, value in ipairs(non_codelens_server) do
      if server_name == value then
        attach_func = M.on_attach
      end
    end
    require('lspconfig')[server_name].setup {
      capabilities = M.capabilities,
      on_attach = attach_func,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,

  ["jdtls"] = function() -- skip setup as we use nvim-jdtls
  end
}

return M
