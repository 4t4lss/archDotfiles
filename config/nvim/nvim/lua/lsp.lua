---------------------
---- ENABLE LSP  ----
---------------------
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")
vim.lsp.enable("basedpyright")


vim.diagnostic.config({
  virtual_text = true, -- Shows the warning text right next to the code
  update_in_insert = false, -- Don't flash warnings while you are typing
  underline = true,    -- Underline the offending code
})

