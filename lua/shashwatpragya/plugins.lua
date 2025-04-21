local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- telescope fuzzy finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  -- nightfox theme, I like the carbonfox dark theme from this plugin
  { 'EdenEast/nightfox.nvim',   priority = 1000 },
  -- lualine for statusline
  { 'nvim-lualine/lualine.nvim' },
  -- treesitter for advanced syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
  },
  -- transparent background
  {
    'xiyaowong/transparent.nvim',
    config = function()
      vim.cmd('TransparentEnable')
    end,
  },
  -- restclient I like using it for making http calls
  {
    'rest-nvim/rest.nvim',
    tag = '0.2',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- grpc client I like using it for making grpc calls using grpcurl
  {
    "hudclark/grpc-nvim",
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  -- -- nvim tree - a better filetree
  { 'nvim-tree/nvim-tree.lua' },
  -- nice icons
  { 'nvim-tree/nvim-web-devicons' },
  -- smoooothhh scrolling
  { 'karb94/neoscroll.nvim' },
  -- preview markdown files using glow cmd
  {
    'ellisonleao/glow.nvim',
    config = true,
    cmd = 'Glow'
  },
  --  indentation guides with colored context etc
  { 'lukas-reineke/indent-blankline.nvim', tag = 'v2.20.8' },
  -- fancy todo highlights and commands
  { 'folke/todo-comments.nvim',            dependencies = { 'nvim-lua/plenary.nvim' } },
  -- ui improvements for things like rename, select etc
  { 'stevearc/dressing.nvim' },
  -- nicer view for diagnostics, references etc
  { 'folke/trouble.nvim',                  dependencies = { 'nvim-tree/nvim-web-devicons' } },
  -- 'gc' to comment visual regions/lines
  { 'numToStr/Comment.nvim',               opts = {} },
  -- automatic closing braces and quotes
  { 'windwp/nvim-autopairs',               event = 'InsertEnter' },
  -- harpoon for switching quickly between files
  { 'ThePrimeagen/harpoon',                dependencies = { 'nvim-lua/plenary.nvim' } },
  -- which key
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- schema store schemas for jsonls and yamlls
  { 'b0o/schemastore.nvim' },

  -- git related plugins
  { 'lewis6991/gitsigns.nvim' },
  -- tpope's git plugin, minimal use most
  -- features are provided by gitsigns
  { 'tpope/vim-fugitive' },
  -- enable fugitive GBrowse for github urls
  { 'tpope/vim-rhubarb' },
  -- enable fugitive GBrowse for bitbucker urls
  { 'tommcdo/vim-fubitive' },
  -- tokyonight colorscheme
  { 'folke/tokyonight.nvim' },
  -- glowing colorscheme
  { 'scottmckendry/cyberdream.nvim' },


  -- lsp related plugins
  {
    -- lsp configs and plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- automatically install lsps to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      -- useful status updates for lsp
      { 'j-hui/fidget.nvim',       tag = 'legacy' },
      -- additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- nvim-jdtls custom plugin to setup jdtls for java
  { 'mfussenegger/nvim-jdtls' },
  -- formatter provider
  { 'stevearc/conform.nvim' },
  -- install formatters configured in conform using mason
  { 'zapling/mason-conform.nvim' },
  -- linting provider
  { 'mfussenegger/nvim-lint' },
  -- install linters configured in nvim-lint using mason
  { 'rshkarin/mason-nvim-lint' },

  -- installs useful tools for go development
  {
    'olexsmir/gopher.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim'
    }
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
      -- buffer completions
      'hrsh7th/cmp-buffer',
      -- path completions
      'hrsh7th/cmp-path',
    },
  },
  { 'laytan/cloak.nvim' }, -- hide sensitive stuff
  { 'ThePrimeagen/vim-be-good' },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
  },
  {
    "sphamba/smear-cursor.nvim",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },

  -- avante.nvim
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}, {
  install = {
    missing = false, -- don't just install a new plugin at startup
  },
})
