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
    side = "right",
    width = 50,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  },
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})
