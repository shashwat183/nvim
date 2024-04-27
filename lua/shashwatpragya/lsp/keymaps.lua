local M = {}

M.lsp_keymaps = function(bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', function() require('trouble').open('lsp_definitions') end, '[G]oto [D]efinition')
  nmap('gr', function() require("trouble").open('lsp_references') end, '[G]oto [R]eferences')
  nmap('gI', function() require("trouble").open('lsp_implementations') end, '[G]oto [I]mplementation')
  -- nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  -- nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  -- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  nmap('<leader>tn', function() require("trouble").next({skip_groups = true, jump = true}) end, '[T]rouble [N]ext')
  nmap('<leader>tp', function() require("trouble").previous({skip_groups = true, jump = true}) end, '[T]rouble [P]rev')
  nmap('<leader>tt', function() require("trouble").toggle() end, '[T]rouble [T]oggle')
  nmap('<leader>tw', function() require("trouble").toggle("workspace_diagnostics") end, '[T]rouble [W]orkspace Diagnostics')
  nmap('<leader>td', function() require("trouble").toggle("document_diagnostics") end, '[T]rouble [D]ocument Diagnostics')

  nmap('<leader>D', function() require("trouble").open('lsp_type_definitions') end, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>li', function() vim.lsp.inlay_hint(0, nil) end, '[I]nlay [H]nts toggle')
  nmap('<leader>lc', function() vim.lsp.codelens.refresh() end, '[C]ode [L]ens refresh')
  nmap('<leader>li', function() vim.lsp.inlay_hint(0, nil) end, '[I]nlay [H]nts toggle')
  nmap('<leader>lc', function() vim.lsp.codelens.refresh() end, '[C]ode [L]ens refresh')
  nmap('<leader>lj', function() vim.diagnostic.goto_next({ float = false }) end, '[D]iagnostics [G]oto [N]ext')
  nmap('<leader>lp', function() vim.diagnostic.goto_prev({ float = false }) end, '[D]iagnostics [G]oto [P]rev')
  nmap("<leader>lD", function() vim.cmd("Trouble document_diagnostics") end, '[D]iagnostics [D]ocument [S]how')
  nmap("gl", vim.diagnostic.open_float, '[D]iagnostics show')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')
end

return M
