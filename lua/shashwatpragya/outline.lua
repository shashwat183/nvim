require('outline').setup({
  outline_window = {
    -- Where to open the split window: right/left
    position = 'right',
    -- Auto close the outline window if goto_location is triggered and not for
    -- peek_location
    auto_close = true,
    -- -- Automatically scroll to the location in code when navigating outline window.
    -- auto_jump = true,
    width = 35,
  }
})
