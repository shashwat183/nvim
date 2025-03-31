-- requires manual step to copy queries using wget. see https://github.com/antosha417/tree-sitter-grpc-nvim
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.grpcnvim = {
  install_info = {
    url = "https://github.com/antosha417/tree-sitter-grpc-nvim",
    revision = "master",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "grpcnvim",
}

local grpc_group = vim.api.nvim_create_augroup("grpc", { clear = true })
vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    group = grpc_group,
    pattern = { '*.grpc' },
    command = 'set ft=grpcnvim'
  }
)
