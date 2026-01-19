return {
  "MagicDuck/grug-far.nvim",
  opts = {
    transient = true,
  },
  keys = {
    {
      "<leader>Sr",
      function()
        local word = vim.fn.expand("<cword>")
        require("grug-far").open({
          -- optional: prefill a search term from visual selection
          prefills = {
            search = word,
            filesFilter = [[*.py
!**/tests/**
!**/migrations/**]],
          },
        })
      end,
      desc = "Search with GrugFar excluding tests",
    },
    {
      "<leader>satd",
      function()
        local word = vim.fn.expand("<cword>")
        require("grug-far").open({
          -- optional: prefill a search term from visual selection
          prefills = {
            search = "^ *def " .. word .. "\\(",
            filesFilter = [[*.py]],
          },
        })
      end,
      desc = "Search with GrugFar excluding tests",
    },
  },
}
