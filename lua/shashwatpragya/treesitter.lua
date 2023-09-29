require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c", "lua", "python",
    "markdown", "go",
    "gomod", "gosum", "java",
    "groovy", "xml", "http",
    "css", "json", "javascript",
    "typescript", "bash", "http"
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
        ["ir"] = { query = "@parameter.inner", desc = "Select inside parameter" },
        ["iq"] = { query = "@conditional.inner", desc = "Select inside conitional statement" },
        ["aq"] = { query = "@conditional.outer", desc = "Select around conditional statement" },
        ["il"] = { query = "@loop.inner", desc = "Select inside loop" },
        ["al"] = { query = "@loop.outer", desc = "Select aroud loop" },
      },
    },
  },
})
