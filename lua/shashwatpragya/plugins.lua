-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Have packer use a popup window
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Useful lua functions used ny lots of plugins -> https://github.com/nvim-lua/plenary.nvim
  use "nvim-lua/plenary.nvim"
  -- Autopairs(automatically create pairs), integrates with both cmp and treesitter -> https://github.com/windwp/nvim-autopairs
  use "windwp/nvim-autopairs"
  -- Plugin for code commenting -> https://github.com/terrortylor/nvim-comment
  use "terrortylor/nvim-comment"
  -- Plugin for devicons -> https://github.com/kyazdani42/nvim-web-devicons
  use "kyazdani42/nvim-web-devicons"
  -- Plugin for tree based explorer -> https://github.com/kyazdani42/nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
  }
  use {
    'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use "akinsho/bufferline.nvim"
  use {"akinsho/toggleterm.nvim"}
  use "ahmedkhalf/project.nvim"
  -- Plugin for Speeding up loading lua modules -> https://github.com/lewis6991/impatient.nvim
  use 'lewis6991/impatient.nvim'
  -- Plugin to add indentation lines on the screen(very cool stuff) -> https://github.com/lukas-reineke/indent-blankline.nvim
  use "lukas-reineke/indent-blankline.nvim"
  -- Plugin to add greeting dashboard when nvim without a file or folder -> https://github.com/goolord/alpha-nvim
  use {'goolord/alpha-nvim'}
  use "folke/which-key.nvim" -- Which key plugin

  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim" }
  use 'Mofiqul/dracula.nvim'
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use 'navarasu/onedark.nvim'
  use "rebelot/kanagawa.nvim"
  use({ 'rose-pine/neovim',
    as = 'rose-pine',
    tag = 'v1.*',
  })

  -- Telescope
  use 'nvim-telescope/telescope.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use {'lewis6991/gitsigns.nvim'}
  use 'kdheepak/lazygit.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "jose-elias-alvarez/null-ls.nvim"
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json
  use "b0o/schemastore.nvim" -- Plugin provides largest collection of json schemas

  -- nvim jdtls
  use 'mfussenegger/nvim-jdtls'

  -- Coc.nvim for Java
  -- use {'neoclide/coc.nvim', branch = 'release'}

  -- Outline
  use "simrat39/symbols-outline.nvim"
  -- require("packer").sync()
end)
