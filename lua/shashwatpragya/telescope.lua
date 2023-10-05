require('telescope').setup({
  defaults = {
    file_ignore_patterns = { '^node_modules/', '.class', '^build/', '^bin/', '^.git/', '^vendor/', '^target/', '^venv/', '^sam/', '^.idea/', '%.settings', 'mvnw', 'mvnw.cmd', '.factorypath', '.project' , '.iml' },
    sorting_strategy = "ascending",
    prompt_prefix = " ",
    selection_caret = " ",
    layout_config = {
      prompt_position = 'top',
      horizontal = { width = 0.9, height = 0.98, prompt_position = 'top'},
      vertical = {},
    },
  },
})
