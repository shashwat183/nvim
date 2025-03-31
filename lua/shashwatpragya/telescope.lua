local trouble = require("trouble.providers.telescope")

require('telescope').setup({
  defaults = {
    -- using .ignore file in parent `Code` directory
    file_ignore_patterns = {},
    -- sorting_strategy = "ascending",
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    prompt_prefix = " ",
    selection_caret = " ",
    layout_config = {
      prompt_position = 'bottom',
      horizontal = { width = 0.9, height = 0.98, prompt_position = 'bottom' },
      vertical = {},
    },
  },
})
