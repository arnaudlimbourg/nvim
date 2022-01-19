local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'lewis6991/impatient.nvim'  -- Speed up loading Lua modules in Neovim to improve startup time.

  -- Colorschemes
  use 'shaunsingh/nord.nvim'  -- current theme, very soothing

  -- Completion
  use {'ms-jpq/coq_nvim', branch="coq"}  -- fast autocompletion
  use {'ms-jpq/coq.artifacts', branch="artifacts"}  -- snippets and other bits for the autocompletion engine
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
  use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  -- use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- use 'rafamadriz/friendly-snippets' -- Collection of snippets

  -- Tests integration
  use { 'rcarriga/vim-ultest', requires = {'vim-test/vim-test'}, run = ':UpdateRemotePlugins' }
  use 'mfussenegger/nvim-dap'  -- debugging protocol
  use 'mfussenegger/nvim-dap-python'  -- python debugging support

  -- Make using git easier
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups

  -- Improved editing experience
  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- setting the commentstring option based on the cursor location in the file
  use 'tpope/vim-repeat'  -- Repeat.vim remaps . in a way that plugins can tap into it.
  use 'tpope/vim-surround' --  mappings to easily delete, change and add such surroundings in pairs
  use 'tweekmonster/braceless.vim' -- Text objects, folding, and more for Python and other indented languages.
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
  use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses for neovim using tree-sitter.
  use 'windwp/nvim-autopairs' -- A super powerful autopair plugin for Neovim that supports multiple characters.

  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }  -- Find anything
  use {'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps'}  -- File explorer
  use 'ahmedkhalf/project.nvim'  -- project management with telescope integration
  use 'akinsho/bufferline.nvim'  -- A snazzy 💅 buffer line (with minimal tab integration)

  -- Spruce up neovim UI
  use 'itchyny/lightline.vim' -- Fancier statusline
  use 'goolord/alpha-nvim'  -- alpha is a fast and fully customizable greeter for neovim.
  use 'kyazdani42/nvim-web-devicons'  -- fancy icons

  -- terminal
  use 'akinsho/toggleterm.nvim'

  -- Work with databases
  use('tpope/vim-dadbod')
  use('kristijanhusak/vim-dadbod-ui')

  -- Misc
  use 'folke/which-key.nvim'  -- show help to see what key is mapped to which action
  use 'wakatime/vim-wakatime'  -- track time spent (for fun only, though can be used to invoice)
  use 'editorconfig/editorconfig-vim'  -- support for project specific coding standards

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
