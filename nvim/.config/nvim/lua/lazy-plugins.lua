-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration
  'nvim-tree/nvim-web-devicons',

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  -- toggleterm
  {
    'akinsho/toggleterm.nvim', version = "*", config = true
  },
  {
    'xeluxee/competitest.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
  },
  --  Ruby Stuff
  'vim-ruby/vim-ruby',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  {
    -- Autocompletion
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
    end
  },

  -- formater
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  -- nvim osc52 clipboard
  {
   'ojroques/nvim-osc52'
  },
  -- ntree

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Color Scheme
  'gruvbox-community/gruvbox',
  'luisiacc/gruvbox-baby',
  "lunarvim/darkplus.nvim",
  "LunarVim/lvim-themes",
  "lunarvim/lunar.nvim",

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    'j-hui/fidget.nvim', opts = {}
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    opts = {}
  },

  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { "lukas-reineke/indent-blankline.nvim", 
    main = "ibl", 
    opts = {}
  },
  
  {  "L3MON4D3/LuaSnip",  
      -- follow latest release.
      version = "v2.*",
      -- Replace <CurrentMajor> by the latest released major (first number of latest release)  
      --install jsregexp (optional!).
      build = "make install_jsregexp" },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',         opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-treesitter/nvim-treesitter-textobjects',
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-lua/plenary.nvim'
  },

      {         'barrett-ruth/live-server.nvim',         build = 'npm global add live-server',         config = true     },
  {
    'numToStr/Comment.nvim',
  },
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  {
    'ray-x/navigator.lua',
    dependencies = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
  }
})
