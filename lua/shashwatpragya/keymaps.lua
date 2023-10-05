-- basic keymaps
-- what is noremap? - https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

-- noremap just to be safe and not end up with recursive mappings
-- silent so no messages are shown.
local function options(desc)
  local o = { noremap = true, silent = true }
  if (desc == nil) then
    return o
  end
  local p = { noremap = true, silent = true , desc = desc}
  return p
end

-- jj for Escape
vim.keymap.set("i", "jj", "<ESC>", options("jj for Escape"))
-- <Space> for leader
vim.keymap.set("", "<Space>", "<Nop>", options("leader"))
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- git related keymaps
vim.keymap.set('n', '<leader>gj', require('gitsigns').next_hunk, options("[G]it next hunk"))
vim.keymap.set('n', '<leader>gk', require('gitsigns').prev_hunk, options("[G]it prev hunk"))
vim.keymap.set('n', '<leader>gl', require('gitsigns').toggle_current_line_blame, options("[G]it toggle blame line"))
vim.keymap.set('n', '<leader>gp', require('gitsigns').preview_hunk, options("[G]it preview hunk"))
vim.keymap.set('n', '<leader>gr', require('gitsigns').reset_hunk, options("[G]it reset hunk"))
vim.keymap.set('n', '<leader>gR', require('gitsigns').reset_buffer, options("[G]it reset buffer"))
vim.keymap.set('n', '<leader>gs', require('gitsigns').stage_hunk, options("[G]it stage hunk"))
vim.keymap.set('n', '<leader>gu', require('gitsigns').undo_stage_hunk, options("[G]it undo stage hunk"))
vim.keymap.set('n', '<leader>gS', require('gitsigns').stage_buffer, options("[G]it stage buffer"))
vim.keymap.set('n', '<leader>gU', require('gitsigns').reset_buffer_index, options("[G]it unstage buffer"))
vim.keymap.set('n', '<leader>gd', function() vim.cmd("Gvdiffsplit HEAD") end, options("[G]it unstage buffer"))
vim.keymap.set('n', '<leader>gh', function() require('gitsigns').toggle_linehl() require('gitsigns').toggle_numhl() end, options("[G]it toggle line highlight"))

-- aerial code outline keymaps
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>', { desc = '[A]erial [T]oggle'})

-- restclient keymaps
vim.keymap.set('n', '<leader>rr', require('rest-nvim').run, options("[R]estclient run"))

-- telescope keymaps
vim.keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files({ path_display={'absolute'}, layout='horizontal', hidden=true, no_ignore=true }) end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').buffers({ path_display={'absolute'}, layout='horizontal', hidden=true, no_ignore=true }) end, { desc = '[S]earch [Buffers]' })
vim.keymap.set('n', '<leader>F', function() require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({})) end, { desc = '[S]earch by [G]rep' })

-- harpoon keymaps
vim.keymap.set('n', '<leader>hm', require('harpoon.mark').add_file, options("[H]arpoon mark current file"))
vim.keymap.set('n', '<leader>hq', require('harpoon.ui').toggle_quick_menu, options("[H]arpoon toggle quick menu"))
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev, options("[H]arpoon prev"))
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next, options("[H]arpoon next"))

-- nvim tree keymaps
vim.keymap.set("n", "<leader>e", function() vim.cmd('NvimTreeToggle') end, options("[N]vimTree toggle"))

-- buffer related keymaps
vim.keymap.set("n", "<leader>c", function() vim.cmd('bp | sp | bn | bd!') end, options("[B]uffer close"))

-- markdown preview using glow
vim.keymap.set('n', '<leader>mp', ':Glow<CR>', options("[M]arkdown preview"))

vim.keymap.set('n', '<leader>x', ':FidgetClose<CR>', options("[F]idget close"))

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", options())
vim.keymap.set("v", ">", ">gv", options())

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", options())
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", options())
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", options())
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", options())

-- HARD MODE --
vim.keymap.set("n", "<Left>", "<Nop>", options())
vim.keymap.set("n", "<Right>", "<Nop>", options())
vim.keymap.set("n", "<Up>", "<Nop>", options())
vim.keymap.set("n", "<Down>", "<Nop>", options())
vim.keymap.set("n", "<PageUp>", "<Nop>", options())
vim.keymap.set("n", "<Pagedown>", "<nop>", options())
vim.keymap.set("i", "<Left>", "<Nop>", options())
vim.keymap.set("i", "<Right>", "<Nop>", options())
vim.keymap.set("i", "<Up>", "<Nop>", options())
vim.keymap.set("i", "<Down>", "<Nop>", options())
vim.keymap.set("i", "<PageUp>", "<Nop>", options())
vim.keymap.set("i", "<Pagedown>", "<nop>", options())
vim.keymap.set("v", "<Left>", "<Nop>", options())
vim.keymap.set("v", "<Right>", "<Nop>", options())
vim.keymap.set("v", "<Up>", "<Nop>", options())
vim.keymap.set("v", "<Down>", "<Nop>", options())
vim.keymap.set("v", "<PageUp>", "<Nop>", options())
vim.keymap.set("v", "<Pagedown>", "<nop>", options())


-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

