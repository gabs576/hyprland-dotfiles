return {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyo night",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end
}
