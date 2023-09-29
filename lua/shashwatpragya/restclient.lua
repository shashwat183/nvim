return require('rest-nvim').setup({
  -- Skip SSL verification, useful for unknown certificates
  -- skip_ssl_verification = false,
  highlight = {
    enabled = true,
    timeout = 150,
  },
})
