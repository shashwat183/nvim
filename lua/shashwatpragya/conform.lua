require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black"},
    templ = { "templ" },
    markdown = { "deno_fmt" },
  },
})
