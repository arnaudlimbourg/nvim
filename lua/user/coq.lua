vim.g.coq_settings = {
  keymap = {
    recommended = false,
  }
}

vim.keymap.set({ "i", "s" }, "<leader><tab>", function()
  vim.snippet.jump(1)
end)
