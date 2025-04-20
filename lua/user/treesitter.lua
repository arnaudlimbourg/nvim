local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- Change this line from a string to a list
  ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "typescript", "elixir", "toml", "yaml", "json", "tsx", "xml" }, -- Replace with languages you actually use
  -- Or use this for a more minimal set of parsers
  -- ensure_installed = {}, -- Empty list, then manually install only what you need
  
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { "" } },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

