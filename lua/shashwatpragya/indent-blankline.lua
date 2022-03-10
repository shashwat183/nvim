vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }

return require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true,
    -- show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
}
