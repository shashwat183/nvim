vim.opt["conceallevel"] = 0 -- make it so asterisks(*) are visible in markdown and other files.

-- search options
vim.opt["hlsearch"] = true -- highlight searched word
vim.cmd([[highlight Search ctermfg=0 ctermbg=11 guifg=#f2f4f8 guibg=#525253]]) -- highlight group for all matches
vim.cmd([[highlight CurSearch ctermfg=0 ctermbg=10 guifg=black guibg=lightgreen]]) -- highlight group for matches under cursor  
vim.opt["ignorecase"] = true -- ignore case in search patterns
vim.opt["smartcase"] = true -- override ignorecase(if its turned on) on when search pattern has upper case letters. does not apply to * search

-- indentation options
vim.opt["smartindent"] = true -- smart autoindenting when starting a new line
vim.opt["expandtab"] = true -- convert tabs to spaces
vim.opt["shiftwidth"] = 2 -- number of spaces for indentation

-- split windows options
vim.opt["splitbelow"] = true -- force all horizontal splits to go below current window
vim.opt["splitright"] = true -- force all vertical splits to go to the right of current window

-- line numbering options
vim.opt["number"] = true -- set linenumbers
vim.opt["relativenumber"] = true -- set relativelinenumber
vim.opt["numberwidth"] = 2 -- number column width
vim.opt["signcolumn"] = "auto:5" -- always show sign column

-- visual mode options
vim.cmd([[highlight Visual guibg=#4e4e4e]]) -- highlight group for visual mode selection

-- Lsp InlayHint highlight options
vim.cmd([[highlight LspInlayHint guibg=NONE guifg=#6e6f70]]) -- highlight group for visual mode selection

-- miscellaneous
vim.opt["mouse"] = "" -- turn off mouse support completely
vim.opt["showmode"] = false -- we don't need to see things like -- INSERT -- anymore
vim.opt["swapfile"] = false -- don't create swapfiles
vim.opt["termguicolors"] = true -- Enables 24-bit RGB color in the |TUI|.  Uses "gui" |:highlight| attributes instead of "cterm" attributes.
vim.opt["timeoutlen"] = 200 -- time to wait for a mapped sequence to complete
vim.opt["undofile"] = true -- enable persistent undo
vim.opt["updatetime"] = 300 -- reduced updatetime reduces time for CursorHold trigger. Usefull in autocomplete.
vim.opt["writebackup"] = false -- if a file is changed by another program(or being edited), it is not allowed to be edited by vim
vim.opt["cursorline"] = false -- highlight the current line
vim.opt["wrap"] = false -- no wrapping, display lines as one long line
vim.opt["scrolloff"] = 8 -- keep context around cursor when scrolling
vim.opt["sidescrolloff"] = 20 -- context around cursor when side scrolling(towards right) when nowrap is set
vim.opt["laststatus"] = 3 -- single statusline for entire editor
vim.opt["guifont"] = "JetBrainsMono Nerd Font Mono:h16" -- the font used in graphical neovim applications

vim.cmd("set whichwrap+=<,>,[,],h,l")
