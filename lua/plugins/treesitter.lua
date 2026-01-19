return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enable = true, disable = { "yaml", "python" } },
      highlights = { enable = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = { move = { enable = false } },
  },
}
