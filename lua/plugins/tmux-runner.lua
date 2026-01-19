return {
  {
    "christoomey/vim-tmux-runner",
    keys = {
      { "<leader>vtra", "<cmd>VtrAttachToPane<cr>", desc = "VTR [A]ttach" },
      { "<leader>sp", "vip:VtrSendLinesToRunner<cr>", desc = "[s]end [p]aragraph" },
      { "<leader>sal", "mzggVG:VtrSendLinesToRunner<cr>`z:delm z<cr>", desc = "[s]end [a]ll [l]ines to VTR runner" },
      { "<leader>sll", "V:VtrSendLinesToRunner<cr>`", desc = "[s]end [a]ll [l]ines to VTR runner" },
    },
    lazy = false,
  },
}
