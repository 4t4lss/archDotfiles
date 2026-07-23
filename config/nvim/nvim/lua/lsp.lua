---------------------
---- ENABLE LSP  ----
---------------------
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("neocmake")
vim.lsp.enable("basedpyright")

---------------------
-- SYMBOLS CHANGE  --
---------------------
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
})

vim.diagnostic.config({
  virtual_text = true, -- Shows the warning text right next to the code
  update_in_insert = false, -- Don't flash warnings while you are typing
  underline = true,    -- Underline the offending code
})

vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { desc = "See available code actions" })
