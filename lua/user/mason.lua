local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end
local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

mason.setup()
mason_lspconfig.setup()

mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        lspconfig[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    --[[ ["rust_analyzer"] = function () ]]
    --[[     require("rust-tools").setup {} ]]
    --[[ end ]]
}
