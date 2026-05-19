local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
  vim.o.winborder = 'rounded'

  vim.diagnostic.config({
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN]  = '',
        [vim.diagnostic.severity.HINT]  = '',
        [vim.diagnostic.severity.INFO]  = '',
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = { focusable = false, border = 'rounded' },
  })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then return end

      if client.name == 'ts_ls' or client.name == 'tsserver' or client.name == 'lua_ls' then
        client.server_capabilities.documentFormattingProvider = false
      end

      local opts = { buffer = bufnr, noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<leader>li', '<cmd>checkhealth vim.lsp<cr>', opts)
      vim.keymap.set('n', '<leader>lI', '<cmd>Mason<cr>', opts)
      vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>lj', function() vim.diagnostic.jump({ count = 1 }) end, opts)
      vim.keymap.set('n', '<leader>lk', function() vim.diagnostic.jump({ count = -1 }) end, opts)
      vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts)

      local ok, illuminate = pcall(require, 'illuminate')
      if ok then illuminate.on_attach(client) end
    end,
  })
end

return M
