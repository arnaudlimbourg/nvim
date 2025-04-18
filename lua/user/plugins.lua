local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },

  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  -- 'lewis6991/impatient.nvim'  -- Speed up loading Lua modules in Neovim to improve startup time.

  -- Colorschemes
  'shaunsingh/nord.nvim',  -- darkish theme
  { "catppuccin/nvim", name = "catppuccin" },  -- light theme
  { 'rose-pine/neovim', name = 'rose-pine' },  -- another light theme

  -- Completion
  {'ms-jpq/coq_nvim', branch="coq"},  -- fast autocompletion
  {'ms-jpq/coq.artifacts', branch="artifacts"},  -- snippets and other bits for the autocompletion engine

  {
    "williamboman/mason.nvim", -- Portable package manager for Neovim that runs everywhere Neovim runs
    "williamboman/mason-lspconfig.nvim", -- closes some gaps that exist between mason.nvim and lspconfig
    "neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
  },
  -- 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  -- 'nvimtools/none-ls.nvim' -- for formatters and linters
  -- 'github/copilot.vim'  -- AI model for pair programming
  'RRethy/vim-illuminate', -- Highlight all instances of the word under the cursor
  -- 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- 'rafamadriz/friendly-snippets' -- Collection of snippets

  -- -- Tests integration
  -- {
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   }
  -- }
  -- 'mfussenegger/nvim-dap'  -- debugging protocol
  -- 'mfussenegger/nvim-dap-python'  -- python debugging support

  -- Make using git easier
  'tpope/vim-fugitive', -- Git commands in nvim
  -- 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Add git related info in the signs columns and popups

  -- Improved editing experience
  'numToStr/Comment.nvim', -- Easily comment stuff
  'JoosepAlviste/nvim-ts-context-commentstring', -- setting the commentstring option based on the cursor location in the file
  'tpope/vim-repeat',  -- Repeat.vim remaps . in a way that plugins can tap into it.
  'tpope/vim-surround', --  mappings to easily delete, change and add such surroundings in pairs
  'tweekmonster/braceless.vim', -- Text objects, folding, and more for Python and other indented languages.
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}, -- Highlight, edit, and navigate code using a fast incremental parsing library
  'nvim-treesitter/nvim-treesitter-textobjects', -- Additional textobjects for treesitter
  'p00f/nvim-ts-rainbow', -- Rainbow parentheses for neovim using tree-sitter.
  'windwp/nvim-autopairs', -- A super powerful autopair plugin for Neovim that supports multiple characters.

  -- UI to select things (files, grep results, open buffers...)
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },  -- Find anything
  -- 'jvgrootveld/telescope-zoxide'  -- Operate zoxide within Neovim.
  {'ms-jpq/chadtree', branch = 'chad', run = '/usr/local/bin/python3 -m chadtree deps'},  -- File explorer
  'ahmedkhalf/project.nvim',  -- project management with telescope integration
  {'akinsho/bufferline.nvim', version="v3.*", dependencies = 'kyazdani42/nvim-web-devicons'},  -- A snazzy 💅 buffer line (with minimal tab integration)

  -- Spruce up neovim UI
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  'goolord/alpha-nvim',  -- alpha is a fast and fully customizable greeter for neovim.
  'kyazdani42/nvim-web-devicons',  -- fancy icons

  -- terminal
  -- {'akinsho/toggleterm.nvim', branch='main'}

  -- Work with databases
  -- use('tpope/vim-dadbod')
  -- use('kristijanhusak/vim-dadbod-ui')

  -- Misc
  'folke/which-key.nvim',  -- show help to see what key is mapped to which action
  'wakatime/vim-wakatime',  -- track time spent (for fun only, though can be used to invoice)
  'editorconfig/editorconfig-vim',  -- support for project specific coding standards
  'polarmutex/beancount.nvim',  -- beancount accounting files
  'norcalli/nvim-colorizer.lua',  -- color highlighter
})