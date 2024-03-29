local config = {
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'Makefile' }, { upward = true })[1]),
  on_attach = require("shashwatpragya.lsp.mason-lspconfig").on_attach_with_codelens,
  capabilities = require("shashwatpragya.lsp.mason-lspconfig").capabilities,
  settings = {
    java = {
      format = {
        settings = {
          url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml"
        },
      },
    }
  }
}
require('jdtls').start_or_attach(config)
