require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_b = {
      "branch",
      {
        "diff",
        colored = true, -- displays a coloured diff status
      },
      {
        "diagnostics",
        symbols = { error = "", warn = "", info = "", hint = "" },
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = '●',
          readonly = '-',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      },
    },
  },
})
