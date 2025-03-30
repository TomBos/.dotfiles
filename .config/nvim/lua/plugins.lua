return {
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = { "nvim-lua/plenary.nvim" } },
  
  -- NeoTree plugin
  require("config.neo_tree"),

  -- Lualine
  require("config.lualine"),

  -- One Dark Color theme
  require("config.one_dark"),

}
