require('nvim-tree').setup({
  hijack_unnamed_buffer_when_opening = false,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 50,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})
