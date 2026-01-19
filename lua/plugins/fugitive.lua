return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Git status" },
      { "<leader>gdm", "<cmd>Gvdiffsplit dev:%<cr>", desc = "[g]it [d]iff [m]ain" },
      { "<leader>gmm", "<cmd>Git mergetool<cr>" },
      { "<leader>gl", "<cmd>Git log -n 20<cr>" },
      { "<leader>gw", "<cmd>Git blame<cr>" },
    },
    lazy = false,
  },
  {
    "tpope/vim-rhubarb",
    lazy = false,
  },
}
