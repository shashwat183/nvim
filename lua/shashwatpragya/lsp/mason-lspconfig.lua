local mason_lspconfig = require('mason-lspconfig')

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)

  require('shashwatpragya.lsp.keymaps').lsp_keymaps(bufnr)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

end

-- codelens refresh autocmd when lsp attaches, only runs once
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  once = true,
  callback = vim.lsp.codelens.refresh,
})

local on_attach_with_codelens = function(_, bufnr)
  on_attach(nil, bufnr)

  -- autocmd for buffer to refresh codelens on TextChanged and InsertLeave as well
  vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })

  -- trigger codelens refresh when lsp is attached to buffer
  vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })
end

-- function that does nothing so language/status will not print anywhere
local function do_nothing()
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
        typeCheckingMode = "off",
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = true,
        }
      },
    },
  },
  jdtls = {
    settings = {
      java = {
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        inlayHints = { parameterNames = { enabled = "all" } },
        signatureHelp = { enabled = true },
        format = {
          settings = {
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
          },
          enabled = true,
        },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
            "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
            "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*"
          },
        },
      },
    },
    handlers = {
      ['language/status'] = do_nothing,
      ['$/progress'] = vim.lsp.handlers["$/progress"],
    },
  },
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
}

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup_handlers {
  -- default handler
  function(server_name)
    local non_codelens_server = {"tsserver", "jsonls", "pyright"}
    local attach_func = on_attach_with_codelens
    for _, value in ipairs(non_codelens_server) do
      if server_name == value then
        attach_func = on_attach
      end
    end
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = attach_func,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,

  -- special setup for jdtls
  ["jdtls"] = function()
    require('lspconfig')["jdtls"].setup({
      capabilities = capabilities,
      on_attach = on_attach_with_codelens,
      settings = servers["jdtls"].settings,
      filetypes = (servers["jdtls"] or {}).filetypes,
      handlers = (servers["jdtls"] or {}).handlers
    })
  end
}
