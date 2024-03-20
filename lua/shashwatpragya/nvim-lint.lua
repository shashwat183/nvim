local lint = require('lint')

local shellcheck = require('lint').linters.shellcheck
shellcheck.args = {
  '-x',
  '--format', 'json',
  '-',
}

lint.linters_by_ft = {
  sh = { 'shellcheck' },
  bash = { 'shellcheck' },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end
})
