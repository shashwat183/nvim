vim.opt.list = true
vim.opt.listchars:append("eol:↴")

vim.cmd([[highlight IndentBlanklineChar guifg=#2a3441]])
vim.cmd([[highlight IndentBlanklineSpaceChar guifg=#2a3441]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#495360]])
vim.cmd([[highlight IndentBlanklineContextStart guibg=#313b48 cterm=NONE gui=NONE]])

return require("indent_blankline").setup({
  char = '┊',
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
})
