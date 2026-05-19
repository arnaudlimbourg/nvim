  local ts = require('nvim-treesitter')

  ts.install({
    'lua', 'vim', 'vimdoc', 'python', 'javascript', 'typescript',
    'elixir', 'toml', 'yaml', 'json', 'tsx', 'xml',
  })

  local fts = {
    'lua', 'vim', 'help', 'python', 'javascript', 'typescript',
    'elixir', 'toml', 'yaml', 'json', 'tsx', 'xml',
  }

  vim.api.nvim_create_autocmd('FileType', {
    pattern = fts,
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  local ok, to = pcall(require, 'nvim-treesitter-textobjects')
  if ok then
    to.setup({
      select = {
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    })
    vim.keymap.set({ 'x', 'o' }, 'af', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'if', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ac', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function()
  require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects') end)
end
