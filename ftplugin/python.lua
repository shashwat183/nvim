if pcall(require, "python_local") then
	require("python_local")
end
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
