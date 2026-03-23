local servers = {
	"lua_ls",
	"cssls",
	"html",
	"ts_ls",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

for _, server in pairs(servers) do
	local name = vim.split(server, "@")[1]

	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. name)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	vim.lsp.config(name, require("coq").lsp_ensure_capabilities(opts))
end

vim.lsp.enable(servers)

