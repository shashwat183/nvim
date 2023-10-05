require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "python",
    "markdown", "go",
    "gomod", "gosum", "java",
    "groovy", "xml", "http",
    "css", "json", "javascript",
    "typescript", "bash", "http", "hcl"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "Select around function" },
        ["if"] = { query = "@function.inner", desc = "Select inside function" },
        ["ic"] = { query = "@class.inner", desc = "Select inside class" },
        ["ac"] = { query = "@class.outer", desc = "Select around class" },
        ["a/"] = { query = "@comment.outer", desc = "Select around comment" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inside parameter" },
        ["iq"] = { query = "@conditional.inner", desc = "Select inside conitional statement" },
        ["aq"] = { query = "@conditional.outer", desc = "Select around conditional statement" },
        ["il"] = { query = "@loop.inner", desc = "Select inside loop" },
        ["al"] = { query = "@loop.outer", desc = "Select aroud loop" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["<leader>nf"] = "@function.outer",
        ["<leader>nc"] = "@class.outer",
        ["<leader>na"] = "@parameter.outer",
        ["<leader>nq"] = "@conditional.outer",
        ["<leader>nl"] = "@loop.outer",
      },
      goto_previous_start = {
        ["<leader>pf"] = "@function.outer",
        ["<leader>pc"] = "@class.outer",
        ["<leader>pa"] = "@parameter.outer",
        ["<leader>pq"] = "@conditional.outer",
        ["<leader>pl"] = "@loop.outer",
      }
    },
  },
})
