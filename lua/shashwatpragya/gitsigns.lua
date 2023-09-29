require('gitsigns').setup({
  signs = {
    add = { text = "▎",  },
    change = {  text = "▎" },
    delete = {  text = "契" },
    topdelete = {  text = "契" },
    changedelete = { text = "▎" },
  },
  numhl = true,
  linehl = true,
  current_line_blame_opts = {
    delay = 200,
  }
})
