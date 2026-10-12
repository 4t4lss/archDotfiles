return{
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 
    'nvim-treesitter/nvim-treesitter', 
    'nvim-tree/nvim-web-devicons' -- <-- MOST COMMON: Keep this if using nvim-web-devicons
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {}, -- Empty opts triggers the default automatic setup
}
