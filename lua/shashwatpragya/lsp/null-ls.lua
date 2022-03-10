local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.black.with({
          extra_args = { "--line-length", "79", "--fast" }
        }),
        diagnostics.flake8,
    },
})
