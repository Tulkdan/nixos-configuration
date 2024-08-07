return {
  "folke/whick-key.nvim",
  build = ":TSUpdate",
  url = 'git@github.com:folke/which-key.nvim.git',
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)"
    }
  }
}
