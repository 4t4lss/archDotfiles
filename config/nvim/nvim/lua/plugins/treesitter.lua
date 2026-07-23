return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter'.setup {
    auto_install = true,
    -- ensure_installed = {"lua" , "cpp"},
    highlight = { enable = true },
    indent = { enable = true },
  }
  end
}
