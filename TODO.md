# TODO

- [] Decide between nvim-tree and neotree
- [] Did first pass of avante.nvim, pretty useless. I would like the ability to chat to gemini and provide code from editor to it to ask questions.
- [] Fix issue - rest.nvim http treesitter syntax highlighting
- [] Maybe use move options in treesitter textobjects
- [] Custom treesitter pickers for find_files with a specific suffix like *.go. The scenario here is when I want to do file search for only go files, go and go test files, jus infra files etc.
- [] Custom treesitter picket that gives us lsp_references but ignores _test.go files(and equivalent in other languages). And also an option where it doesn't ignore(what we have now).

# Done

- [x] Path based completion in nvim-cmp.
- [x] Buffer based completion in nvim-cmp.
- [x] indent-blankline contextual highlighting like in nvchad(looks much better than the line based highlighting in current config)
- [x] Install autopairs
- [x] Diagnostics in nvim-tree |Note| -  Just doesn't work for lua(don't care) and jdtls(probably need to configure more).
- [x] Pyright fidget integration
- [x] Install which-key
- [x] In keymaps, change the opts var to a function that accepts a desc string and return a new opts map with same values plug the desc.
- [x] Signature help is not working in Java(jdtls). Investigate.
- [x] Hamcrest imports are not detected by autocompletion. Have to manually specify the parent package
- [x] XML lsp setup
- [x] JSON lsp setup
- [x] More lsp config stuff to be pulled out of old config
- [x] Typescript lsp setup
- [x] Git plugins - vimfugitive(its amazing) -> checkout this video - https://www.youtube.com/watch?v=uUrKrYCAl1Y, vim-rhubarb
- [x] Checkout nvim-treesitter-textobjects(it is setup in kickstart config so use that to understand better)
