local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" },
  { "nvim-tree/nvim-web-devicons", commit = "4709a504d2cd2680fb511675e64ef2790d491d36" },
  { "nvim-tree/nvim-tree.lua", commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c" },
  { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" },
  { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" },
  { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" },
  { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
  { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" },
  { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },
  { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },
	{ "folke/which-key.nvim", commit = "5224c261825263f46f6771f1b644cae33cd06995" },

  -- Colorschemes
  { "folke/tokyonight.nvim", commit = "a0abe53df53616d13da327636cb0bcac3ea7f5af" },
  { "ellisonleao/gruvbox.nvim", commit = "73f009df5ed929a853244c413bb52c1d02c117ce" },
  { "neanias/everforest-nvim" },
  { "rebelot/kanagawa.nvim", commit = "4c8d48726621a7f3998c7ed35b2c2535abc22def" },

  -- cmp plugins
  { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }, -- The completion plugin
  { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
  { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
  { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" },
  { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },

  -- snippets
  { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" },
  { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" },

  -- LSP
  { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" },
  { "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f" },
  { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" },
  { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" },
  { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" },
  { "simrat39/rust-tools.nvim", commit = "bd1aa99ffb911a1cf99b3fcf3b44c0391c57e3ef" },

  -- Lua
  { 
    "folke/trouble.nvim", 
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
    commit = "3b754285635a66a93aeb15fa71a23417d8997217" 
  },
  { "folke/neodev.nvim", commit = "6d362921d772963e5a5e5ed0fcf82153defaf206" },

  -- Telescope
  { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac"},

  -- Git
  { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" },

  -- DAP
  { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" },
  { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" },
  { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" },
  { "leoluz/nvim-dap-go", commit = "b4ded7de579b4e2a85c203388233b54bf1028816" },
  { "theHamsta/nvim-dap-virtual-text", commit = "8db23ea51203b5f00ad107a0cef7e0b2d7a0476c" },
}

local opts = {}

require("lazy").setup(plugins, opts)
